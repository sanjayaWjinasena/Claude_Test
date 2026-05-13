#!/bin/bash
# ============================================================
# Restore an Odoo.sh backup to local Docker instance
# ============================================================
# Usage:
#   ./docker/setup/restore_backup.sh /path/to/backup.zip jinasena_cleardb
#
# The backup.zip comes from:
#   Odoo.sh Dashboard → Your Project → Clear_DB branch → Backups → Download
# ============================================================

set -e

BACKUP_ZIP="$1"
DB_NAME="${2:-jinasena_cleardb}"

if [ -z "$BACKUP_ZIP" ]; then
    echo "Usage: $0 <backup.zip> [db_name]"
    echo "Example: $0 ~/Downloads/clear_db_backup.zip jinasena_cleardb"
    exit 1
fi

if [ ! -f "$BACKUP_ZIP" ]; then
    echo "Error: File not found: $BACKUP_ZIP"
    exit 1
fi

echo "============================================"
echo "Restoring Odoo.sh backup to Docker"
echo "Backup: $BACKUP_ZIP"
echo "Database: $DB_NAME"
echo "============================================"

# Load env
[ -f .env ] && source .env
DB_USER="${DB_USER:-odoo}"
DB_PASSWORD="${DB_PASSWORD:-odoo}"

# Step 1: Extract backup
TMPDIR=$(mktemp -d)
echo "Extracting backup..."
unzip -q "$BACKUP_ZIP" -d "$TMPDIR"

# Odoo.sh backups contain: dump.sql and a filestore/ folder
DUMP_FILE="$TMPDIR/dump.sql"
FILESTORE_DIR="$TMPDIR/filestore"

if [ ! -f "$DUMP_FILE" ]; then
    echo "Error: dump.sql not found in backup zip."
    echo "Contents of backup:"
    ls "$TMPDIR"
    rm -rf "$TMPDIR"
    exit 1
fi

# Step 2: Ensure containers are up
echo "Starting database container..."
docker compose up -d db
echo "Waiting for PostgreSQL to be ready..."
sleep 5

# Step 3: Drop existing DB if present
echo "Dropping existing database '$DB_NAME' (if exists)..."
docker compose exec -T db psql -U "$DB_USER" -c "DROP DATABASE IF EXISTS \"$DB_NAME\";" postgres || true

# Step 4: Create fresh database
echo "Creating database '$DB_NAME'..."
docker compose exec -T db psql -U "$DB_USER" -c "CREATE DATABASE \"$DB_NAME\";" postgres

# Step 5: Restore SQL dump
echo "Restoring dump.sql (this may take a few minutes)..."
docker compose exec -T db psql -U "$DB_USER" "$DB_NAME" < "$DUMP_FILE"

# Step 6: Restore filestore
ODOO_DATA_VOLUME=$(docker compose config --format json | python3 -c "import sys,json; cfg=json.load(sys.stdin); print(cfg['volumes']['odoo_data']['name'])" 2>/dev/null || echo "")

if [ -d "$FILESTORE_DIR" ] && [ -n "$ODOO_DATA_VOLUME" ]; then
    echo "Restoring filestore..."
    # Filestore goes into /var/lib/odoo/filestore/<db_name>/
    docker run --rm \
        -v "$ODOO_DATA_VOLUME:/var/lib/odoo" \
        -v "$FILESTORE_DIR:/src_filestore:ro" \
        alpine sh -c "cp -r /src_filestore /var/lib/odoo/filestore/$DB_NAME"
    echo "Filestore restored."
else
    echo "Warning: Could not restore filestore. Copy manually if needed."
    echo "  Source: $FILESTORE_DIR"
    echo "  Target: odoo_data Docker volume at /var/lib/odoo/filestore/$DB_NAME"
fi

# Step 7: Start Odoo
echo "Starting Odoo..."
docker compose up -d odoo

# Cleanup
rm -rf "$TMPDIR"

echo ""
echo "============================================"
echo "DONE! Access your instance at:"
echo "  http://localhost:${ODOO_PORT:-8069}"
echo "  Database: $DB_NAME"
echo ""
echo "Log in with your existing Odoo credentials."
echo "============================================"
