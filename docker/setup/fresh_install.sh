#!/bin/bash
# ============================================================
# Fresh Odoo 17 install with all Jinasena modules
# Use this if you DON'T have an Odoo.sh backup
# ============================================================
# Usage: ./docker/setup/fresh_install.sh [db_name]
# ============================================================

set -e

DB_NAME="${1:-jinasena_dev}"

echo "============================================"
echo "Fresh Jinasena Odoo 17 Install"
echo "Database: $DB_NAME"
echo "============================================"

[ -f .env ] && source .env

# Check enterprise folder exists
if [ ! -d "./enterprise" ] || [ -z "$(ls -A ./enterprise)" ]; then
    echo ""
    echo "ERROR: ./enterprise/ folder is empty or missing."
    echo ""
    echo "You need Odoo Enterprise source code:"
    echo "  git clone https://github.com/odoo/enterprise --branch 17.0 --depth 1 enterprise"
    echo ""
    echo "Requires your Odoo GitHub subscriber access."
    echo "See: https://www.odoo.com/documentation/17.0/administration/on_premise.html"
    exit 1
fi

# Start containers
echo "Starting containers..."
docker compose up -d

echo "Waiting for services..."
sleep 8

# Core modules to install first (Community + Enterprise base)
CORE_MODULES="account,account_accountant,helpdesk,helpdesk_fsm,helpdesk_sale,helpdesk_stock,repair,helpdesk_repair,sale,sale_management,purchase,stock,mrp,project,industry_fsm,web_studio,hr,hr_payroll,hr_payroll_account,point_of_sale,website,website_sale,maintenance"

echo "Installing core modules (this takes 5-10 minutes)..."
docker compose exec odoo odoo \
    --database "$DB_NAME" \
    --init "$CORE_MODULES" \
    --stop-after-init \
    --no-http \
    --log-level warn

# Install studio_customization (all Studio fields, views, automations)
echo "Installing studio_customization..."
docker compose exec odoo odoo \
    --database "$DB_NAME" \
    --init "studio_customization" \
    --stop-after-init \
    --no-http \
    --log-level warn

# Install Jinasena custom modules
echo "Installing jinasena_helpdesk_repair..."
docker compose exec odoo odoo \
    --database "$DB_NAME" \
    --init "jinasena_helpdesk_repair" \
    --stop-after-init \
    --no-http \
    --log-level warn

echo ""
echo "============================================"
echo "DONE! Access at: http://localhost:${ODOO_PORT:-8069}"
echo "Database: $DB_NAME"
echo ""
echo "Default admin login:"
echo "  Email:    admin"
echo "  Password: admin"
echo ""
echo "IMPORTANT: Change the admin password immediately!"
echo "============================================"
