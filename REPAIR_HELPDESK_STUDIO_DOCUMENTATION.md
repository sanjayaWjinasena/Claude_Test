# Repair & Helpdesk — Studio Customization Documentation

**Source:** Clear_DB Staging (`rohanabalagalla-jinstage-clear-db-29834478.dev.odoo.com`)  
**Odoo Version:** 17.0  
**Date Captured:** 2026-05-12

---

## Overview

The repair business process in this Odoo instance is split across two standard modules:

| Module | Role |
|--------|------|
| **Helpdesk** (`helpdesk.ticket`) | **Primary repair workflow engine** — ticket intake, diagnosis, job routing (centre vs. factory), RUG (warranty) handling, stage tracking, sales order linkage |
| **Repair Orders** (`repair.order`) | **Parts & stock movements** — linked from Helpdesk; handles component consumption and inventory |
| **Field Service** (`project.task`) | **Technician tasks** — FSM tasks spawned from Helpdesk tickets for on-site or workshop work |

> The Helpdesk module has been heavily extended (107 Studio fields) to serve as the central repair job card.

---

## 1. `repair.order` — Studio Customizations

### 1.1 Studio Custom Fields (1)

| Field | Label | Type | Description |
|-------|-------|------|-------------|
| `x_studio_confirm_draft_quotation` | Confirm Draft Quotation | Boolean | Flag to confirm a draft quotation linked to this repair order |

### 1.2 Studio-Modified Views (1)

| View | Type | Change |
|------|------|--------|
| `Odoo Studio: repair.form customization_button` | Form | Custom button(s) added to the Repair Order form via Studio |

### 1.3 Standard Fields Used in Process

Key standard fields relevant to the repair workflow:

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `ticket_id` | Ticket | Many2one → `helpdesk.ticket` | Links repair order back to the originating helpdesk ticket |
| `state` | Status | Selection | `draft` → `confirmed` → `under_repair` → `done` / `cancel` |
| `product_id` | Product to Repair | Many2one → `product.product` | The item being repaired |
| `lot_id` | Lot/Serial | Many2one → `stock.lot` | Serial number of the item |
| `under_warranty` | Under Warranty | Boolean | Standard warranty flag (complemented by Studio RUG fields on ticket) |
| `sale_order_id` | Sale Order | Many2one → `sale.order` | Linked sales order |
| `schedule_date` | Scheduled Date | Datetime | Required |
| `location_id` | Location | Many2one → `stock.location` | Repair location |

### 1.4 Automated Actions (1)

| Name | Trigger | Status |
|------|---------|--------|
| `RR - Notify Customer in RO End - Final` | On Create or Write | ✅ Active |

> Sends a customer notification when the repair order reaches final stage.

---

## 2. `helpdesk.ticket` — Studio Customizations

### 2.1 Ticket Identification & Classification

| Field | Label | Type | Values / Notes |
|-------|-------|------|----------------|
| `x_studio_branch` | Branch | Selection | `Colombo`, `Gampah` |
| `x_studio_city` | City | Selection | `Colombo`, `Gampaha`, `Yakkala` |
| `x_studio_job_location` | Job Location | Selection | `Centre Repair`, `Factory Repair` |
| `x_studio_tracking` | Tracking | Selection | `By Unique Serial Number`, `By Lots`, `No Tracking` |
| `x_studio_serial_no` | Serial Number | Many2one → `stock.lot` | Primary serial number field |
| `x_studio_serial_number` | Serial Number-11 | Many2one → `stock.lot` | Secondary serial number field |
| `x_studio_items` | Items | Many2many → `product.product` | Products linked to this ticket |
| `x_studio_materials_used` | Materials Used | Many2one → `product.product` | Material used in repair |
| `x_studio_repair_reason` | Repair Reason | Many2many → `x_repair_reason_custom` | Reasons for repair (customer-reported) |
| `x_studio_warranty_card` | Warranty Card | Binary | Scanned warranty card attachment |
| `x_studio_related_information` | Related Information | Binary | Additional attachments |
| `x_studio_vehicle_details` | Vehicle Details | Char | Vehicle info (for mobile/field repairs) |
| `x_studio_driver_name` | Driver Name | Char | Driver details for pickup/delivery |

### 2.2 Repair Type Flags

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_normal_repair_with_serial_no` | Normal Repair (With Serial No) | Boolean | Standard repair with tracked item |
| `x_studio_normal_repair_without_serial_no` | Normal Repair (Without Serial No) | Boolean | Standard repair with untracked item |
| `x_studio_rug_repair` | Repair Under Warranty (RUG) | Boolean | Marks ticket as a warranty repair |

### 2.3 RUG (Repair Under Guarantee / Warranty) Workflow

| Field | Label | Type | Values |
|-------|-------|------|--------|
| `x_studio_rug_repair` | Repair Under Warranty | Boolean | Main RUG flag |
| `x_studio_rug_request_sent` | RUG Request Sent | Boolean | Approval request sent |
| `x_studio_rug_confirmed` | RUG Confirmed | Boolean | RUG approved at ticket level |
| `x_studio_rug_approved` | RUG Approved | Boolean | Final approval given |
| `x_studio_rug_approval_status` | RUG Approval Status | Selection | `Pending RUG Approval`, `RUG Approved`, `RUG Rejected` |

### 2.4 Job Routing — Centre vs Factory

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_send_to_centre` | Send to Centre | Boolean | Route to service centre |
| `x_studio_receive_at_centre` | Receive at Centre | Boolean | Confirmed receipt at centre |
| `x_studio_send_to_factory` | Send to Factory | Boolean | Route to factory for repair |
| `x_studio_receive_at_factory` | Receive at Factory | Boolean | Confirmed receipt at factory |
| `x_studio_repair_location` | Repair Location | Many2one → `stock.location` | Specific location for repair |
| `x_studio_source_location` | Source Location | Many2one → `stock.location` | Origin location |
| `x_studio_source_location_1` | Source Location | Many2one → `stock.location` | Secondary source location |
| `x_studio_return_receipt_location` | Return Receipt Location | Many2one → `stock.location` | Where repaired item returns |
| `x_studio_virtual_location` | Virtual Location | Many2one → `stock.location` | Virtual/transit location |
| `x_studio_virtual_location_1` | Virtual Location | Many2one → `stock.location` | Secondary virtual location |
| `x_studio_virtual_location_id` | Virtual Location Id | Integer | ID reference to virtual location |

### 2.5 Shipping & Logistics Tracking

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_s_shipped_by` | Shipped By (S) | Many2one → `res.users` | User who shipped (route S) |
| `x_studio_s_shipped_date` | Shipped Date (S) | Datetime | Shipping date (route S) |
| `x_studio_s_received_by` | Received By (S) | Many2one → `res.users` | User who received (route S) |
| `x_studio_s_received_date` | Received Date (S) | Datetime | Receipt date (route S) |
| `x_studio_f_shipped_by` | Shipped By (F) | Many2one → `res.users` | User who shipped (factory route) |
| `x_studio_f_shipped_date` | Shipped Date (F) | Datetime | Shipping date (factory route) |
| `x_studio_f_received_by` | Received By (F) | Many2one → `res.users` | User who received (factory route) |
| `x_studio_f_received_date` | Received Date (F) | Datetime | Receipt date (factory route) |

### 2.6 Stage Tracking Flags

These Boolean flags are set automatically when the ticket moves through specific stages:

| Field | Label | Notes |
|-------|-------|-------|
| `x_studio_estimation_sent_stage_updated` | Estimation Sent Stage Updated | Set when estimation is sent to customer |
| `x_studio_estimation_approved_stage_updated` | Estimation Approved Stage Updated | Set when customer approves estimation |
| `x_studio_repair_started_stage_updated` | Repair Started Stage Updated | Set when repair work begins |
| `x_studio_repair_complete_stage_updated` | Repair Complete Stage Updated | Set when repair is finished |
| `x_studio_invoice_stage_updated` | Invoice Stage Updated | Set when invoice is raised |
| `x_studio_sn_updated` | SN Updated | Serial number has been updated in system |
| `x_studio_repair_serial_created` | Repair Serial Created | Serial number record created for repair |
| `x_studio_fsm_task_done` | FSM Task Done | Field Service task completed |
| `x_studio_task_status` | Task Status | General task status flag |
| `x_studio_handed_over` | Handed Over | Item handed back to customer |
| `x_studio_stage_date` | Stage Date | Datetime when stage last changed |
| `x_studio_stage_name` | Stage Name | Name of current stage (denormalised) |

### 2.7 Cancellation Handling

| Field | Label | Type | Values |
|-------|-------|------|--------|
| `x_studio_cancelled` | Cancelled | Boolean | Main cancellation flag |
| `x_studio_cancelled_2` | Cancelled-2 | Boolean | Secondary cancellation flag |
| `x_studio_cancel_reason` | Cancel Reason | Text | Free-text cancellation reason |
| `x_studio_cancel_status` | Cancel Status | Selection | `None`, `Cancelled` |
| `x_studio_cancelled_by` | Cancelled By | Many2one → `res.users` | Who cancelled |
| `x_studio_cancelled_date` | Cancelled Date | Datetime | When cancelled |
| `x_studio_cancelled_stage_id` | Cancelled Stage Id | Many2one → `helpdesk.stage` | Stage at time of cancellation |

### 2.8 Re-estimation

| Field | Label | Type | Values |
|-------|-------|------|--------|
| `x_studio_re_estimate_count` | Re-estimate Count | Integer | Number of re-estimates done |
| `x_studio_re_estimate_status` | Re-estimate Status | Selection | `None`, `Re-estimated` |

### 2.9 Re-open Handling

| Field | Label | Type | Values |
|-------|-------|------|--------|
| `x_studio_reopened` | Reopened | Boolean | Ticket was reopened |
| `x_studio_reopen_status` | Reopen Status | Selection | `None`, `Reopened` |
| `x_studio_reopened_by` | Reopened By | Many2one → `res.users` | Who reopened |
| `x_studio_reopened_date` | Reopened Date | Datetime | When reopened |

### 2.10 Validation Flags (Used by Automated Actions / Buttons)

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_user_location_validation` | User Location Validation | Boolean | Validates user has correct location access |
| `x_studio_valid_confirm_return` | Valid Confirm Return | Boolean | Return confirmation valid |
| `x_studio_valid_return` | Valid Return | Boolean | Return is valid |
| `x_studio_valid_confirmed_so` | Valid Confirmed SO | Boolean | SO is confirmed |
| `x_studio_valid_confirmed2_so` | Valid Confirmed2 SO | Boolean | SO confirmed (2nd check) |
| `x_studio_valid_delivered_so` | Valid Delivered SO | Boolean | SO is delivered |
| `x_studio_valid_invoiced_so` | Valid Invoiced SO | Boolean | SO is invoiced |
| `x_studio_fully_paid_so` | Fully Paid SO | Boolean | SO fully paid |

### 2.11 Sales Order & Financials

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_sale_order` | Sales Order | Many2one → `sale.order` | Linked sales order |
| `x_studio_sales_price` | Sales Price | Char | Display price field |
| `x_studio_unit_price` | Unit Price | Char | Unit price display |
| `x_studio_balance_due` | Balance Due | Float | Outstanding balance |
| `x_studio_qty` | Qty | Char | Quantity display |
| `x_studio_quantity` | Quantity | Float | Numeric quantity |

### 2.12 Inventory & Picking

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_picking_id` | Picking Id | Many2one → `stock.picking` | Linked stock transfer |
| `x_studio_pick_id` | Pick Id | Integer | Picking ID reference |
| `x_studio_material_availability` | Material Availability | Selection | `Material Not Ready`, `Material Ready` |
| `x_x_studio_created_from_help_ticket_stock_picking_count` | Transfer Count | Integer | Smart button: number of transfers from this ticket |

### 2.13 Quick Repair

| Field | Label | Type | Values |
|-------|-------|------|--------|
| `x_studio_quick_repair_status` | Tested OK | Selection | `None`, `Quick Repair (Tested OK)` |

### 2.14 Stage History (Audit Trail Fields)

*Note: Fields `x_studio_created_by_1` through `x_studio_created_by_10` and `x_studio_created_on_1` through `x_studio_created_on_10` record who moved the ticket through each of up to 10 stages and when:*

| Pattern | Type | Notes |
|---------|------|-------|
| `x_studio_created_by_N` (N=1–10) | Many2one → `res.users` | User who moved to stage N |
| `x_studio_created_on_N` (N=1–10) | Datetime | Timestamp of stage N transition |

### 2.15 Related Fields (Relations)

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_related_field_FNjnC` | (Project Tasks) | One2many → `project.task` | Related FSM tasks |
| `x_studio_related_field_QuqN1` | (Integer) | Integer | Internal counter |

### 2.16 Studio-Modified Views (2)

| View | Type | Notes |
|------|------|-------|
| `Odoo Studio: helpdesk.ticket.form customization` | Form | Extensive form customization with custom fields, tabs, and buttons |
| `helpdesk.ticket.kanban` | Kanban | Kanban view customized to show repair-relevant info |

### 2.17 Automated Actions (6)

| Name | Trigger | Status | Purpose |
|------|---------|--------|---------|
| `JIN-Helpdesk(Repair) Seq.No` | On Create or Write | ✅ Active | Auto-assigns sequence number to repair tickets |
| `RR - Auto Populate Repair Location` | On Change | ✅ Active | Auto-fills repair location based on job type or user |
| `RR - Auto Select Product for RUG Repairs` | On Change | ✅ Active | Selects product when RUG flag is set |
| `RR - Auto Select Product for RUG Repairs-33` | On Change | ✅ Active | Variant of above (likely for a specific ticket type) |
| `RR - Auto Update Helpdesk Pipeline Status - 1` | On Create or Write | ✅ Active | Syncs helpdesk stage changes to project task |
| `RR - Validate Cancelled Tickets` | On Delete | ✅ Active | Validates/prevents invalid cancellation |

---

## 3. `helpdesk.ticket.type` — Studio Customizations

Ticket Types classify what kind of repair job the ticket is:

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_rug` | RUG | Boolean | This type is a warranty (RUG) repair |
| `x_studio_rug_confirmed` | RUG Confirmed | Boolean | RUG confirmed for this type |
| `x_studio_with_serial_no` | With Serial No | Boolean | Repair type requires serial number tracking |
| `x_studio_without_serial_no` | Without Serial No | Boolean | Repair type does not require serial tracking |

---

## 4. `helpdesk.stage` — Studio Customizations

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_company_id` | Company | Many2one → `res.company` | Company-specific stage visibility |

---

## 5. `project.task` — Repair-Related Studio Customizations

FSM tasks linked to helpdesk tickets carry these repair fields:

### 5.1 Classification & Status

| Field | Label | Type | Values |
|-------|-------|------|--------|
| `x_studio_quotation_type` | Quotation Type | Selection | `Sales`, `Project`, `Repair` |
| `x_studio_payment_type` | Payment Type | Selection | `Cash`, `Credit` |
| `x_studio_priority` | Priority | Selection | `Highest`, `High`, `Normal`, `Low`, `Lowest` |
| `x_studio_quick_repair_status_1` | Quick Repair Status | Selection | `None`, `Quick Repair` |
| `x_studio_material_availability` | Material Availability | Selection | `Material Not Ready`, `Material Ready` |

### 5.2 Dates & Tracking

| Field | Label | Type |
|-------|-------|------|
| `x_studio_created_date` | Created Date | Datetime |
| `x_studio_starting_date` | Starting Date | Datetime |

### 5.3 Repair Images & Documents

| Field | Label | Type |
|-------|-------|------|
| `x_studio_repair_image_01` | Repair Image 01 | Binary |
| `x_studio_repair_image_02` | Repair Image 02 | Binary |
| `x_studio_related_information` | Related Information | Binary |
| `x_studio_warranty_card` | Warranty Card | Binary |

### 5.4 Diagnosis

| Field | Label | Type | Notes |
|-------|-------|------|-------|
| `x_studio_diagnosis_ids` | Diagnosis Ids | One2many → `x_task_diagnosis` | Full diagnosis log lines |
| `x_studio_valid_diagnosis` | Valid Diagnosis | Boolean | Diagnosis is complete and valid |
| `x_studio_repair_reason` | Repair Reason | Many2many → `x_repair_reason` | Repair reasons selected |

### 5.5 SO Validation Flags

| Field | Label | Type |
|-------|-------|------|
| `x_studio_valid_confirm_so` | Valid Confirm SO | Boolean |
| `x_studio_valid_confirm2_so` | Valid Confirm2 SO | Boolean |
| `x_studio_valid_delivered_so` | Valid Delivered SO | Boolean |
| `x_studio_valid_delivered_so2` | Valid Delivered SO2 | Boolean |
| `x_studio_valid_invoiced_so` | Valid Invoiced SO | Boolean |
| `x_studio_fully_invoiced_so` | Fully Invoiced SO | Boolean |

### 5.6 Other Flags

| Field | Label | Type |
|-------|-------|------|
| `x_studio_cancelled` | Cancelled | Boolean |
| `x_studio_end_quick_repair` | End Quick Repair | Boolean |
| `x_studio_repair_completed_stage_updated` | Repair Completed Stage Updated | Boolean |
| `x_studio_incomplete_delivery_available` | Incomplete Delivery Available | Boolean |

### 5.7 Automated Actions (1)

| Name | Trigger | Status | Purpose |
|------|---------|--------|---------|
| `RR - Auto Update Helpdesk Pipeline Status - 1` | On Create or Write | ✅ Active | Pushes task stage changes back to helpdesk ticket |

---

## 6. Custom Master Data Models (Repair Domain)

### 6.1 `x_repair_stages` — Repair Stages

Custom stage master for the repair pipeline:

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Repair Stage | Char (name) |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_description` | Description | Char |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.2 `x_repair_reason` — Repair Reason (Internal)

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Repair Reason | Char |
| `x_color` | Color | Integer |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.3 `x_repair_reason_custom` — Repair Reason (Customer-Reported)

Same structure as `x_repair_reason` — used on `helpdesk.ticket` for reasons reported by the customer.

### 6.4 `x_repair_sub_reason` — Repair Sub Reason

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Sub Reason Code | Char |
| `x_studio_reason_code` | Reason Code | Many2one → `x_repair_reason` |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.5 `x_repair_accounts` — Repair Accounts

GL account mapping for repair-related journal entries (especially RUG/warranty):

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Name | Char |
| `x_studio_rug_account` | RUG Account | Many2one → `account.account` |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.6 `x_diagnosis_areas` — Diagnosis Areas

Top-level grouping for diagnosis (e.g. *Electrical*, *Mechanical*):

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Diagnosis Area | Char |
| `x_studio_description` | Description | Char |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.7 `x_diagnosis_codes` — Diagnosis Codes

Specific diagnosis codes under each area:

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Diagnosis Code | Char |
| `x_studio_diagnosis_area_1` | Diagnosis Area | Many2one → `x_diagnosis_areas` |
| `x_studio_description` | Description | Char |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.8 `x_symptom_areas` — Symptom Areas

Customer-reported symptom grouping:

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Symptom Area | Char |
| `x_studio_description` | Description | Char |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.9 `x_symptom_codes` — Symptom Codes

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Symptom Code | Char |
| `x_studio_symptom_area` | Symptom Area | Many2one → `x_symptom_areas` |
| `x_studio_description` | Description | Char |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.10 `x_resolutions` — Resolutions

Resolution codes applied when a repair job is closed:

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Resolution | Char |
| `x_studio_description` | Description | Char |
| `x_studio_sequence` | Sequence | Integer |
| `x_studio_company_id` | Company | Many2one → `res.company` |
| `x_active` | Active | Boolean |

### 6.11 `x_task_diagnosis` — Task Diagnosis (Lines)

Full diagnosis log attached to a `project.task`. This is a detailed one-to-many record of diagnostic findings:

| Field | Label | Type |
|-------|-------|------|
| `x_name` | Name | Char |
| `x_studio_task_id` | Task | Many2one → `project.task` |
| `x_studio_repair_stage` | Repair Stage | Many2one → `x_repair_stages` |
| `x_studio_symptom_area` | Symptom Area | Many2one → `x_symptom_areas` |
| `x_studio_symptom_code` | Symptom Code | Many2one → `x_symptom_codes` |
| `x_studio_diagnosis_area` | Diagnosis Area | Many2one → `x_diagnosis_areas` |
| `x_studio_diagnosis_code` | Diagnosis Code | Many2one → `x_diagnosis_codes` |
| `x_studio_reason` | Reason | Many2one → `x_repair_reason` |
| `x_studio_sub_reason` | Sub Reason | Many2one → `x_repair_sub_reason` |
| `x_studio_condition` | Condition | Many2one → `x_conditions` |
| `x_studio_resolution` | Resolution | Many2one → `x_resolutions` |
| `x_studio_description` | Description | Char |
| `x_studio_sequence` | Sequence | Integer |
| `x_active` | Active | Boolean |

---

## 7. Repair Workflow — Process Flow Summary

```
Customer → Helpdesk Ticket Created
              │
              ├─ Ticket Type selected (With/Without SN, RUG?)
              ├─ Serial Number assigned (x_studio_serial_no)
              ├─ Job Location determined (Centre / Factory)
              │
              ▼
         Estimation Stage
              ├─ Estimation sent to customer (x_studio_estimation_sent_stage_updated)
              └─ Customer approves (x_studio_estimation_approved_stage_updated)
                            │
                            ▼
                  Repair Started (x_studio_repair_started_stage_updated)
                       │
                       ├─ FSM Task created (project.task)
                       │     └─ Diagnosis logged (x_task_diagnosis lines)
                       │          Symptom Area → Symptom Code
                       │          Diagnosis Area → Diagnosis Code
                       │          Reason → Sub Reason → Resolution
                       │
                       ├─ RUG? → RUG request sent → RUG Approved/Rejected
                       │         (x_studio_rug_repair, x_studio_rug_approval_status)
                       │
                       ├─ Parts check (x_studio_material_availability)
                       │
                       ▼
              Repair Complete (x_studio_repair_complete_stage_updated)
                       │
                       ├─ Serial updated (x_studio_sn_updated)
                       ├─ Repair Order updated (x_studio_confirm_draft_quotation)
                       │
                       ▼
                  Invoice Stage (x_studio_invoice_stage_updated)
                       ├─ Sales Order confirmed → delivered → invoiced → paid
                       │   (x_studio_valid_confirmed_so → delivered → invoiced → fully_paid_so)
                       │
                       ▼
                   Handed Over (x_studio_handed_over)
```

---

## 8. Key Relations Between Models

```
helpdesk.ticket
    ├── repair.order          (one2many via ticket_id)
    ├── project.task          (one2many via fsm_task_ids)
    │       └── x_task_diagnosis (one2many via x_studio_task_id)
    │               ├── x_repair_stages
    │               ├── x_symptom_areas → x_symptom_codes
    │               ├── x_diagnosis_areas → x_diagnosis_codes
    │               ├── x_repair_reason → x_repair_sub_reason
    │               ├── x_conditions
    │               └── x_resolutions
    ├── stock.picking         (many2many via picking_ids)
    ├── sale.order            (via x_studio_sale_order)
    └── stock.lot             (via x_studio_serial_no)

repair.order
    ├── helpdesk.ticket       (many2one via ticket_id)
    ├── stock.move            (one2many — parts consumption)
    └── sale.order            (many2one via sale_order_id)
```

---

*This document was auto-generated from live staging database data.*  
*To convert these Studio customizations into a proper Odoo module, use the Studio Export feature or request code conversion.*
