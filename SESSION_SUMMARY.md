# Session Summary — Odoo 17 Clear_DB Documentation & Dev Setup

**Environment:** Odoo.sh Dev Branch (expires in ~3 days from 2026-05-13)  
**Instance:** `rohanabalagalla-jinstage-clear-db-29834478.dev.odoo.com`  
**GitHub Repos:**
- Main docs + code: https://github.com/sanjayaWjinasena/Claude_Test
- Self-hosting setup: https://github.com/sanjayaWjinasena/odoo_enterprice_self_host

---

## What Was Done This Session

### 1. Studio Customization Inventory

Connected to the Clear_DB Staging instance via XML-RPC and inventoried **all** Studio customizations:

| Metric | Count |
|--------|-------|
| x_studio_ fields across all models | 2,580 |
| Standard Odoo models with Studio fields | 191 |
| Custom x_ models (fully bespoke) | 232 |
| Studio-modified views (arch_updated=True) | 392 across 89 models |
| Automated actions | 270 |
| Non-standard installed modules | 15 |

---

### 2. Repair / Helpdesk — Full Documentation (6 files)

All 6 files are on GitHub. Together they give a developer everything needed to rebuild the module from scratch.

| File | Size | Contents |
|------|------|----------|
| `REPAIR_HELPDESK_STUDIO_DOCUMENTATION.md` | 24.7 KB | Functional overview — 107 helpdesk.ticket fields in 15 categories, 11 custom models, process flow diagram, model relationships |
| `REPAIR_HELPDESK_TECHNICAL_REPORT.md` | 183.6 KB | Full arch_db XML for all Studio views, full Python for 43 server actions + 7 automations, 53 access rules, 38 menus |
| `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` | 202.2 KB | 17 email templates (full HTML), 28 stages, 4 ticket types, master data, user groups, SQL constraints, view inheritance chain, module structure |
| `REPAIR_HELPDESK_SUPPLEMENTARY.md` | 258.2 KB | 51 stock.picking fields, 24 project.task fields, 8 res.users fields, 11 sale.order fields; 53 server actions on related models; 12 automations; 30+ QWeb reports; developer checklist |
| `REPAIR_HELPDESK_CRITICAL_DATA.md` | 68.2 KB | Selection values (15 fields), 108 operation types, 29 repair locations, 13 service products, 7 journals, 2 GL accounts, 5 sample tickets, 29 record rules, 13 email templates, 28-stage mapping |
| `REPAIR_HELPDESK_ADDENDUM.md` | 10.4 KB | Gap analysis findings: 4 Studio approval rules, duplicate sequences, dual helpdesk teams, x_task_diagnosis empty state |

#### Key Architecture (for future developer)

```
Repair Workflow Engine = helpdesk.ticket (NOT repair.order)
  └─ 107 Studio fields (job routing, RUG, serial, stages, pricing)
  └─ Links to: project.task (FSM technician task)
               stock.picking (parts movements)
               sale.order (billing)
               repair.order (legacy link, 1 field only)

Two Repair Paths:
  Centre Repair:  Branch → receive device → diagnose → estimate → repair → return → handover
  Factory Repair: Branch → send to factory → diagnose → estimate → repair → return to branch → handover

RUG = Repair Under Guarantee (warranty repair)
  → Requires factory approval before repair starts
  → Separate GL account (RG006 on Repair Accounts - JLD)
```

#### Custom Models (13 total)
`x_repair_stages`, `x_repair_reason`, `x_repair_reason_custom`, `x_repair_sub_reason`,
`x_repair_accounts`, `x_symptom_areas`, `x_symptom_codes`, `x_diagnosis_areas`,
`x_diagnosis_codes`, `x_resolutions`, `x_conditions`, `x_task_diagnosis`

---

### 3. Module Source Code Pushed

| Module | Branch Origin | Status | Contents |
|--------|--------------|--------|----------|
| `studio_customization/` | Enterprise branch | ✅ On GitHub | Full Studio XML export — 3.2MB fields, 2.1MB views, server actions, automations, QWeb reports, approval rules, menus. **Ground truth for all customizations.** |
| `jinasena_helpdesk_repair/` | RND branch | ✅ On GitHub | In-progress clean module (~25% complete). 19 Python files (852 lines), 19 XML files (1,271 lines). |
| `helpdesk_repair_custom/` | Help_Desk branch | ✅ On GitHub | Earlier iteration. Core models + 13 server actions + 6 automations. |

---

### 4. Development Plan

`DEVELOPMENT_PLAN_2MONTHS.md` — 8-week sprint plan to build `jinasena_helpdesk_repair` from scratch.

| Week | Focus | Key Deliverable |
|------|-------|-----------------|
| 1 | Foundation | All 13 custom models, 28 stages, master data, security |
| 2 | Fields | All 107+51+24+20 fields across 6 models |
| 3 | UI | Full helpdesk.ticket form, kanban, smart buttons |
| 4 | Core Logic | 43 server actions on helpdesk.ticket |
| 5 | Related Logic | 53 server actions on stock.picking, sale.order, project.task |
| 6 | Security | 19 automations, 29 record rules, 4 approval rules |
| 7 | Reports | 17 email templates + 6 QWeb reports |
| 8 | QA | End-to-end testing, deployment |

Current module state: ~25% complete (fields partially done, core routing actions done, views partial, no reports/templates yet).

---

### 5. Bugs Found & Fixed on Staging

#### Bug 1 — Multi-company team assignment (Rohana / S00271)
**Error:** "Incompatible companies: S00271 belongs to JAM, Sales Team belongs to JLD"  
**Cause:** `_compute_team_id` on sale.order falls back to first team across ALL user companies when user has no team in active company. Returns Company 1 team for Company 2 SO.  
**Fix applied:** Set Rohana Balagalla's default sales team to a Company 2 team.  
**Code fix:** Override `action_create_sale_order` in repair module to force-set team matching SO's company.

#### Bug 2 — Kapila can't join "Warehouse - Ekala" team
**Error:** "Kapila belongs to Jinasena (Pvt) Ltd, team belongs to another company"  
**Cause:** Team 573 "Warehouse - Ekala" = Company 2 (JAM). Kapila's **primary** company = Company 1 (JLD). Odoo checks primary company, not allowed companies list.  
**Fix:** Either (a) change Kapila's primary company to JAM, or (b) use team 631 "Warehouse - Ekala JLD" (Company 1) instead.  
**Note:** Two teams with similar names serve different entities — team 573 = JAM, team 631 = JLD.

#### Bug 3 — Quotation Type & Payment Type always readonly on SO
**Error:** Fields disabled/greyed out on confirmed sale orders.  
**Cause:** View readonly expressions: `x_studio_quotation_type` → `readonly when state != 'draft'`; `x_studio_order_payment_method` → `readonly when state == 'sale' OR customer_payment_method == 'Cash'`.  
**Fix:** Fields are intentionally locked after confirmation. To edit, Reset to Draft → edit → re-confirm. OR update Studio view expression if policy should allow post-confirmation edits.

#### Bug 4 — Quotation Type & Payment Type empty on repair SOs (Root Cause)
**Error:** Both fields always empty on FSM-created repair SOs even before confirmation.  
**Cause:** Automation `"RR - Auto Generate Quotation Type for Repair SOs"` (id=176) checks `record.x_studio_project_no.x_studio_repair_project == True`. BUT Odoo FSM never sets `x_studio_project_no` when auto-creating SOs from task materials — field is always False.  
**Fix applied on staging:**
1. Patched SO S00275 (id=3860) directly via RPC → set `quotation_type='Repair'`, `order_payment_method='Cash'`
2. Fixed server action id=1995 code to detect repair SOs via FSM task link instead:
```python
task = env['project.task'].search([
    ('sale_order_id', '=', record.id),
    ('project_id.x_studio_repair_project', '=', True)
], limit=1)
if task:
    record['x_studio_quotation_type'] = 'Repair'
    record['x_studio_order_payment_method'] = record.partner_id.x_studio_payment_method
```

---

### 6. Self-Hosting Setup

Complete Docker setup to run Clear_DB locally — pushed to:  
**https://github.com/sanjayaWjinasena/odoo_enterprice_self_host**

| File | Purpose |
|------|---------|
| `docker-compose.yml` | Odoo 17 + PostgreSQL 15. Mounts: enterprise/, third_party/, repo root (custom addons) |
| `docker/config/odoo.conf` | 4-path addons_path, performance settings |
| `docker/setup/restore_backup.sh` | Restore Odoo.sh backup zip (pg_dump + filestore) to local Docker |
| `docker/setup/fresh_install.sh` | Fresh install with all modules |
| `docker/setup/get_third_party.sh` | Instructions for 15 third-party modules |
| `SELFHOST_SETUP.md` | Complete step-by-step guide |

**To run (3 steps):**
```bash
git clone https://github.com/sanjayaWjinasena/odoo_enterprice_self_host.git
cd odoo_enterprice_self_host
git clone https://github.com/odoo/enterprise --branch 17.0 --depth 1 enterprise
cp .env.example .env   # set password
./docker/setup/restore_backup.sh ~/Downloads/clear_db_backup.zip jinasena_cleardb
# → open http://localhost:8069
```

**What you must provide (not in repo — proprietary):**
- `enterprise/` — clone from github.com/odoo/enterprise (Odoo subscriber access)
- `third_party/` — 15 modules from apps.odoo.com + 3 internal Chandika modules
- Odoo.sh backup zip — download from Odoo.sh dashboard → Clear_DB branch → Backups

---

## Remaining Work (Not Yet Done)

### Other Business Domains — Not Yet Documented

From the full inventory, these domains still need documentation similar to Repair/Helpdesk:

| Domain | Key Models | Studio Fields | Priority |
|--------|-----------|---------------|----------|
| **Finance & Banking** | account.payment (119), account.move (48), account.move.line (57) | ~350 | 🔴 Highest |
| **Consignment & Import/LC** | x_consignment_* (20+ models), x_lc_header (72 fields) | ~800 | 🔴 Very High |
| **Sales & CRM** | sale.order (103), res.partner (19) | ~250 | 🔴 High |
| **Procurement** | purchase.order (51), x_purchase_request_* (12+ models) | ~400 | 🔴 High |
| **Manufacturing** | mrp.production (34), x_pump_price_costing (99 fields) | ~350 | 🟡 Medium |
| **Project Management** | project.project (17), x_structure_* (8+ models) | ~200 | 🟡 Medium |
| **HR & Payroll** | hr.contract (21), hr.employee (10) + 4 third-party modules | ~150 | 🟡 Medium |
| **Inventory/Warehouse** | stock.lot (19), product.product (46) | ~100 | 🟢 Lower |
| **TP Invoice** | x_tp_invoice_* (4 models) | ~80 | 🟢 Lower |
| **Reporting Suite (RM)** | x_rm_* (15+ models), x_bve.* | ~500 | 🟢 Lower |
| **Website/Portal** | x_website_faqs (2 models) | ~40 | 🟢 Lowest |

### Repair/Helpdesk Module — Remaining Development
See `DEVELOPMENT_PLAN_2MONTHS.md` for the full plan. Current completion ~25%:
- ❌ 52 more helpdesk.ticket fields needed
- ❌ 42 more stock.picking fields needed
- ❌ 30 more server actions on helpdesk.ticket
- ❌ 53 server actions on related models
- ❌ 17 email templates
- ❌ 6 QWeb reports
- ❌ 29 record rules
- ❌ 13 automated actions
- ❌ Studio approval rules (4)

---

## Staging Instance — Key Credentials & Info

> **Note:** This dev environment expires. All critical data has been extracted to GitHub.

| Item | Value |
|------|-------|
| Staging URL | rohanabalagalla-jinstage-clear-db-29834478.dev.odoo.com |
| Email | rohana.b@jinasena.com.lk |
| Odoo Version | 17.0+e (Enterprise) |
| GitHub Repo (docs) | https://github.com/sanjayaWjinasena/Claude_Test |
| GitHub Repo (selfhost) | https://github.com/sanjayaWjinasena/odoo_enterprice_self_host |
| Total custom modules installed | 15 (4 Jinasena + 11 third-party) |
| Total Enterprise modules installed | ~150 |
| Total Community modules installed | ~150 |

---

## How to Continue in a New Environment

When this dev environment expires, a new one will be created from the Clear_DB staging branch. To pick up where we left off:

1. **Self-hosting:** Follow `SELFHOST_SETUP.md` — download backup from Odoo.sh, restore locally.
2. **Continue documentation:** Use XML-RPC with the staging credentials above to extract data for remaining domains (Finance, Consignment, Sales, Procurement, Manufacturing).
3. **Continue module development:** Start from `jinasena_helpdesk_repair/` in the repo. Use `DEVELOPMENT_PLAN_2MONTHS.md` as the roadmap. Reference `studio_customization/data/` for all source XML.
4. **Bug fixes applied to staging:** Bug 4 (automation fix on server action id=1995) was applied directly to staging via RPC. It will need to be re-applied to any new environment or added to the module code.

---

## Repository Structure (as of 2026-05-13)

```
Claude_Test / odoo_enterprice_self_host (same content, both GitHub repos)
│
├── 📁 studio_customization/          # THE authoritative Studio export
│   ├── data/ir_model_fields.xml      # 3.2 MB — all 2,313 fields
│   ├── data/ir_ui_view.xml           # 2.1 MB — all 392 views
│   ├── data/ir_actions_server.xml    # all server actions
│   ├── data/base_automation.xml      # all automations
│   ├── data/ir_actions_report.xml    # QWeb report definitions
│   ├── data/studio_approval_rule.xml # approval gates
│   ├── data/ir_ui_menu.xml           # all menus
│   └── data/ir_model_access.xml      # access rights
│
├── 📁 jinasena_helpdesk_repair/      # Clean module (~25% done)
│   ├── models/helpdesk_ticket.py     # 55/107 fields
│   ├── models/stock_picking.py       # 9/51 fields
│   └── ...
│
├── 📁 helpdesk_repair_custom/        # Earlier iteration (reference)
│
├── 📄 REPAIR_HELPDESK_STUDIO_DOCUMENTATION.md    # Functional overview
├── 📄 REPAIR_HELPDESK_TECHNICAL_REPORT.md        # All view XML + server action Python
├── 📄 REPAIR_HELPDESK_DEVELOPER_PACKAGE.md       # Email templates + master data
├── 📄 REPAIR_HELPDESK_SUPPLEMENTARY.md           # Related models + QWeb reports
├── 📄 REPAIR_HELPDESK_CRITICAL_DATA.md           # Selections + rules + sample data
├── 📄 REPAIR_HELPDESK_ADDENDUM.md                # Gap analysis + approval rules
├── 📄 DEVELOPMENT_PLAN_2MONTHS.md                # 8-week dev plan
│
├── 📄 docker-compose.yml             # Self-hosting setup
├── 📄 SELFHOST_SETUP.md              # Self-hosting guide
├── 📁 docker/config/odoo.conf
└── 📁 docker/setup/
    ├── restore_backup.sh
    ├── fresh_install.sh
    └── get_third_party.sh
```

---

*Generated: 2026-05-13 | Session covers: 2026-05-12 to 2026-05-13*
