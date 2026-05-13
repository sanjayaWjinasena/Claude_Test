# Self-Hosting Jinasena Clear_DB — Odoo 17 Enterprise

Complete guide to run a local copy of the Clear_DB staging instance on any machine.

---

## Prerequisites

| Requirement | Version | Notes |
|---|---|---|
| Docker Desktop / Docker Engine | 24+ | https://docs.docker.com/get-docker/ |
| Docker Compose | v2+ | Included with Docker Desktop |
| Git | any | For cloning Odoo Enterprise |
| Disk space | ~10 GB | Docker images + DB + filestore |
| RAM | 4 GB minimum | 8 GB recommended |
| Odoo Enterprise subscription | Active | For Enterprise source access |

---

## Folder Structure

After setup, your repo should look like this:

```
Claude_Test/                        ← this repo
├── enterprise/                     ← YOU CLONE THIS (gitignored)
├── third_party/                    ← YOU POPULATE THIS (gitignored)
│   ├── auto_database_backup/
│   ├── bi_all_in_one_stock_backdate/
│   ├── bi_view_editor/
│   ├── bi_warehouse_restrictions/
│   ├── budget_estimate_run/
│   ├── dynamic_cheque_print_ee/
│   ├── employee_loan_payroll_enterprise/
│   ├── hide_menu_user/
│   ├── hr_employee_loan/
│   ├── hr_ot_sheet/
│   ├── payroll_imports/
│   └── stock_no_negative/
├── studio_customization/           ← already in repo ✅
├── jinasena_helpdesk_repair/       ← already in repo ✅
├── helpdesk_repair_custom/         ← already in repo ✅
├── docker-compose.yml              ← already in repo ✅
├── docker/config/odoo.conf         ← already in repo ✅
└── .env                            ← YOU CREATE THIS
```

---

## Option A — Restore from Odoo.sh Backup (Recommended)

This gives you an **exact copy** of Clear_DB — all data, all configurations, all history.

### Step 1 — Clone this repo

```bash
git clone https://github.com/sanjayaWjinasena/Claude_Test.git
cd Claude_Test
```

### Step 2 — Clone Odoo Enterprise

You need your Odoo GitHub subscriber access. Log in at https://github.com/odoo/enterprise to verify access, then:

```bash
git clone https://github.com/odoo/enterprise.git --branch 17.0 --depth 1 enterprise
```

> **No access?** Go to https://www.odoo.com/odoo-enterprise-agreement → your account → GitHub access. Or contact Odoo support with your subscription details.

### Step 3 — Set up environment file

```bash
cp .env.example .env
```

Edit `.env` and set a strong database password:
```
DB_USER=odoo
DB_PASSWORD=your_strong_password_here
```

### Step 4 — Download Clear_DB backup from Odoo.sh

1. Go to https://www.odoo.sh
2. Open your project → **Clear_DB** branch (staging)
3. Click **Backups** tab
4. Click **Download** on the latest backup
5. Save the `.zip` file (e.g. `~/Downloads/clear_db_backup.zip`)

### Step 5 — Restore the backup

```bash
chmod +x docker/setup/restore_backup.sh
./docker/setup/restore_backup.sh ~/Downloads/clear_db_backup.zip jinasena_cleardb
```

This will:
- Start PostgreSQL
- Create the database
- Restore the full SQL dump
- Copy the filestore (uploaded files/images)
- Start Odoo

### Step 6 — Access your instance

Open http://localhost:8069 in your browser.

- Select database: `jinasena_cleardb`
- Log in with your existing Odoo credentials (same as Clear_DB staging)

---

## Option B — Fresh Install (No Backup)

Use this if you want a clean empty instance with all customizations installed but no data.

### Step 1–3
Same as Option A above (clone repo, clone enterprise, set up .env).

### Step 4 — Get third-party modules

```bash
chmod +x docker/setup/get_third_party.sh
./docker/setup/get_third_party.sh
```

Then manually download the modules listed in the script output from apps.odoo.com.

### Step 5 — Run fresh install

```bash
chmod +x docker/setup/fresh_install.sh
./docker/setup/fresh_install.sh jinasena_dev
```

---

## Installed Modules

### Enterprise (150 modules — from `enterprise/` folder)
These come from the Odoo Enterprise private repo. Key ones used:

| Module | Purpose |
|--------|---------|
| `web_studio` | Studio customization engine |
| `helpdesk` | Repair ticket management |
| `helpdesk_fsm` | FSM task integration |
| `helpdesk_repair` | Repair order link |
| `helpdesk_sale` | Sales order integration |
| `industry_fsm` | Field Service Management |
| `mrp_workorder` | Work order management |
| `mrp_plm` | Engineering Change Orders |
| `hr_payroll` | Payroll processing |
| `account_accountant` | Full accounting |
| `approvals` | Approval workflows |
| `sign` | Digital signatures |
| `documents` | Document management |

### Custom Jinasena Modules (from this repo)

| Module | Purpose |
|--------|---------|
| `studio_customization` | **All Studio customizations** — 2,313 fields, 392 views, 270 automations, all custom models |
| `jinasena_helpdesk_repair` | Clean code replacement for repair/helpdesk Studio fields |
| `helpdesk_repair_custom` | Earlier repair module iteration |

### Third-Party (15 modules — from `third_party/` folder)

| Module | Author | Source |
|--------|--------|--------|
| `auto_database_backup` | Cybrosys | apps.odoo.com |
| `bi_all_in_one_stock_backdate` | BROWSEINFO | apps.odoo.com |
| `bi_view_editor` | BROWSEINFO | apps.odoo.com |
| `bi_warehouse_restrictions` | BROWSEINFO | apps.odoo.com |
| `budget_estimate_run` | Chandika Rathnayake | Internal |
| `dynamic_cheque_print_ee` | Acespritech | apps.odoo.com |
| `employee_loan_payroll_enterprise` | Probuse | apps.odoo.com |
| `hide_menu_user` | Cybrosys | apps.odoo.com |
| `hr_employee_loan` | Probuse | apps.odoo.com |
| `hr_ot_sheet` | Chandika Rathnayake | Internal |
| `payroll_imports` | Chandika Rathnayake | Internal |
| `stock_no_negative` | OCA | GitHub (auto-downloaded) |

---

## Common Commands

```bash
# Start everything
docker compose up -d

# Stop everything
docker compose down

# View Odoo logs (live)
docker compose logs -f odoo

# Restart just Odoo (after changing custom modules)
docker compose restart odoo

# Update a module
docker compose exec odoo odoo --database jinasena_cleardb --update studio_customization --stop-after-init

# Update ALL custom modules
docker compose exec odoo odoo --database jinasena_cleardb \
    --update studio_customization,jinasena_helpdesk_repair,helpdesk_repair_custom \
    --stop-after-init

# Open a shell inside the Odoo container
docker compose exec odoo bash

# Open psql
docker compose exec db psql -U odoo jinasena_cleardb

# Backup your local database
docker compose exec db pg_dump -U odoo jinasena_cleardb > my_backup_$(date +%Y%m%d).sql
```

---

## Making Changes to Custom Modules

1. Edit files in `studio_customization/`, `jinasena_helpdesk_repair/`, etc.
2. Restart + update:
   ```bash
   docker compose restart odoo
   docker compose exec odoo odoo --database jinasena_cleardb \
       --update jinasena_helpdesk_repair --stop-after-init
   ```
3. Commit and push your changes to GitHub as normal.

---

## Troubleshooting

### "Error: enterprise/ folder is empty"
Clone the Odoo Enterprise repo — see Step 2. You need GitHub access via your Odoo subscription.

### "Module not found" errors on startup
Check that `./third_party/<module_name>/` exists with a `__manifest__.py` inside.

### Odoo stuck on loading / white screen
Check logs: `docker compose logs -f odoo`. Usually a missing dependency.

### Port 8069 already in use
Change the port in `.env`:  `ODOO_PORT=8070`

### Database restore fails
Ensure containers are running (`docker compose up -d db`) before running restore script.
Check that the backup zip contains `dump.sql`.

---

## Important Notes

- The `enterprise/` and `third_party/` folders are **gitignored** — they contain proprietary code that cannot be committed to a public repo.
- The `studio_customization` module in this repo is the **authoritative Studio XML export** from Clear_DB. It contains all 2,313 Studio fields, all views, automations, and custom models.
- If you restore from the Odoo.sh backup, `studio_customization` is already installed in the DB — no need to re-install it.
- To sync changes from the live Clear_DB staging instance back to your local copy, download a new backup from Odoo.sh and re-run the restore script.

---

*Setup guide for Odoo 17.0 Enterprise | Jinasena Clear_DB | Generated 2026-05-13*
