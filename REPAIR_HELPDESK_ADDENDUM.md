# Repair/Helpdesk Documentation Addendum

**Purpose:** Covers items identified as gaps during post-documentation gap analysis.
**Date:** 2026-05-12
**Source:** Live staging instance via XML-RPC + gap analysis against 5 primary documentation files.

---

## 1. Studio Approval Rules (`studio.approval.rule`)

These rules gate specific button actions behind group membership at the Studio level.
They are enforced by the `web_studio` module's approval mechanism, separate from
standard Odoo security (`ir.rule` / `ir.model.access`).

| Rule ID | Model | Rule Name | Method / Button | Required Group |
|---------|-------|-----------|-----------------|----------------|
| 30 | `helpdesk.ticket` | Helpdesk Ticket/Reverse Transfer (User types / Internal User) | Reverse Transfer button | User types / Internal User |
| 56 | `stock.picking` | Transfer/action_open_label_layout (Administration / Access Rights) | `action_open_label_layout` | Administration / Access Rights |
| 62 | `stock.picking` | Transfer/action_put_in_pack (User types / Internal User) | `action_put_in_pack` | User types / Internal User |
| 102 | `stock.picking` | Transfer/action_cancel (Inventory / Jin - Administrator) | `action_cancel` | Inventory / Jin - Administrator |

### Implementation Notes

In the `studio_customization` module these are stored in `data/studio_approval_rule.xml`.
In a clean custom module, replicate them using `studio.approval.rule` records in XML:

```xml
<!-- Helpdesk Ticket: Reverse Transfer requires Internal User -->
<record id="approval_helpdesk_reverse_transfer" model="studio.approval.rule">
    <field name="model_id" ref="helpdesk.model_helpdesk_ticket"/>
    <field name="method">False</field>  <!-- button-level, not a method -->
    <field name="group_id" ref="base.group_user"/>
    <field name="message">Only Internal Users can reverse transfers on repair tickets.</field>
</record>

<!-- Transfer: Label Layout requires Access Rights admin -->
<record id="approval_picking_label_layout" model="studio.approval.rule">
    <field name="model_id" ref="stock.model_stock_picking"/>
    <field name="method">action_open_label_layout</field>
    <field name="group_id" ref="base.group_system"/>
</record>

<!-- Transfer: Pack action requires Internal User -->
<record id="approval_picking_put_in_pack" model="studio.approval.rule">
    <field name="model_id" ref="stock.model_stock_picking"/>
    <field name="method">action_put_in_pack</field>
    <field name="group_id" ref="base.group_user"/>
</record>

<!-- Transfer: Cancel requires Jin Administrator -->
<record id="approval_picking_cancel" model="studio.approval.rule">
    <field name="model_id" ref="stock.model_stock_picking"/>
    <field name="method">action_cancel</field>
    <field name="group_id" ref="stock.group_stock_manager"/>
    <!-- Note: actual group is "Inventory / Jin - Administrator" — verify XML ID -->
</record>
```

> **⚠️ Important:** Rule ID 30 on `helpdesk.ticket` controls the "Reverse Transfer" button
> visible in the repair ticket form. Without this rule in the custom module, ALL users can
> click Reverse Transfer. The `web_studio` dependency is required for `studio.approval.rule`
> to work; if replacing Studio entirely, implement equivalent logic with `@api.model` button
> method guards or override the button action to check `self.env.user.has_group(...)`.

---

## 2. Sequences — Duplicates & Null Prefix

### Duplicate Sequence Records

The staging instance contains **duplicate sequence records** for both repair sequences.
This is a data issue to be aware of when migrating:

| Code | Name | Prefix | Padding | Count |
|------|------|--------|---------|-------|
| `repair.seq` | Repair Sequence No | `REPAIR/%(year)s/` | 5 | **2 records** (IDs 278 & 811) |
| `repair.serial.seq` | Repair Serial Sequence No | `REP-SERIAL/%(year)s/` | 5 | **2 records** (IDs 279 & 812) |
| `helpdesk.ticket` | Helpdesk Ticket | *(no prefix — False)* | 2 | 1 record |

### Developer Notes

- The `helpdesk.ticket` sequence has `prefix = False` (blank/null). Tickets are numbered
  purely as integers padded to 2 digits (e.g., `01`, `02`, `99`).
- The duplicate repair sequences will cause Odoo to use the **first** matching record.
  When building the custom module's `data/ir_sequence_data.xml`, define each sequence
  **once** with a `noupdate="1"` header to avoid re-creating duplicates on install:

```xml
<odoo noupdate="1">
    <record id="seq_repair_job" model="ir.sequence">
        <field name="name">Repair Sequence No</field>
        <field name="code">repair.seq</field>
        <field name="prefix">REPAIR/%(year)s/</field>
        <field name="padding">5</field>
        <field name="implementation">no_gap</field>
    </record>
    <record id="seq_repair_serial" model="ir.sequence">
        <field name="name">Repair Serial Sequence No</field>
        <field name="code">repair.serial.seq</field>
        <field name="prefix">REP-SERIAL/%(year)s/</field>
        <field name="padding">5</field>
        <field name="implementation">no_gap</field>
    </record>
</odoo>
```

---

## 3. Helpdesk Teams — Two Teams with Identical Names

The system has **two separate Helpdesk teams** that both use the name
`"Customer Care - Repair"`:

| Team ID | Name | Mail Alias | SLA Enabled |
|---------|------|------------|-------------|
| 1 | Customer Care - Repair | `support` | Yes |
| 3 | Customer Care - Repair | `customer-care-repair` | Yes |

### Impact

- Emails sent to `support@<domain>` create tickets in Team ID 1.
- Emails sent to `customer-care-repair@<domain>` create tickets in Team ID 3.
- In the UI these appear as identical entries — routing is alias-driven.
- Any domain filter or view context using `team_id.name = 'Customer Care - Repair'`
  will match **both** teams — always filter by `team_id` (integer) in code, not by name.

---

## 4. `x_task_diagnosis` — Model Exists, Zero Live Records

The custom model `x_task_diagnosis` (Diagnosis Log, linked to `project.task`) is fully
defined and has 44 fields but contains **0 records in the staging instance**.

This means the diagnosis logging feature is built and visible in the UI but has not yet
been used in production. When building the custom module:

- The model definition and views should be included (they exist in `jinasena_helpdesk_repair`).
- **Do not include seed data** for `x_task_diagnosis` — there are no reference records to
  replicate.
- The feature may need user training or process changes to drive adoption.

### Field Summary (44 fields, key ones)

| Field | Type | Description |
|-------|------|-------------|
| `x_name` | char | Diagnosis reference |
| `x_studio_task_id` | many2one → `project.task` | Linked FSM task |
| `x_studio_helpdesk_ticket_id` | many2one → `helpdesk.ticket` | Linked repair ticket |
| `x_studio_diagnosis_area_id` | many2one → `x_diagnosis_areas` | Diagnosis area |
| `x_studio_diagnosis_code_id` | many2one → `x_diagnosis_codes` | Diagnosis code |
| `x_studio_symptom_area_id` | many2one → `x_symptom_areas` | Symptom area |
| `x_studio_symptom_code_id` | many2one → `x_symptom_codes` | Symptom code |
| `x_studio_resolution_id` | many2one → `x_resolutions` | Resolution applied |
| `x_studio_condition_id` | many2one → `x_conditions` | Item condition |
| `x_studio_technician_id` | many2one → `res.users` | Technician |
| `x_studio_repair_date` | date | Date of diagnosis |
| `x_studio_notes` | text | Free-text notes |

---

## 5. Complete Studio Approval Rule XML (from `studio_customization`)

The `studio_customization/data/studio_approval_rule.xml` file (pushed to GitHub) contains
the authoritative XML for all approval rules system-wide. For Repair/Helpdesk specifically,
filter for rules where `model_id` references `helpdesk.ticket` or `stock.picking`.

The full file is at:
`studio_customization/data/studio_approval_rule.xml`
on the `main` branch of https://github.com/sanjayaWjinasena/Claude_Test

---

## Documentation Coverage Summary

| Area | Status | Location |
|------|--------|----------|
| helpdesk.ticket — 107 Studio fields | ✅ Complete | REPAIR_HELPDESK_STUDIO_DOCUMENTATION.md |
| repair.order — 1 Studio field | ✅ Complete | REPAIR_HELPDESK_TECHNICAL_REPORT.md |
| stock.picking — 51 Studio fields | ✅ Complete | REPAIR_HELPDESK_SUPPLEMENTARY.md |
| project.task — 24 Studio fields | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| sale.order — 11 repair fields | ✅ Complete | REPAIR_HELPDESK_SUPPLEMENTARY.md |
| res.users — 8 repair fields | ✅ Complete | REPAIR_HELPDESK_SUPPLEMENTARY.md |
| 13 custom x_ master data models | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| 43 server actions (helpdesk.ticket) | ✅ Complete | REPAIR_HELPDESK_TECHNICAL_REPORT.md |
| 53 server actions (related models) | ✅ Complete | REPAIR_HELPDESK_SUPPLEMENTARY.md |
| 7 automated actions | ✅ Complete | REPAIR_HELPDESK_TECHNICAL_REPORT.md |
| 12 automated actions (related) | ✅ Complete | REPAIR_HELPDESK_SUPPLEMENTARY.md |
| 30 QWeb report definitions | ✅ Complete | REPAIR_HELPDESK_SUPPLEMENTARY.md |
| 17 email templates (full HTML) | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| 13 email templates (critical data) | ✅ Complete | REPAIR_HELPDESK_CRITICAL_DATA.md |
| 28 helpdesk stages | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| 4 ticket types | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| 4 user groups / security | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| 53 access rights rules | ✅ Complete | REPAIR_HELPDESK_TECHNICAL_REPORT.md |
| 29 record rules | ✅ Complete | REPAIR_HELPDESK_CRITICAL_DATA.md |
| 38 menus | ✅ Complete | REPAIR_HELPDESK_TECHNICAL_REPORT.md |
| 4 mail aliases | ✅ Complete | REPAIR_HELPDESK_SUPPLEMENTARY.md |
| Selection field values (15 fields) | ✅ Complete | REPAIR_HELPDESK_CRITICAL_DATA.md |
| 15 Studio field deep attributes | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| 88 SQL constraints | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| Studio view inheritance chain | ✅ Complete | REPAIR_HELPDESK_DEVELOPER_PACKAGE.md |
| Studio raw XML export | ✅ Complete | studio_customization/ (module) |
| Module source code | ✅ Complete | jinasena_helpdesk_repair/ + helpdesk_repair_custom/ |
| **Studio Approval Rules (4 rules)** | ✅ Documented here | This file (Section 1) |
| **Duplicate sequences** | ✅ Documented here | This file (Section 2) |
| **Dual helpdesk teams** | ✅ Documented here | This file (Section 3) |
| **x_task_diagnosis zero records** | ✅ Documented here | This file (Section 4) |
