# Jinasena Helpdesk Repair — 2-Month Development Plan

**Module:** `jinasena_helpdesk_repair`  
**Target:** Odoo 17.0 Enterprise  
**Start date:** Week 1 (adjust to actual start)  
**Duration:** 8 weeks × 5 days = **40 working days**  
**Developer profile:** 1 × Senior Odoo 17 developer (full-time)

---

## Scope Baseline (from gap analysis)

| Component | In Staging | In Module Now | Remaining |
|-----------|-----------|---------------|-----------|
| helpdesk.ticket fields | 107 | 55 | **52** |
| stock.picking fields | 51 | 9 | **42** |
| project.task fields | 24 | ~12 | **12** |
| sale.order / res.users / repair.order fields | 20 | partial | **~14** |
| Custom x_ models (13 total) | 13 | 13 | 0 (done) |
| Helpdesk stages | 28 | 13 | **15** |
| Ticket types | 4 | 4 | 0 (done) |
| Server actions — helpdesk.ticket | 43 | 13 | **30** |
| Server actions — related models | 53 | 0 | **53** |
| Automated actions | 19 | 6 | **13** |
| Email templates | 17 | 0 | **17** |
| QWeb reports (key ones) | 6 | 0 | **6** |
| Record rules | 29 | 0 | **29** |
| Access rights | 53 | 25 | **28** |
| Studio approval rules | 4 | 0 | **4** |
| Menus & window actions | 38 | partial | **~20** |
| Sequences | 2 | 2 | 0 (done) |

---

## Milestones Overview

```
Week 1-2  ▸  FOUNDATION   — All models complete, all fields defined, security done
Week 3-4  ▸  VIEWS        — Full UI working (forms, kanbans, smart buttons)
Week 5-6  ▸  LOGIC        — All server actions + automations working
Week 7    ▸  REPORTS      — Email templates + QWeb reports done
Week 8    ▸  QA           — End-to-end testing + bug fixes + deployment
```

---

## Week 1 — Foundation & Data Layer
**Goal:** Module installs cleanly on a fresh Odoo 17 with correct master data.

| Day | Tasks | Est. Hours | Output |
|-----|-------|-----------|--------|
| 1 | Environment setup (dev DB, module path, dependencies install). Review all 5 doc files + addendum. Build full task list. | 8h | Working dev environment |
| 2 | Complete all 13 custom model Python files. Verify field types match staging (many2one domains, required flags, string labels). | 8h | 13 `models/*.py` complete |
| 3 | Master data XML: complete 28 stages (`helpdesk_stages.xml`), 4 ticket types, repair reasons (12), sub-reasons, symptom areas/codes, diagnosis areas/codes, resolutions, conditions. | 8h | `data/*.xml` master data |
| 4 | Security: 4 user groups (`res_groups.xml`), complete 53 access rules (`ir.model.access.csv`), 29 record rules (`security/record_rules.xml`). | 8h | Full security layer |
| 5 | CRUD views for all 13 custom models (tree + form), menus structure (38 menus), window actions. Module install test. | 8h | Admin UI for all master models |

**Milestone check:** `pip install` succeeds, all master data loads, custom models accessible from menu.  
**Reference files:** `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` §4, `REPAIR_HELPDESK_CRITICAL_DATA.md` §10, `REPAIR_HELPDESK_ADDENDUM.md` §1.

---

## Week 2 — Field Definitions (All Models)
**Goal:** Every custom field exists on every model. No UI work yet — just the Python.

| Day | Tasks | Est. Hours | Output |
|-----|-------|-----------|--------|
| 6 | `helpdesk.ticket` — fields batch 1 (52 remaining): identification fields (job_location, tracking, serial_no, product_id, qty, unit_price), RUG fields (rug_approval_status, rug_confirmed, rug_request_sent), stage audit fields. | 8h | ~25 fields |
| 7 | `helpdesk.ticket` — fields batch 2: workflow status fields (cancel_status, reopen_status, re_estimate_status, quick_repair_status, material_availability), smart-button counter fields (x_x_ fields, 11 total), computed fields with @api.depends. | 8h | ~27 fields |
| 8 | `repair.order` (1 field + view), `project.task` (24 fields — priority, payment_type, quotation_type, material_availability, etc.), `x_task_diagnosis` model complete. | 8h | project.task + repair.order complete |
| 9 | `stock.picking` — all 51 fields (helpdesk_ticket_id link, factory_repair booleans, movement journal flags, GL status, picking type booleans, computed validations). | 8h | stock.picking complete |
| 10 | `sale.order` (11 fields), `res.users` (8 fields). Full model audit: run XML-RPC against staging and compare field-by-field. Fix any mismatches. | 8h | All models complete |

**Milestone check:** All 107 + 51 + 24 + 20 fields exist. `fields_get()` matches staging.  
**Reference files:** `REPAIR_HELPDESK_STUDIO_DOCUMENTATION.md`, `REPAIR_HELPDESK_SUPPLEMENTARY.md` §1–§3, `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` §3.

---

## Week 3 — Helpdesk Ticket UI
**Goal:** The helpdesk.ticket form view is production-quality. Main repair workflow visible.

| Day | Tasks | Est. Hours | Output |
|-----|-------|-----------|--------|
| 11 | Form view — header: statusbar (28 stages), chatter buttons (Assign, Send Message), custom header buttons (Send to Factory, Receive, etc. — placeholders). | 8h | Header + status bar |
| 12 | Form view — main body: left column (customer, product, serial, location fields), right column (job type, RUG fields, pricing). Match exact layout from staging XML in `studio_customization/data/ir_ui_view.xml`. | 8h | Main form body |
| 13 | Form view — notebook tabs: Repair Details, Parts & Labour, Warranty Details, Documents, Cancel/Reopen Log. All fields per tab per staging layout. | 8h | All notebook pages |
| 14 | Smart buttons: 11 counter buttons (Transfers, Sales Orders, Tasks, Invoices, etc.) using `x_x_` computed count fields. Kanban view (stage-based, colour by job_location). Tree/list view. | 8h | Smart buttons + kanban + tree |
| 15 | `stock.picking` form/tree view overrides. `project.task` form override. `res.users` form additions. `sale.order` view additions. Quick test: open a ticket, all fields visible. | 8h | All related model views |

**Milestone check:** Create a repair ticket manually end-to-end in the UI — all fields visible, kanban moves, smart buttons show counts.  
**Reference files:** `studio_customization/data/ir_ui_view.xml` (filter on helpdesk.ticket), `REPAIR_HELPDESK_SUPPLEMENTARY.md` §4–§6.

---

## Week 4 — Core Business Logic (helpdesk.ticket Server Actions)
**Goal:** All 43 server actions on helpdesk.ticket working as Python methods.

> These are the most complex items. Port from Studio Python (in `studio_customization/data/ir_actions_server.xml`) to proper ORM methods in `models/helpdesk_ticket.py`.

| Day | Tasks | Est. Hours | Output |
|-----|-------|-----------|--------|
| 16 | **Routing actions** — `action_send_to_factory`: create stock.picking (receipt type RP-*), set stage, send notification email. `action_receive_at_factory`: validate picking, update stage. | 8h | 2 routing actions |
| 17 | **Routing actions (return)** — `action_send_to_sales_centre`: outgoing picking from factory to branch. `action_receive_at_sales_centre`: validate return receipt, update stage. + `action_create_repair_route`: full multi-picking route creation. | 8h | 3 routing actions |
| 18 | **RUG workflow** — `action_change_type_to_rug`, `action_rug_approve`, `action_rug_reject`, `action_send_rug_request` (send email to factory). RUG approval status state machine. | 8h | 4 RUG actions |
| 19 | **Estimate workflow** — `action_send_estimation`, `action_approve_estimation`, `action_reject_estimation`, `action_re_estimate`, `action_send_re_estimation`. Estimation stage transitions + SO creation link. | 8h | 5 estimate actions |
| 20 | **Cancel / Reopen / Update** — `action_cancel_repair`, `action_reopen_repair`, `action_update_serial`, `action_create_repair_serial` (lot creation), `action_update_stage_*` (11 stage shortcut buttons). | 8h | ~15 actions |

**Milestone check:** Full Centre Repair flow manually: New → Send to Factory → Diagnosis → Estimation → Repair → Return → Handover. All stage buttons work.  
**Reference files:** `REPAIR_HELPDESK_TECHNICAL_REPORT.md` §3 (full Python code), `helpdesk_repair_custom/data/server_actions.xml`.

---

## Week 5 — Related Model Logic (stock.picking + sale.order + project.task)
**Goal:** All 53 server actions on related models working.

| Day | Tasks | Est. Hours | Output |
|-----|-------|-----------|--------|
| 21 | **stock.picking** — 10 server actions: validate factory receipt, validate centre delivery, movement journal actions, GL account status update, notify on validate. | 8h | 10 picking actions |
| 22 | **sale.order** — 14 server actions: create SO from repair ticket, confirm SO, link repair ticket to SO line, compute repair price from estimate, update invoice status, payment handling. | 8h | 8 SO actions |
| 23 | **sale.order (continued)** — remaining 6 SO actions: advance payment flow, credit/cash routing, RUG SO creation, scrappage SO creation. | 8h | 6 SO actions |
| 24 | **project.task** — 5 server actions: create FSM task from ticket, auto-assign technician, update diagnosis on task, sync task status back to ticket, close task on handover. | 8h | 5 task actions |
| 25 | **Remaining** — `res.users` location-based validation actions (2), `repair.order` link action (1), mail alias creation actions (4). Review all 53 against staging. | 8h | ~15 remaining actions |

**Milestone check:** Factory Repair flow + RUG flow end-to-end. SO created, task created, picking validated from ticket buttons.  
**Reference files:** `REPAIR_HELPDESK_SUPPLEMENTARY.md` §7–§9 (full Python code for all 53 actions).

---

## Week 6 — Automations, Rules & Approvals
**Goal:** All automated triggers, access controls, and approval gates in place.

| Day | Tasks | Est. Hours | Output |
|-----|-------|-----------|--------|
| 26 | **Automated actions (helpdesk.ticket)** — 7 rules: auto-generate repair sequence on create, auto-populate product from serial, clear fields on serial change, stage company auto-fill, prevent delete of cancelled tickets, auto-update stage date. | 8h | 7 automations |
| 27 | **Automated actions (related models)** — 12 rules on stock.picking (3), sale.order (5), project.task (1), repair.order (1), res.partner (2): auto-sync status fields, cascade stage updates, notify on key events. | 8h | 12 automations |
| 28 | **Record rules** — 29 `ir.rule` records: location-based visibility (branch users see own branch transfers), repair team access (own team tickets only), task visibility. Port from `REPAIR_HELPDESK_CRITICAL_DATA.md` §10. | 8h | 29 record rules |
| 29 | **Studio approval rules** — 4 `studio.approval.rule` records (helpdesk.ticket Reverse Transfer, stock.picking cancel/pack/label). Mail aliases (4). `ir.default` values. | 8h | Approval gates + aliases |
| 30 | Full security audit: test each record rule domain, test each approval gate, verify group access matrix. Fix any access errors. | 8h | Security sign-off |

**Milestone check:** Log in as Branch User — can only see own branch tickets/transfers. Log in as Factory User — can see factory repairs. RUG approval button blocked for non-approvers.  
**Reference files:** `REPAIR_HELPDESK_ADDENDUM.md` §1–§2, `REPAIR_HELPDESK_CRITICAL_DATA.md` §10, `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` §6.

---

## Week 7 — Email Templates & QWeb Reports
**Goal:** All outbound communications and printable documents working.

| Day | Tasks | Est. Hours | Output |
|-----|-------|-----------|--------|
| 31 | **Email templates batch 1** — 9 templates: Repair Job Received, Estimation Sent to Customer, Estimation Approval Received, Advance Received, Repair Completed, Sent to Sales Centre, Received at Sales Centre, Handed Over, Cancelled. Port full HTML from `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` §5. | 8h | 9 email templates |
| 32 | **Email templates batch 2** — 8 templates: RUG Request to Factory, RUG Approved, RUG Rejected, Re-estimation Sent, Re-estimation Approved, Re-estimation Rejected, Quick Repair Done, Reopened. Stage → template mapping (28 stages). | 8h | 8 templates + stage mapping |
| 33 | **QWeb report: Repair Receipt** — Customer-facing receipt on handover. Header (company logo, address), body (ticket details, product, serial, work done, charges), footer (signature, terms). | 8h | Repair Receipt report |
| 34 | **QWeb report: Repair Final Notice** — Detailed repair completion notice. Work order details, parts used, labour, total. **Repair Final Notice - Scrappage** variant. | 8h | 2 Final Notice reports |
| 35 | **QWeb reports: Repair Status + Helpdesk Ticket Report** — Status summary (current stage, timeline). Ticket report (internal job sheet). Wire up to `ir.actions.report` → Print menu. Test all 6 reports in browser. | 8h | 2 more reports + print menus |

**Milestone check:** Send estimation email from ticket — customer receives correct HTML. Print Repair Receipt — PDF renders correctly with all fields.  
**Reference files:** `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` §5, `REPAIR_HELPDESK_CRITICAL_DATA.md` §11, `studio_customization/data/ir_actions_report.xml`.

---

## Week 8 — QA, Bug Fixes & Deployment Prep
**Goal:** Module is production-ready. All flows tested. Deployment guide written.

| Day | Tasks | Est. Hours | Output |
|-----|-------|-----------|--------|
| 36 | **Smoke test install** — fresh Odoo 17 instance, install module, load all demo data. Verify: 28 stages, 4 ticket types, 13 custom models, 25 access rules, menus all visible. Fix any XML/install errors. | 8h | Clean install confirmed |
| 37 | **Centre Repair flow (end-to-end)** — Create ticket → serial lookup → create receipt → send to factory → diagnose → estimate → customer approval → advance → repair → return to centre → handover. Verify all stage transitions, all emails, picking validations. | 8h | Centre flow sign-off |
| 38 | **Factory Repair + RUG flow** — Create RUG ticket → send RUG request → factory approval → repair → final notice. Verify RUG approval gate, RUG email templates, scrappage variant. + Quick Repair flow. | 8h | Factory + RUG sign-off |
| 39 | **Edge cases & bug fixes** — Cancelled repair (re-open flow), re-estimation flow, multi-branch ticket visibility, users with restricted location access, duplicate serial number handling. | 8h | Edge case sign-off |
| 40 | **Deployment prep** — Upgrade path test (simulate upgrading from Studio-only to module). Write migration notes (which Studio fields to deactivate). Version bump to `17.0.1.0.0`. Tag `v1.0.0` in git. | 8h | Ready for staging deploy |

**Milestone check:** QA sign-off document completed. Module installs, upgrades, and all flows pass. Ready to deploy to Odoo.sh staging.  

---

## Full Timeline Summary

```
       MON      TUE      WED      THU      FRI
W1  │ Setup   │ Models  │ Data    │ Sec     │ Views    │  ← FOUNDATION DONE
W2  │ HT f1   │ HT f2   │ Task/RO │ Picking │ SO+Usr   │  ← ALL FIELDS DONE
W3  │ Form hd │ Form bd │ Tabs    │ Buttons │ Related  │  ← UI DONE
W4  │ Route1  │ Route2  │ RUG     │ Estim   │ Cancel   │  ← CORE LOGIC DONE
W5  │ Picking │ SO 1    │ SO 2    │ Tasks   │ Misc     │  ← ALL LOGIC DONE
W6  │ Auto HT │ Auto rel│ Rules   │ Approv  │ Audit    │  ← SECURITY DONE
W7  │ Email1  │ Email2  │ Rcpt    │ Notice  │ Status   │  ← REPORTS DONE
W8  │ Install │ Centre  │ RUG     │ Edges   │ Deploy   │  ← SHIPPED ✓
```

---

## Key Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Studio Python code uses `env['x_model'].sudo()` style — needs ORM rewrite | High | Medium | Reference `REPAIR_HELPDESK_TECHNICAL_REPORT.md` §3 for exact logic; port carefully |
| Computed fields on helpdesk.ticket have complex `@depends` chains (SO status, task status) | High | High | Map all dependencies in Week 2 before writing `_compute_*` methods |
| stock.picking server actions touch multi-step routes (2-3 pickings per repair) | High | High | Test routing logic in isolation (Week 5 Day 21) before integrating |
| QWeb reports require exact branding/layout match | Medium | Low | Use email template HTML as base (already fully extracted) |
| Record rule domains use x_studio_ field names — must update to new field names | High | Medium | Do a global find/replace sweep on all domains before Week 6 |
| Studio approval rules require `web_studio` module dependency | Medium | Medium | Keep `web_studio` in depends list; document in manifest |
| 28-stage pipeline vs 13 in current module — stage XML IDs differ | High | High | Rewrite all 28 stages in Week 1 Day 3; update all stage references immediately |
| Duplicate sequences in staging — don't replicate the duplicate | Low | Low | Use `noupdate="1"` wrapper per Addendum §2 |

---

## Developer Reference Index

| What you need | Where to find it |
|---------------|-----------------|
| All 107 helpdesk.ticket field definitions | `REPAIR_HELPDESK_STUDIO_DOCUMENTATION.md` §2 |
| Full view XML (arch_db) for all modified views | `studio_customization/data/ir_ui_view.xml` |
| All server action Python code | `REPAIR_HELPDESK_TECHNICAL_REPORT.md` §3 + `REPAIR_HELPDESK_SUPPLEMENTARY.md` §7 |
| All automated action definitions | `REPAIR_HELPDESK_TECHNICAL_REPORT.md` §4 + `REPAIR_HELPDESK_SUPPLEMENTARY.md` §8 |
| Email templates (full HTML) | `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` §5 + `REPAIR_HELPDESK_CRITICAL_DATA.md` §11 |
| Master data (stages, reasons, etc.) | `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` §4 |
| Selection field values | `REPAIR_HELPDESK_CRITICAL_DATA.md` §1 |
| Record rules (29, with domains) | `REPAIR_HELPDESK_CRITICAL_DATA.md` §10 |
| Studio approval rules | `REPAIR_HELPDESK_ADDENDUM.md` §1 |
| Access rights (53 rules) | `REPAIR_HELPDESK_TECHNICAL_REPORT.md` §5 |
| QWeb report actions | `studio_customization/data/ir_actions_report.xml` |
| Repair warehouse & location IDs | `REPAIR_HELPDESK_CRITICAL_DATA.md` §2–§3 |
| Stock operation type details | `REPAIR_HELPDESK_CRITICAL_DATA.md` §2 |
| GL accounts for RUG billing | `REPAIR_HELPDESK_CRITICAL_DATA.md` §8 |
| Field deep attributes (compute, depends, domain, default) | `REPAIR_HELPDESK_DEVELOPER_PACKAGE.md` §3 |
| Existing partial module code | `jinasena_helpdesk_repair/` (base — ~25% complete) |
| Earlier module iteration | `helpdesk_repair_custom/` (reference) |
| Raw Studio XML export (all fields/views/actions) | `studio_customization/` |

---

## Definition of Done

- [ ] Module installs on Odoo 17.0 Enterprise from scratch without errors
- [ ] All 107 helpdesk.ticket x_studio_ fields replaced with clean Python fields
- [ ] All 51 stock.picking fields implemented
- [ ] All 28 helpdesk stages present with correct sequence and email template mappings
- [ ] Complete repair workflow (Centre + Factory + RUG) executable end-to-end
- [ ] All outbound emails fire correctly at correct stages
- [ ] All 4 QWeb reports render as PDF
- [ ] Branch user cannot see other-branch tickets (record rules verified)
- [ ] RUG approval gate blocks non-approvers (approval rule verified)
- [ ] No `web_studio` dependency required at runtime (optional — if approval rules ported)
- [ ] Module can be installed alongside or replacing `studio_customization`
- [ ] Git tagged `v1.0.0`, pushed to GitHub

---

*Plan generated: 2026-05-13 | Based on staging instance: rohanabalagalla-jinstage-clear-db-29834478.dev.odoo.com*
