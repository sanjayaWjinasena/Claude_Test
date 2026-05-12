# Repair & Helpdesk — Supplementary Dependencies & Flow Requirements

> This document covers everything OUTSIDE of repair.order and helpdesk.ticket that the repair workflow depends on.

---

## 1. Helpdesk Team Configuration

### Teams (3 records)

| Team Name | Alias | Use Repair | Use FSM | Use Returns | Use Credit Notes | Use SLA | Visibility | Members Count | Stages Count |
|-----------|-------|-----------|---------|-------------|-----------------|---------|------------|---------------|--------------|
| Customer Care - Repair | customer-care-repair | No | Yes | Yes | No | Yes | internal | 1 | 14 |
| Customer Care - Repair | support | No | Yes | Yes | No | Yes | internal | 1 | 14 |
| Customer Care - Repair JLD | customer-care-repair-jld | No | No | No | No | No | internal | 1 | 1 |

### Helpdesk Stage Details per Team

#### Customer Care - Repair (ID: 3)

| Stage | Sequence | Fold | Acknowledgment Email | Company |
|-------|----------|------|---------------------|---------|
| New | 0 | No | Ticket: Reception Acknowledgment | Jinasena (Pvt) Ltd. |
| New | 0 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Sent to Factory | 1 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Received at Factory | 2 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Diagnosis | 3 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Estimation Sent to Customer | 4 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Estimation Approval Received | 5 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Advance Received | 6 | Yes | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Repair Started | 7 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Repair Completed | 8 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Sent to Sales Centre | 9 | No | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Received at Sales Centre | 10 | Yes | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Handed Over to Customer | 11 | Yes | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| Cancelled | 12 | Yes | - | Jinasena Agricultural Machinery (Pvt) Ltd. |

#### Customer Care - Repair (ID: 1)

| Stage | Sequence | Fold | Acknowledgment Email | Company |
|-------|----------|------|---------------------|---------|
| New | 0 | No | Ticket: Reception Acknowledgment | Jinasena (Pvt) Ltd. |
| Sent to Factory | 1 | No | - | Jinasena (Pvt) Ltd. |
| Received at Factory | 2 | No | - | Jinasena (Pvt) Ltd. |
| On Hold | 2 | No | - | - |
| Diagnosis | 3 | No | - | Jinasena (Pvt) Ltd. |
| Estimation Sent to Customer | 4 | No | - | Jinasena (Pvt) Ltd. |
| Estimation Approval Received | 5 | No | - | Jinasena (Pvt) Ltd. |
| Advance Received | 6 | Yes | - | Jinasena (Pvt) Ltd. |
| Repair Started | 7 | No | - | Jinasena (Pvt) Ltd. |
| Repair Completed | 8 | No | - | Jinasena (Pvt) Ltd. |
| Sent to Sales Centre | 9 | No | - | Jinasena (Pvt) Ltd. |
| Received at Sales Centre | 10 | Yes | - | Jinasena (Pvt) Ltd. |
| Handed Over to Customer | 11 | Yes | - | Jinasena (Pvt) Ltd. |
| Cancelled | 12 | Yes | - | Jinasena (Pvt) Ltd. |

#### Customer Care - Repair JLD (ID: 7)

| Stage | Sequence | Fold | Acknowledgment Email | Company |
|-------|----------|------|---------------------|---------|
| New | 0 | No | Ticket: Reception Acknowledgment | JLTD |

### Ticket Types (4 records)

| ID | Name |
|----|------|
| 3 | Repair - Not Under Warranty (With Serial No) |
| 4 | Repair - Not Under Warranty (Without Serial No) |
| 2 | Repair - Under Warranty -  External not RUG |
| 1 | Repair - Under Warranty - RUG |

### Mail Aliases (repair-related)

| Alias Name | Domain | Model | Defaults |
|-----------|--------|-------|---------|
| customer-care-repair | localhost | Helpdesk Ticket | {'team_id': 3} |
| customer-care-repair-jld | localhost | Helpdesk Ticket | {'team_id': 7} |
| support | localhost | Helpdesk Ticket | {'team_id': 1} |
| website-customers- | localhost | Helpdesk Ticket | {'team_id': 11} |

---

## 2. Supplementary Studio Fields

### 2.1 stock.picking — All 51 x_studio_ Fields

#### Repair Routing

| Field | Label | Type | Relation/Selection | Required | Readonly | Related | Help |
|-------|-------|------|-------------------|----------|----------|---------|------|
| `x_studio_cash_full_payment_made` | Cash Full Payment Made | boolean | - | No | Yes | - | - |
| `x_studio_factory_repair` | Factory Repair | boolean | - | No | No | - | - |
| `x_studio_received_at_centre` | Received at Centre | boolean | - | No | No | - | - |
| `x_studio_repair_payment_made` | Repair Payment Made | boolean | - | No | Yes | - | - |
| `x_studio_repair_return_location` | Repair Return Location | boolean | - | No | Yes | location_dest_id.x_studio_repair_return_location | - |
| `x_studio_valid_factory_repair` | Valid Factory Repair | boolean | - | No | Yes | - | - |

#### Helpdesk Link

| Field | Label | Type | Relation/Selection | Required | Readonly | Related | Help |
|-------|-------|------|-------------------|----------|----------|---------|------|
| `x_studio_cancelled` | Cancelled | boolean | - | No | Yes | x_studio_created_from_help_ticket.x_studio_cancelled | - |
| `x_studio_created_from_help_ticket` | Created from Help Ticket | many2one | helpdesk.ticket | No | No | - | - |
| `x_studio_fsm_task_done` | FSM Task Done | boolean | - | No | Yes | - | - |
| `x_studio_fully_paid_so` | Fully Paid SO | boolean | - | No | Yes | - | - |
| `x_studio_helpdesk_ticket_id` | Helpdesk Ticket Id | many2one | helpdesk.ticket | No | No | - | - |
| `x_studio_task_status` | Task Status | boolean | - | No | Yes | x_studio_helpdesk_ticket_id.x_studio_task_status | - |
| `x_studio_ticket_sales_order` | Ticket Sales Order | many2one | sale.order | No | Yes | x_studio_helpdesk_ticket_id.x_studio_sale_order | - |

#### Transfer Control

| Field | Label | Type | Relation/Selection | Required | Readonly | Related | Help |
|-------|-------|------|-------------------|----------|----------|---------|------|
| `x_studio_need_approval` | Need Approval | boolean | - | No | Yes | - | - |
| `x_studio_transfer_approval` | Transfer Approval | boolean | - | No | No | - | - |
| `x_studio_transfer_approved` | Transfer Approved | boolean | - | No | No | - | - |
| `x_studio_transfer_rejected` | Transfer Rejected | boolean | - | No | No | - | - |
| `x_studio_transfer_request_sent` | Transfer Request Sent | boolean | - | No | No | - | - |
| `x_studio_user_location_validation` | User Location Validation | boolean | - | No | Yes | - | - |
| `x_studio_user_location_validation_2` | User Location Validation 2 | boolean | - | No | No | - | - |
| `x_studio_valid_transfer_lines` | Valid Transfer Lines | boolean | - | No | Yes | - | - |

#### Smart Button Counter Fields

| Field | Label | Type | Relation/Selection | Required | Readonly | Related | Help |
|-------|-------|------|-------------------|----------|----------|---------|------|
| `x_x_studio_create_from_transfer_1__account_move_count` | Create From Transfer count | integer | - | No | No | - | - |
| `x_x_studio_created_from_transfer__account_move_count` | Created From Transfer count | integer | - | No | No | - | - |

#### Other Fields

| Field | Label | Type | Relation/Selection | Required | Readonly | Related | Help |
|-------|-------|------|-------------------|----------|----------|---------|------|
| `x_studio_analytic_account` | Analytic Account | many2one | account.analytic.account | No | Yes | sale_id.analytic_account_id | - |
| `x_studio_budget_created` | Budget Created | boolean | - | No | Yes | sale_id.x_studio_budget_created | - |
| `x_studio_consignment_no` | Consignment No | many2one | x_consignment_header | No | No | - | - |
| `x_studio_created_from_material_request_no` | Created from Material Request No | many2one | x_material_request | No | No | - | - |
| `x_studio_custom_clearance_no` | Custom Clearance No | char | - | No | Yes | x_studio_consignment_no.x_studio_custom_clearance_no | - |
| `x_studio_gl_account_status` | G/L Account Status | selection | [('Pending', 'Pending'), ('Updated', 'Updated')] | No | No | - | - |
| `x_studio_journal_type` | Journal Type | many2one | x_journal_types | No | No | - | - |
| `x_studio_maintenance_request_` | Maintenance Request # | many2one | maintenance.request | No | No | - | - |
| `x_studio_mj_in` | MJ IN | boolean | - | No | Yes | picking_type_id.x_studio_mj_in | - |
| `x_studio_mj_out` | MJ OUT | boolean | - | No | Yes | picking_type_id.x_studio_mj_out | - |
| `x_studio_movement_journal` | Movement Journal | boolean | - | No | Yes | picking_type_id.x_studio_movement_journal | - |
| `x_studio_offset_account_updated` | Offset Account Updated | boolean | - | No | No | - | - |
| `x_studio_picking_count` | Picking Count | boolean | - | No | No | - | - |
| `x_studio_pr_type` | PR Type | selection | [('Local', 'Local'), ('Import', 'Import')] | No | Yes | purchase_id.x_studio_pr_type | - |
| `x_studio_quotation_type` | Quotation Type | selection | [('Sales', 'Sales'), ('Project', 'Project'), ('Repair', 'Repair')] | No | Yes | sale_id.x_studio_quotation_type | - |
| `x_studio_quotation_type_2` | Quotation Type-2 | selection | [('Sales', 'Sales'), ('Project', 'Project'), ('Repair', 'Repair')] | No | Yes | sale_id.x_studio_quotation_type | - |
| `x_studio_related_field_zZDiA` | New Related Field | selection | [('Sales', 'Sales'), ('Project', 'Project'), ('Repair', 'Repair')] | No | Yes | sale_id.x_studio_quotation_type | - |
| `x_studio_return_receipt_location` | Return Receipt Location | many2one | stock.location | No | Yes | location_dest_id.x_studio_return_receipt_location | - |
| `x_studio_return_sequence` | Return Sequence | many2one | ir.sequence | No | Yes | location_dest_id.x_studio_return_sequence | - |
| `x_studio_sales_order` | Sales Order | many2one | sale.order | No | No | - | - |
| `x_studio_sequence_code` | Sequence Code | char | - | No | Yes | picking_type_id.sequence_code | - |
| `x_studio_supplier_invoice_number` | Supplier Invoice Number | char | - | No | No | - | - |
| `x_studio_supplier_invoice_number_1` | Supplier Invoice Number | char | - | No | Yes | x_studio_consignment_no.x_studio_supplier_invoice_number | - |
| `x_studio_ttt` | TTT | boolean | - | No | No | - | - |
| `x_studio_type_of_operation` | Type of Operation | selection | [('incoming', 'Receipt'), ('outgoing', 'Delivery'), ('internal', 'Internal Transfer'), ('mrp_operation', 'Manufacturing')] | No | Yes | picking_type_id.code | - |
| `x_studio_update_consignment` | Update Consignment | boolean | - | No | No | - | - |
| `x_studio_validation` | Validation | char | - | No | No | - | - |
| `x_studio_xxx` | XXX | boolean | - | No | No | - | - |

#### Computed Field Details (stock.picking)

**`x_studio_cash_full_payment_made`** (Cash Full Payment Made) — depends: `sale_id`

```python
for rec in self:
  valid = False
  inv_found = False
  so_amount = rec.x_studio_ticket_sales_order.amount_total 
  inv_amount = 0
  if rec.x_studio_ticket_sales_order != False:
    if rec.x_studio_ticket_sales_order.state == 'cancel':
      if rec.x_studio_created_from_help_ticket.x_studio_repair_complete_stage_updated == True:
        valid = False
      if rec.x_studio_helpdesk_ticket_id.x_studio_repair_complete_stage_updated == True:
        valid = False  
    else:
      if rec.x_studio_ticket_sales_order.x_studio_order_payment_method == 'Cash':
        for invoices in rec.x_studio_ticket_sales_order.invoice_ids:
          ##if invoices.partner_id.x_studio_payment_method == 'Cash':
            inv_amount += invoices.amount_total
            if invoices.payment_state == 'not_paid' or invoices.payment_state == 'partial' or invoices.payment_state == 'reversed' or invoices.payment_state == 'invoicing_legacy':
              valid = True
            if rec.x_studio_ticket_sales_order.x_studio_rug_approved == True:
              valid = False
        
        if so_amount > inv_amount:
          valid = True
      else:
        for invoices in rec.x_studio_ticket_sales_order.invoice_ids:
          inv_found = True
          
        if inv_found == True:
          valid = False
        else:
          valid = True
       
      
  if rec.x_studio_created_from_help_ticket.x_studio_quick_repair_status == 'Quick Repair':
    valid = False
  
  if rec.x_studio_helpdesk_ticket_id.x_studio_quick_repair_status == 'Quick Repair':
    valid = False  
    
  rec['x_studio_cash_full_payment_made'] = valid 
```

**`x_studio_fsm_task_done`** (FSM Task Done) — depends: `x_studio_created_from_help_ticket,x_studio_helpdesk_ticket_id`

```python
for rec in self:
  value = False
  if rec.x_studio_created_from_help_ticket.id  != False:
    for line in rec.x_studio_created_from_help_ticket.fsm_task_ids:
      if line.fsm_done == True:
        value = True
      else:
        if line.x_studio_end_quick_repair == True:
          value = True
  elif rec.x_studio_helpdesk_ticket_id.id  != False:
    for line in rec.x_studio_helpdesk_ticket_id.fsm_task_ids:
      if line.fsm_done == True:
        value = True
      else:
        if line.x_studio_end_quick_repair == True:
          value = True
  
  rec['x_studio_fsm_task_done'] = value

```

**`x_studio_fully_paid_so`** (Fully Paid SO) — depends: `x_studio_created_from_help_ticket,x_studio_helpdesk_ticket_id`

```python
for rec in self:
  value = False
  if rec.x_studio_created_from_help_ticket.id != False:
    if rec.x_studio_created_from_help_ticket.x_studio_sale_order.id != False:
      if rec.x_studio_created_from_help_ticket.x_studio_sale_order.partner_id.id:
        if rec.x_studio_created_from_help_ticket.x_studio_sale_order.x_studio_order_payment_method == 'Credit':
          value = False
        else:
          value = rec.x_studio_created_from_help_ticket.x_studio_fully_paid_so
    else:
      if rec.x_studio_created_from_help_ticket.x_studio_quick_repair_status == 'Quick Repair':
          value = True
  elif rec.x_studio_helpdesk_ticket_id.id  != False:
    if rec.x_studio_helpdesk_ticket_id.x_studio_sale_order.id != False:
      if rec.x_studio_helpdesk_ticket_id.x_studio_sale_order.partner_id.id:
        if rec.x_studio_helpdesk_ticket_id.x_studio_sale_order.x_studio_order_payment_method == 'Credit':
          value = False
        else:
          value = rec.x_studio_helpdesk_ticket_id.x_studio_fully_paid_so
    else:
      #if rec.x_studio_helpdesk_ticket_id.x_studio_quick_repair_status == 'Quick Repair':
      value = True
      
  rec['x_studio_fully_paid_so'] = value
```

**`x_studio_need_approval`** (Need Approval) — depends: `picking_type_code`

```python
for rec in self:
  val = False
  if rec.picking_type_code == 'internal':
    if rec.origin == False:
      val = True
      
  if rec.picking_type_code == 'outgoing':
    if rec.origin != False:
      val = True
  
  rec['x_studio_need_approval'] = val
  
```

**`x_studio_repair_payment_made`** (Repair Payment Made) — depends: `sale_id`

```python
for rec in self:
  valid = False
  if rec.sale_id.id != False:
    if rec.sale_id.x_studio_order_payment_method == 'Credit':
      valid = True
    elif rec.sale_id.x_studio_rug_approved == True:
      valid = True
    else:
      #for invoices in rec.sale_id.invoice_ids:
      #  if invoices.payment_state == 'in_payment' or invoices.payment_state == 'partial' or invoices.payment_state == 'paid':
      #    valid = True
      payment = self.env['account.payment'].search([('x_studio_sales_order', '=', rec.sale_id.id),('state', '=', 'posted')])
      if payment:
        valid = True
      else:
        for invoices in rec.sale_id.invoice_ids:
          if invoices.payment_state == 'in_payment' or invoices.payment_state == 'partial' or invoices.payment_state == 'paid':
            valid = True
  rec['x_studio_repair_payment_made'] = valid 
```

**`x_studio_user_location_validation`** (User Location Validation) — depends: `x_studio_type_of_operation`

```python
for rec in self:
  company_ids = rec.env.context.get('allowed_company_ids', [rec.env.user.company_id.id])
  company = self.env['res.company'].browse(company_ids[0])
  
  valid = False
  valid2 = False
  if rec.x_studio_type_of_operation == 'internal':
    loc = self.env['stock.location'].search([('id', '=', rec.location_dest_id.id),('x_studio_users_internal_transfer', 'ilike', self._uid),('active', '=', True),('company_id', '=', company.id)],limit=1)
    if loc:
      valid = False
    else:
      valid = True
  else:
    if rec.x_studio_type_of_operation == 'outgoing':
      if rec.x_studio_created_from_help_ticket:
        loc = self.env['stock.location'].search([('id', '=', rec.location_dest_id.id),('x_studio_users_stock_location', 'ilike', self._uid),('active', '=', True),('company_id', '=', company.id)],limit=1)
        if loc:
          valid = False
        else:
          valid = True
      else:
        loc = self.env['stock.location'].search([('id', '=', rec.location_id.id),('x_studio_users_stock_location', 'ilike', self._uid),('active', '=', True),('company_id', '=', company.id)],limit=1)
        if loc:
          valid2 = False
        else:
          valid2 = True
    else:
      loc = self.env['stock.location'].search([('id', '=', rec.location_dest_id.id),('x_studio_users_stock_location', 'ilike', self._uid),('active', '=', True),('company_id', '=', company.id)],limit=1)
    if loc:
      valid = False
    else:
      valid = True
  
  rec['x_studio_user_location_validation'] = valid 
  rec['x_studio_user_location_validation_2'] = valid2 
  
```

**`x_studio_valid_factory_repair`** (Valid Factory Repair) — depends: `x_studio_created_from_help_ticket,x_studio_helpdesk_ticket_id`

```python
for rec in self:
  value = False
  value2 = False
  value3 = False 
  value4 = False
  if rec.x_studio_created_from_help_ticket.id != False:
    if rec.x_studio_created_from_help_ticket.x_studio_receive_at_factory == True:
      value = True
    if rec.x_studio_created_from_help_ticket.x_studio_job_location == 'Factory Repair':
      value2 = True
      
    value3 = rec.x_studio_created_from_help_ticket.x_studio_receive_at_centre
    
    if rec.x_studio_created_from_help_ticket.pickings_count > 1:
      value4 = True 
      
  elif rec.x_studio_helpdesk_ticket_id.id  != False:
    if rec.x_studio_helpdesk_ticket_id.x_studio_receive_at_factory == True:
      value = True
    if rec.x_studio_helpdesk_ticket_id.x_studio_job_location == 'Factory Repair':
      value2 = True
      
    value3 = rec.x_studio_helpdesk_ticket_id.x_studio_receive_at_centre
    
    if rec.x_studio_helpdesk_ticket_id.pickings_count > 1:
      value4 = True 
      
  rec['x_studio_factory_repair'] = value2
  rec['x_studio_received_at_centre'] = value3
  rec['x_studio_picking_count'] = value4
  rec['x_studio_valid_factory_repair'] = value
  
```

**`x_studio_valid_transfer_lines`** (Valid Transfer Lines) — depends: `move_line_ids_without_package,move_ids_without_package`

```python
for rec in self:
  valid_lines = False
  
  for line in rec.move_line_ids_without_package:
    valid_lines = True  
    
  for line in rec.move_ids_without_package:
    valid_lines = True
  
  rec['x_studio_valid_transfer_lines'] = valid_lines
```

**`x_x_studio_create_from_transfer_1__account_move_count`** (Create From Transfer count) — depends: `-`

```python

results = self.env['account.move'].read_group([('x_studio_create_from_transfer_1', 'in', self.ids)], ['x_studio_create_from_transfer_1'], ['x_studio_create_from_transfer_1'])
dic = {}
for x in results: dic[x['x_studio_create_from_transfer_1'][0]] = x['x_studio_create_from_transfer_1_count']
for record in self: record['x_x_studio_create_from_transfer_1__account_move_count'] = dic.get(record.id, 0)

```

**`x_x_studio_created_from_transfer__account_move_count`** (Created From Transfer count) — depends: `-`

```python

results = self.env['account.move'].read_group([('x_studio_created_from_transfer', 'in', self.ids)], ['x_studio_created_from_transfer'], ['x_studio_created_from_transfer'])
dic = {}
for x in results: dic[x['x_studio_created_from_transfer'][0]] = x['x_studio_created_from_transfer_count']
for record in self: record['x_x_studio_created_from_transfer__account_move_count'] = dic.get(record.id, 0)

```

---

### 2.2 stock.return.picking — All 5 x_studio_ Fields

| Field | Label | Type | Relation/Selection | Required | Readonly | Related | Help |
|-------|-------|------|-------------------|----------|----------|---------|------|
| `x_studio_repair_normal_with_serial_no` | Repair Normal With Serial No | boolean | - | No | Yes | ticket_id.x_studio_normal_repair_with_serial_no | - |
| `x_studio_repair_normal_without_serial_no` | Repair Normal Without Serial No | boolean | - | No | Yes | ticket_id.x_studio_normal_repair_without_serial_no | - |
| `x_studio_repair_rug` | Repair RUG | boolean | - | No | Yes | ticket_id.x_studio_rug_repair | - |
| `x_studio_suggested_location_id` | Suggested Return Location | many2one | stock.location | No | Yes | ticket_id.x_studio_virtual_location | - |
| `x_studio_suggested_location_id_1` | Suggested Return Location | many2one | stock.location | No | Yes | ticket_id.x_studio_virtual_location_1 | - |

---

### 2.3 stock.location — All 9 x_studio_ Fields

| Field | Label | Type | Relation/Selection | Required | Readonly | Purpose |
|-------|-------|------|-------------------|----------|----------|---------|
| `x_studio_finished_good_location` | Finished Good Location | boolean | - | No | No | Marks as finished goods location |
| `x_studio_many2many_field_7kpUe` | Users (Cell Visibility) | many2many | res.users | No | No | Cell visibility control (users who can see this location) |
| `x_studio_repair_factory_location` | Repair Factory Location | boolean | - | No | No | Marks location as factory repair destination |
| `x_studio_repair_return_location` | Repair Return Location | boolean | - | No | No | Marks location as repair return point |
| `x_studio_return_receipt_location` | Return Receipt Location | many2one | stock.location | No | No | Points to receipt location for returns |
| `x_studio_return_sequence` | Return Sequence | many2one | ir.sequence | No | No | IR sequence for return numbering |
| `x_studio_temp_location` | Temp Location | boolean | - | No | No | Marks as temporary staging location |
| `x_studio_users_internal_transfer` | Users (Internal Transfer) | many2many | res.users | No | No | Users permitted for internal transfers to this location |
| `x_studio_users_stock_location` | Users (Stock Location) | many2many | res.users | No | No | Users permitted to deliver from this stock location |

---

### 2.4 res.users — Repair-Relevant x_studio_ Fields

| Field | Label | Type | Relation | Required | Readonly | Purpose |
|-------|-------|------|---------|----------|----------|---------|
| `x_studio_many2many_field_Q50dg` | Inventory Locations | many2many | stock.location | No | No | Inventory Locations accessible to this user (m2m to stock.location) |
| `x_studio_many2many_field_bQRSA` | Inventory Locations | many2many | stock.location | No | No | Additional inventory locations for user (m2m to stock.location) |
| `x_studio_source_location` | Source Location | many2one | stock.location | No | No | Company 1: Source (physical) stock location for the user in repair transfers |
| `x_studio_source_location_1` | Source Location | many2one | stock.location | No | No | Company 2: Source (physical) stock location for the user |
| `x_studio_super_user` | Super User (All Items) | boolean | - | No | No | Grants unrestricted access to all items in transfers |
| `x_studio_super_user_melt_items` | Super User (Melt Items) | boolean | - | No | No | Grants access to melt/scrap item operations |
| `x_studio_virtual_location` | Virtual Location | many2one | stock.location | No | No | Company 1: Virtual location used when creating outgoing delivery for customer item |
| `x_studio_virtual_location_1` | Virtual Location | many2one | stock.location | No | No | Company 2: Virtual location used when creating outgoing delivery |

---

### 2.5 sale.order — Repair-Relevant Fields (11)

| Field | Label | Type | Required | Readonly | Related/Depends | Purpose |
|-------|-------|------|----------|----------|-----------------|---------|
| `x_studio_authorized_repair_user` | Authorized Repair User | boolean | No | Yes | task_id | Stored |
| `x_studio_fsm_done` | FSM Done | boolean | No | Yes | x_studio_quotation_type | Computed |
| `x_studio_repair_image_01` | Repair Image 01 | binary | No | Yes | task_id.x_studio_repair_image_01 | Related |
| `x_studio_repair_image_02` | Repair Image 02 | binary | No | Yes | task_id.x_studio_repair_image_02 | Related |
| `x_studio_repair_reason` | Repair Reason | many2many | No | Yes | task_id.x_studio_repair_reason | Related |
| `x_studio_repair_validation` | Repair Validation | char | No | No | - | Stored |
| `x_studio_rug_approved` | RUG Approved | boolean | No | No | - | Stored |
| `x_studio_rug_confirmed` | RUG Confirmed | boolean | No | Yes | task_id.helpdesk_ticket_id.x_studio_rug_confirmed | Related |
| `x_studio_rug_rejected` | RUG Rejected | boolean | No | No | - | Stored |
| `x_studio_rug_request_sent` | RUG Request Sent | boolean | No | No | - | Stored |
| `x_studio_warranty_card` | Warranty Card | binary | No | Yes | task_id.x_studio_warranty_card | Related |

#### sale.order Computed Field Details

**`x_studio_fsm_done`** (FSM Done) — depends: `x_studio_quotation_type`

```python
for rec in self:
  val = False
  if rec.x_studio_quotation_type == 'Repair':
    task_id = self.env['project.task'].search([('sale_order_id', '=', rec.id)],limit=1)
    if task_id:
      val = task_id.fsm_done
      
  rec['x_studio_fsm_done'] = val
```

---
## 3. Studio-Modified Views on Related Models

### stock.picking (2 views)

**Name:** stock.picking.form  
**ID:** 673 | **Model:** stock.picking | **Type:** form

```xml
<form string="Transfer" js_class="picking_form">

                <field name="is_locked" invisible="1"/>
                <field name="show_check_availability" invisible="1"/>
                <field name="show_lots_text" invisible="1"/>
                <field name="picking_type_code" invisible="1"/>
                <field name="hide_picking_type" invisible="1"/>
                <field name="show_allocation" invisible="1"/>
                <field name="show_reserved" invisible="1" readonly="1"/>
                <field name="move_line_exist" invisible="1"/>
                <field name="has_packages" invisible="1"/>
                <field name="picking_type_entire_packs" invisible="1"/>
                <field name="use_create_lots" invisible="1"/>
                <field name="company_id" invisible="1"/>

                <header>
                    <button name="action_confirm" invisible="state != 'draft'" string="Mark as Todo" type="object" class="oe_highlight" groups="base.group_user" data-hotkey="q"/>
                    <button name="action_assign" invisible="not show_check_availability" string="Check Availability" type="object" class="oe_highlight" groups="base.group_user" data-hotkey="w"/>
                    <button name="button_validate" invisible="state in ('draft', 'confirmed', 'done', 'cancel')" string="Validate" type="object" class="oe_highlight" groups="stock.group_stock_user" data-hotkey="v"/>
                    <button name="button_validate" invisible="state in ('waiting', 'assigned', 'done', 'cancel')" string="Validate" type="object" groups="stock.group_stock_user" class="o_btn_validate" data-hotkey="v"/>
                    <widget name="signature" string="Sign" highlight="1" invisible="not id or picking_type_code != 'outgoing' or state != 'done'" full_name="partner_id" groups="stock.group_stock_sign_delivery"/>
                    <widget name="signature" string="Sign" invisible="not id or picking_type_code != 'outgoing' or state == 'done'" full_name="partner_id" groups="stock.group_stock_sign_delivery"/>
                    <button name="do_print_picking" string="Print" groups="stock.group_stock_user" type="object" invisible="state != 'assigned'" data-hotkey="o"/>
                    <button string="Print Labels" type="object" name="action_open_label_type"/>
                    <button name="175" string="Print" invisible="state != 'done'" type="action" groups="base.group_user" data-hotkey="o"/>
                    <button name="195" string="Return" invisible="state != 'done'" type="action" groups="base.group_user" data-hotkey="k"/>
                    <field name="state" widget="statusbar" invisible="picking_type_code != 'incoming'" statusbar_visible="draft,assigned,done"/>
                    <field name="state" widget="statusbar" invisible="picking_type_code == 'incoming'" statusbar_visible="draft,confirmed,assigned,done"/>
                    <button name="action_cancel" invisible="state not in ('assigned', 'confirmed', 'draft', 'waiting')" string="Cancel" groups="base.group_user" type="object" confirm="Are you sure you want to cancel this transfer?" data-hotkey="x"/>
                </header>
                <sheet>
                    <div class="oe_button_box" name="button_box">
                        <field name="has_scrap_move" invisible="True"/>
                        <field name="has_tracking" invisible="True"/>
                        <button name="action_see_returns" type="object" class="oe_stat_button" icon="fa-rotate-left" invisible="return_count == 0">
                            <field string="Returns" name="return_count" widget="statinfo"/>
                        </button>
                        <button name="action_see_move_scrap" string="Scraps" type="object" class="oe_stat_button" icon="oi-arrows-v" invisible="not has_scrap_move"/>
                        <button name="action_see_packages" string="Packages" type="object" class="oe_stat_button" icon="fa-cubes" invisible="not has_packages"/>
                        <button name="168" icon="oi-arrow-up" class="oe_stat_button" type="action" invisible="state != 'done' or not has_tracking" groups="stock.group_production_lot">
                            <div class="o_stat_info">
                                <span class="o_stat_text">Traceability</span>
                            </div>
                        </button>
                        <button name="action_view_reception_report" type="object" context="{'default_picking_ids': [id]}" class="oe_stat_button" icon="fa-list" invisible="not show_allocation" groups="stock.group_reception_report">
                            <div class="o_stat_info">
                                <span class="o_stat_text">Allocation</span>
                            </div>
                        </button>
                        <!-- Use the following button to avoid onchange on one2many -->
                        <button name="action_picking_move_tree" class="oe_stat_button" icon="oi-arrows-v" type="object" help="List view of operations" groups="base.group_no_one" invisible="(is_locked or state == 'done') or state == 'done' and is_locked" context="{'picking_type_code': picking_type_code, 'default_picking_id': id, 'form_view_ref':'stock.view_move_form', 'address_in_id': partner_id, 'default_picking_type_id': picking_type_id, 'default_location_id': location_id, 'default_location_dest_id': location_dest_id}">
                            <div class="o_form_field o_stat_info">
                                <span class="o_stat_text">Operations</span>
                            </div>
                        </button>
                        <button name="action_detailed_operations" class="oe_stat_button" icon="fa-bars" type="object" help="List view of detailed operations">
                            <div class="o_form_field o_stat_info">
                                <span class="o_stat_text">Detailed Operations</span>
                            </div>
                        </button>
                    </div>
                    <div class="oe_title">
                        <h1 class="d-flex">
                            <field name="priority" widget="priority" class="me-3" invisible="name == '/'"/>
                            <field name="name" invisible="name == '/'"/>
                        </h1>
                    </div>
                    <group>
                        <group>
                            <div class="o_td_label">
                                <label for="partner_id" string="Delivery Address" style="font-weight:bold;" invisible="picking_type_code != 'outgoing'"/>
                                <label for="partner_id" string="Receive From" style="font-weight:bold;" invisible="picking_type_code != 'incoming'"/>
                                <label for="partner_id" string="Contact" style="font-weight:bold;" invisible="picking_type_code in ['incoming', 'outgoing']"/>
                            </div>
                            <field name="partner_id" nolabel="1" readonly="state in ['cancel', 'done']"/>
                            <field name="picking_type_id" options="{'no_open': True}" invisible="hide_picking_type" readonly="state != 'draft' and id" domain="context.get('restricted_picking_type_code') and [('code', '=', context.get('restricted_picking_type_code'))] or [(1,'=',1)]"/>
                            <field name="location_id" groups="!stock.group_stock_multi_locations" invisible="1" readonly="state == 'done'"/>
                            <field name="location_dest_id" groups="!stock.group_stock_multi_locations" invisible="1" readonly="state == 'done'"/>
                            <field name="location_id" options="{'no_create': True}" groups="stock.group_stock_multi_locations" invisible="picking_type_code == 'incoming'" readonly="state == 'done'"/>
                            <field name="location_dest_id" options="{'no_create': True}" groups="stock.group_stock_multi_locations" invisible="picking_type_code == 'outgoing'" readonly="state == 'done'"/>
                            <field name="backorder_id" invisible="not backorder_id"/>
                        </group>
                        <group>
                            <label for="scheduled_date"/>
                            <div class="o_row">
                                <field name="scheduled_date" readonly="state in ['cancel', 'done']" required="id" decoration-warning="state not in ('done', 'cancel') and scheduled_date &lt; now" decoration-danger="state not in ('done', 'cancel') and scheduled_date &lt; current_date" decoration-bf="state not in ('done', 'cancel') and (scheduled_date &lt; current_date or scheduled_date &lt; now)"/>
                                <field name="json_popover" nolabel="1" widget="stock_rescheduling_popover" invisible="not json_popover"/>
                            </div>
                            <field name="date_deadline" invisible="state in ('done', 'cancel') or not date_deadline" decoration-danger="date_deadline and date_deadline &lt; current_date" decoration-bf="date_deadline and date_deadline &lt; current_date"/>
                            <field name="products_availability_state" invisible="1"/>
                            <field name="products_availability" invisible="picking_type_code != 'outgoing' or state not in ['confirmed', 'waiting', 'assigned']" decoration-success="state == 'assigned' or products_availability_state == 'available'" decoration-warning="state != 'assigned' and products_availability_state in ('expected', 'available')" decoration-danger="state != 'assigned' and products_availability_state == 'late'"/>
                            <field name="date_done" string="Effective Date" invisible="state != 'done'"/>
                            <field name="origin" placeholder="e.g. PO0032" readonly="state in ['cancel', 'done']"/>
                            <field name="owner_id" groups="stock.group_tracking_owner" invisible="picking_type_code != 'incoming'" readonly="state in ['cancel', 'done']"/>
                        </group>
                    </group>
                    <field name="picking_properties" columns="2"/>
                    <notebook>
                        <page string="Operations" name="operations">
                            <field name="move_ids_without_package" mode="tree,kanban" widget="stock_move_one2many" readonly="state == 'done' and is_locked" context="{'default_company_id': company_id, 'default_date': scheduled_date, 'default_date_deadline': date_deadline, 'picking_type_code': picking_type_code, 'default_picking_id': id, 'form_view_ref': 'stock.view_stock_move_operations', 'address_in_id': partner_id, 'default_picking_type_id': picking_type_id, 'default_location_id': location_id, 'default_location_dest_id': location_dest_id, 'default_partner_id': partner_id}" add-label="Add a Product">
                                <tree decoration-muted="scrapped == True or state == 'cancel' or (state == 'done' and is_locked == True)" string="Stock Moves" editable="1">
                                    <field name="company_id" column_invisible="True"/>
                                    <field name="picking_id" column_invisible="True"/>
                                    <field name="name" column_invisible="True"/>
                                    <field name="state" readonly="0" column_invisible="True"/>
                                    <field name="picking_type_id" column_invisible="True"/>
                                    <field name="move_line_ids" column_invisible="True"/>
                                    <field name="location_id" column_invisible="True"/>
                                    <field name="location_dest_id" column_invisible="True"/>
                                    <field name="partner_id" column_invisible="True" readonly="state == 'done'"/>
                                    <field name="scrapped" column_invisible="True"/>
                                    <field name="picking_code" column_invisible="True"/>
                                    <field name="product_type" column_invisible="True"/>
                                    <field name="show_details_visible" column_invisible="True"/>
                                    <field name="show_reserved" column_invisible="True"/>
                                    <field name="additional" column_invisible="True"/>
                                    <field name="move_lines_count" column_invisible="True"/>
                                    <field name="is_locked" column_invisible="True"/>
                                    <field name="product_uom_category_id" column_invisible="True"/>
                                    <field name="has_tracking" column_invisible="True"/>
                                    <field name="display_assign_serial" column_invisible="True"/>
                                    <field name="product_id" context="{'default_detailed_type': 'product'}" required="1" readonly="(state != 'draft' and not additional) or move_lines_count &gt; 0" force_save="1"/>
                                    <field name="description_picking" string="Description" optional="hide"/>
                                    <field name="date" optional="hide"/>
                                    <field name="date_deadline" optional="hide"/>
                                    <field name="is_quantity_done_editable" column_invisible="True"/>
                                    <field name="show_quant" column_invisible="True"/>
                                    <field name="show_lots_text" column_invisible="True"/>
                                    <field name="show_lots_m2o" column_invisible="True"/>
                                    <field name="display_assign_serial" column_invisible="True"/>
                                    <field name="is_initial_demand_editable" column_invisible="True"/>
                                    <field name="display_import_lot" column_invisible="True"/>
                                    <field name="picking_type_entire_packs" column_invisible="True"/>
                                    <field name="product_packaging_id" groups="product.group_stock_packaging" context="{'default_product_id': product_id}" readonly="not product_id"/>
                                    <field name="product_uom_qty" string="Demand" readonly="not is_initial_demand_editable"/>
                                    <field name="forecast_expected_date" column_invisible="True"/>
                                    <field name="forecast_availability" string="Forecast" optional="hide" column_invisible="parent.state in ('draft', 'done') or parent.picking_type_code != 'outgoing'" widget="forecast_widget"/>
                                    <field name="product_qty" readonly="1" column_invisible="True"/>
                                    <field name="quantity" string="Quantity" readonly="not is_quantity_done_editable" column_invisible="parent.state=='draft'" decoration-danger="product_uom_qty and quantity &gt; product_uom_qty and parent.state not in ['done', 'cancel']"/>
                                    <field name="product_uom" readonly="state != 'draft' and not additional" options="{'no_open': True, 'no_create': True}" string="Unit" groups="uom.group_uom"/>
                                    <field name="product_uom" groups="!uom.group_uom" column_invisible="True"/>
                                    <field name="picked" optional="hide" column_invisible="parent.state=='draft'"/>
                                    <field name="lot_ids" widget="many2many_tags" column_invisible="parent.state == 'draft'" groups="stock.group_production_lot" invisible="not show_details_visible or has_tracking == 'none'" optional="hide" options="{'create': [('parent.use_create_lots', '=', True)]}" context="{'default_company_id': company_id, 'default_product_id': product_id, 'active_picking_id': parent.id}" domain="[('product_id','=',product_id)]"/>
                                    <button name="action_assign_serial" type="object" icon="fa-plus-square" role="img" title="Assign Serial Numbers" invisible="not display_assign_serial"/>
                                    <button type="object" name="action_product_forecast_report" title="Forecast Report" icon="fa-area-chart" invisible="quantity == 0 and forecast_availability &lt;= 0 or (parent.picking_type_code == 'outgoing' and state != 'draft')"/>
                                    <button type="object" name="action_product_forecast_report" title="Forecast Report" icon="fa-area-chart text-danger" invisible="quantity &gt; 0 or forecast_availability &gt; 0 or (parent.picking_type_code == 'outgoing' and state != 'draft')"/>
                                </tree>
                            </field>
                            <field name="id" invisible="1"/>
                            <field name="package_level_ids" context="{'default_location_id': location_id, 'default_location_dest_id': location_dest_id, 'default_company_id': company_id}" invisible="not picking_type_entire_packs" readonly="state == 'done'"/>
                            <button class="btn-secondary float-end" name="action_put_in_pack" type="object" string="Put in Pack" invisible="state in ('draft', 'done', 'cancel')" groups="stock.group_tracking_lot" data-hotkey="shift+g"/>
                        </page>
                        <page string="Additional Info" name="extra">
                            <group>
                                <group string="Other Information" name="other_infos">
                                    <field name="picking_type_code" invisible="1"/>
                                    <field name="move_type" invisible="picking_type_code == 'incoming'" readonly="state in ['cancel', 'done']"/>
                                    <field name="user_id" widget="many2one_avatar_user" domain="[('share', '=', False)]" readonly="state in ['cancel', 'done']"/>
                                    <field name="group_id" groups="base.group_no_one"/>
                                    <field name="company_id" groups="base.group_multi_company" options="{'no_create': True}" force_save="1"/>
                                </group>
                            </group>
                        </page>
                        <page string="Note" name="note">
                            <field name="note" string="Note" placeholder="Add an internal note that will be printed on the Picking Operations sheet"/>
                        </page>
                    </notebook>
                </sheet>
                <div class="oe_chatter">
                    <field name="message_follower_ids"/>
                    <field name="activity_ids"/>
                    <field name="message_ids"/>
                </div>
                </form>
```

**Name:** Odoo Studio: stock.picking.form customization  
**ID:** 2387 | **Model:** stock.picking | **Type:** form

```xml
<data>
  <!-- Kapila -->
  <xpath expr="//button[@name='action_assign']" position="attributes">
    <attribute name="help">'Verify if the required products are available in stock. '</attribute>
  </xpath>
  <xpath expr="//button[@name='action_assign']" position="after">
    <button type="action" name="1367" string="Update Consignment" class="btn-primary" invisible="(state == 'cancel') or (((x_studio_update_consignment == True) and (x_studio_pr_type == 'Import')) or ((x_studio_pr_type == False) or (x_studio_pr_type == 'Local')))"/>
  </xpath>
  <!-- Kapila -->
  <xpath expr="//form[1]/header[1]/button[@name='action_confirm']" position="attributes">
    <attribute name="help">The transfer order is ready to be processed, but the actual transfer has not been executed yet.
    </attribute>
  </xpath>
 <!-- Kapila -->
  <xpath expr="//form[1]/header[1]/button[@name='button_validate']" position="attributes">
    <attribute name="groups"/>
    <attribute name="help">Confirm or finalize the transaction</attribute>
  </xpath>
  <xpath expr="//form[1]/header[1]/button[@name='button_validate'][2]" position="attributes">
    <attribute name="help">Confirm or finalize the transaction</attribute>
  </xpath>
  <!-- Kapila -->
  <xpath expr="//button[@name='action_open_label_type']" position="attributes">
    <attribute name="studio_approval">True</attribute>
  </xpath>
  <xpath expr="//button[@name='175']" position="attributes">
    <attribute name="groups">stock.group_stock_user</attribute>
  </xpath>
  <xpath expr="//button[@name='175']" position="after">
    <button type="action" name="195" string="Dispatch" invisible="((x_studio_received_at_centre == False) and ((x_studio_factory_repair == True) and (x_studio_created_from_help_ticket != False))) or (((x_studio_received_at_centre == False) and ((x_studio_factory_repair == True) and (x_studio_helpdesk_ticket_id != False))) or (((x_studio_valid_factory_repair == False) and ((x_studio_factory_repair == True) and (x_studio_created_from_help_ticket != False))) or (((x_studio_valid_factory_repair == False) and ((x_studio_factory_repair == True) and (x_studio_helpdesk_ticket_id != False))) or (((x_studio_fsm_task_done == False) and (x_studio_created_from_help_ticket != False)) or (((x_studio_fsm_task_done == False) and (x_studio_helpdesk_ticket_id != False)) or (((x_studio_cancelled == False) and ((x_studio_task_status == False) and (x_studio_helpdesk_ticket_id != False))) or ((state != 'done') or ((x_studio_helpdesk_ticket_id == False) or ((x_studio_cash_full_payment_made == True) or ((x_studio_fully_paid_so == False) or (x_studio_picking_count == True)))))))))))"/>
    <button type="action" name="1999" string="Retun Reject Reason" class="btn-primary" invisible="((x_studio_fsm_task_done == True) and (x_studio_created_from_help_ticket != False)) or (((x_studio_fsm_task_done == True) and (x_studio_helpdesk_ticket_id != False)) or ((state != 'done') or ((x_studio_helpdesk_ticket_id == False) or (x_studio_cancelled == True))))"/>
  </xpath>
  <xpath expr="//form[1]/header[1]/button[@name='195'][2]" position="attributes">
    <attribute name="invisible">(state != 'done') or (((x_studio_task_status == False) and (x_studio_helpdesk_ticket_id != False)) or ((state != 'done') or (x_studio_helpdesk_ticket_id != False)))</attribute>
  </xpath>
  <xpath expr="//button[@name='action_cancel']" position="attributes">
    <attribute name="studio_approval">True</attribute>
  </xpath>
  <xpath expr="//button[@name='168']" position="after">
    <button class="oe_stat_button" icon="fa-folder-open" type="action" name="1362" studio-view-group-names="User" studio-view-group-ids="81" invisible="x_x_studio_created_from_transfer__account_move_count == 0">
      <field widget="statinfo" name="x_x_studio_created_from_transfer__account_move_count" string="Vend. Dispatch Reversal" studio-view-group-names="User" studio-view-group-ids="81"/>
    </button>
    <button class="oe_stat_button" icon="fa-folder-open" type="action" name="1363" studio-view-group-names="User" studio-view-group-ids="81" invisible="x_x_studio_create_from_transfer_1__account_move_count == 0">
      <field widget="statinfo" name="x_x_studio_create_from_transfer_1__account_move_count" string="Custom Clearance Reversal" studio-view-group-names="User" studio-view-group-ids="81"/>
    </button>
  </xpath>
  <xpath expr="//button[@name='action_view_stock_valuation_layers']" position="attributes">
    <attribute name="groups"/>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='partner_id']" position="attributes">
    <attribute name="force_save">True</attribute>
    <attribute name="readonly">(state in ['cancel', 'done']) or ((x_studio_pr_type == 'Import') or (state in ['done', 'cancel']))</attribute>
    <attribute name="required">(carrier_id and carrier_id.integration_level == 'rate_and_ship') or ((delivery_type not in ['fixed', 'base_on_rule']) and (delivery_type != False))</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='picking_type_id']" position="attributes">
    <attribute name="domain">[["code","=",picking_type_code]]</attribute>
    <attribute name="help">Warehouse and the operation type.</attribute>
    <attribute name="invisible">(hide_picking_type) or (hide_picking_type == True)</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='location_id']" position="attributes">
    <attribute name="domain">[]</attribute>
    <attribute name="invisible">picking_type_code == 'incoming'</attribute>
    <attribute name="readonly">(x_studio_type_of_operation != 'internal') or ((picking_type_code == 'internal') or (state not in ['draft']))</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='location_dest_id']" position="attributes">
    <attribute name="help">Destination Location.</attribute>
    <attribute name="invisible">picking_type_code == 'outgoing'</attribute>
    <attribute name="readonly">state not in ['draft']</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='location_dest_id']" position="after">
    <field name="x_studio_need_approval" string="Need Approval" invisible="1"/>
    <field name="x_studio_helpdesk_ticket_id" string="Helpdesk Ticket Id" invisible="x_studio_helpdesk_ticket_id == False"/>
    <field name="x_studio_created_from_help_ticket" string="Created from Help Ticket" force_save="True" readonly="1" invisible="x_studio_created_from_help_ticket == False"/>
    <field name="x_studio_created_from_material_request_no" string="Created from Material Request No" force_save="True" readonly="1" invisible="x_studio_created_from_material_request_no == False"/>
    <field name="x_studio_cancelled" string="Cancelled" invisible="1"/>
    <field name="x_studio_task_status" string="Task Status" invisible="1"/>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[2]/label[1]" position="before">
    <field name="x_studio_sales_order" string="Sales Order" domain="[('partner_id', '=', partner_id)]" readonly="(partner_id == False) or (state != 'draft')"/>
  </xpath>
  <xpath expr="//field[@name='date_done']" position="after">
    <field name="purchase_id" help="Purchase Order Number which goods are to be received from." invisible="purchase_id == False"/>
    <field name="x_studio_supplier_invoice_number" force_save="1" help="Invoice number of the supplier's invoice." invisible="purchase_id == False" readonly="(x_studio_pr_type == 'Import') or (state == 'done')" required="purchase_id != False"/>
    <field name="x_studio_supplier_invoice_number_1" string="Supplier Invoice Number" invisible="1" required="purchase_id != False"/>
    <field name="x_studio_pr_type" string="PR Type" help="Whether the purchase is import or a local." invisible="(x_studio_pr_type == False) or (x_studio_pr_type == 'Local')"/>
    <field name="x_studio_consignment_no" string="Consignment No" domain="[('x_studio_status', '=', 'Done')]" help="Consignment number." invisible="(x_studio_pr_type == False) or (x_studio_pr_type == 'Local')" readonly="x_studio_update_consignment == True" required="x_studio_pr_type == 'Import'"/>
    <field name="x_studio_custom_clearance_no" string="Custom Clearance No" help="Custom Clearance Number." invisible="(x_studio_pr_type == False) or (x_studio_pr_type == 'Local')"/>
    <field name="x_studio_update_consignment" string="Update Consignment" invisible="1"/>
  </xpath>
  <xpath expr="//field[@name='origin']" position="attributes">
    <attribute name="invisible">purchase_id != False</attribute>
    <attribute name="readonly">(state in ['cancel', 'done']) or ((x_studio_sales_order != False) or (state in ['done', 'cancel']))</attribute>
  </xpath>
  <xpath expr="//field[@name='origin']" position="after">
    <field name="x_studio_journal_type" string="Journal Type" options="{&quot;no_create&quot;:true}" invisible="x_studio_movement_journal == False" readonly="False" required="x_studio_movement_journal == True" force_save="0"/>
    <field name="x_studio_gl_account_status" string="G/L Account Status" force_save="True" readonly="1" invisible="x_studio_movement_journal == False"/>
    <field name="x_studio_offset_account_updated" string="Offset Account Updated" force_save="True" readonly="1" invisible="1"/>
    <field name="sale_id" force_save="True" readonly="1" invisible="sale_id == False"/>
    <field name="x_studio_ticket_sales_order" string="Ticket Sales Order" invisible="x_studio_ticket_sales_order == False"/>
    <field name="x_studio_repair_payment_made" string="Repair Payment Made" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_cash_full_payment_made" string="Cash Full Payment Made" invisible="1"/>
    <field name="x_studio_quotation_type" string="Quotation Type" required="False" force_save="1" readonly="True"/>
    <field name="x_studio_type_of_operation" string="Type of Operation"/>
    <field name="x_studio_sequence_code" string="Sequence Code" invisible="1"/>
    <field name="x_studio_movement_journal" string="Movement Journal" invisible="1"/>
    <field name="x_studio_mj_in" string="MJ IN" invisible="1"/>
    <field name="x_studio_mj_out" string="MJ OUT" invisible="1"/>
    <field name="x_studio_valid_factory_repair" string="Valid Factory Repair" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_quotation_type_2" string="Quotation Type-2" invisible="1"/>
    <field name="x_studio_analytic_account" string="Analytic Account" invisible="x_studio_quotation_type != 'Project'"/>
    <field name="x_studio_budget_created" string="Budget Created" invisible="1"/>
    <field name="x_studio_repair_return_location" string="Repair Return Location" invisible="1"/>
    <field name="x_studio_return_receipt_location" string="Return Receipt Location" invisible="1"/>
    <field name="x_studio_return_sequence" string="Return Sequence" invisible="1"/>
    <field name="x_studio_maintenance_request_" string="Maintenance Request #" invisible="1"/>
    <field name="x_studio_transfer_approval" string="Transfer Approval" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_transfer_request_sent" string="Transfer Request Sent" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_transfer_approved" string="Transfer Approved" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_transfer_rejected" string="Transfer Rejected" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_valid_transfer_lines" string="Valid Transfer Lines" force_save="True" readonly="1" invisible="1"/>
  </xpath>
  <xpath expr="//field[@name='owner_id']" position="after">
    <field name="x_studio_user_location_validation" string="User Location Validation" invisible="1"/>
    <field name="x_studio_user_location_validation_2" string="User Location Validation 2" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_picking_count" string="Picking Count" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_fsm_task_done" string="FSM Task Done" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_fully_paid_so" string="Fully Paid SO" invisible="1"/>
    <field name="x_studio_factory_repair" string="Factory Repair" force_save="True" readonly="1" invisible="1"/>
    <field name="x_studio_received_at_centre" string="Received at Centre" invisible="1" force_save="True" readonly="1"/>
    <field name="x_studio_validation" string="Validation" force_save="True" readonly="1" invisible="((x_studio_received_at_centre == True) and (x_studio_factory_repair == True)) or (x_studio_factory_repair != True)"/>
  </xpath>
  <xpath expr="//field[@name='move_ids_without_package']" position="attributes">
    <attribute name="readonly">(state == 'done' and is_locked) or (((x_studio_update_consignment == True) and (x_studio_pr_type == 'Import')) or ((is_locked == True) and (state == 'done')))</attribute>
  </xpath>
  <xpath expr="//field[@name='description_picking']" position="after">
    <field name="x_studio_update_consignment" string="Update Consignment" column_invisible="1"/>
    <field name="x_studio_pr_type" string="PR Type" column_invisible="1"/>
  </xpath>
  <xpath expr="//button[@name='action_put_in_pack']" position="attributes">
    <attribute name="groups">stock.group_tracking_lot,base.group_erp_manager</attribute>
    <attribute name="studio_approval">True</attribute>
  </xpath>
</data>
```

### stock.return.picking (2 views)

**Name:** Odoo Studio: Return customization  
**ID:** 4617 | **Model:** stock.return.picking | **Type:** form

```xml
<data>
  <xpath expr="//field[@name='ticket_id']" position="after">
    <field name="x_studio_repair_rug" invisible="1"/> 
    <field name="x_studio_repair_normal_with_serial_no" invisible="1"/>
    <field name="x_studio_repair_normal_without_serial_no" invisible="1"/>
  </xpath> 
    
  <xpath expr="//field[@name='picking_id']" position="attributes">
    <attribute name="readonly">(x_studio_repair_normal_without_serial_no != False) or ((x_studio_repair_normal_with_serial_no != False) or (x_studio_repair_rug != False))</attribute><attribute name="required">ticket_id != False</attribute></xpath> 
</data>
```

**Name:** Odoo Studio: Return lines customization-2  
**ID:** 4619 | **Model:** stock.return.picking | **Type:** form

```xml
<data>
    <xpath expr="//field[@name='location_id']" position="before">
      <!--field name="x_studio_suggested_location_id" attrs="{'invisible': [('x_studio_repair_normal_without_serial_no', '=', True)]}"/--> 
      <field name="x_studio_suggested_location_id" invisible="company_id != 1"/>
      <field name="x_studio_suggested_location_id_1" invisible="company_id != 2"/>
    </xpath> 
    
    <xpath expr="//footer/button[@name='create_returns']" position="after">
      <!--button type="action" name="1997" string="Return" class="btn-primary" attrs="{'invisible': ['|',('ticket_id', '=', False),('x_studio_repair_normal_without_serial_no', '=', True)]}"></button-->
      <button type="action" name="1997" string="Return" class="btn-primary" invisible="ticket_id == False"/>
    </xpath>
    
    <!--xpath expr="//footer/button[@name='create_returns']" position="attributes">
    <attribute name="attrs">{'readonly': ['|',('x_studio_repair_rug', '=', True),('x_studio_repair_normal_with_serial_no', '=', True)]}</attribute>
    </xpath--> 
    
  </data>
```

### stock.picking.type (1 view)

**Name:** Odoo Studio: Operation Types customization  
**ID:** 5328 | **Model:** stock.picking.type | **Type:** form

```xml
<data>
  <xpath expr="//form[1]" position="attributes">
    <attribute name="create">false</attribute>
  </xpath>
  <xpath expr="//field[@name='sequence_id']" position="attributes">
    <attribute name="groups"/>
  </xpath>
  <xpath expr="//field[@name='create_backorder']" position="after">
    <field name="x_studio_movement_journal" string="Movement Journal"/>
    <field name="x_studio_mj_out" string="MJ OUT"/>
    <field name="x_studio_mj_in" string="MJ IN"/>
  </xpath>
</data>
```

### res.users (2 views)

**Name:** res.users.groups  
**ID:** 158 | **Model:** res.users | **Type:** form

```xml
<field name="groups_id" position="replace">
  <field name="sel_groups_1_9_10" invisible="1" on_change="1"/>
  <field name="in_group_227" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_228" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_229" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_230" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_251" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_143" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_201" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_250" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_249" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_112" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_113" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_200" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_236" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_235" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_245" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_246" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_253" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_202" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_217" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_199" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_198" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_216" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_237" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_84" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_144" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_231" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_32" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_264" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_31" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_21" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_20" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_77" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_220" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_252" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_221" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_432" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_247" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_219" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_238" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_76" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_257" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_128" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_258" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_125" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_129" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_255" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_256" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_130" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_127" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_132" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_135" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_131" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_260" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_126" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_259" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_137" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_223" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_414" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_136" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_133" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_101" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_42" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_27" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_60" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_66" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_7" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_14" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_43" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_54" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_29" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_421" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_508" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_13" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_429" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_416" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_75" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_65" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_17" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_409" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_23" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_72" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_425" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_156" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_430" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_64" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_149" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_26" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_22" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_139" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_18" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_12" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_19" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_24" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_15" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_16" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_25" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_152" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_78" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_83" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_406" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_426" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_467" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_472" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_470" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_469" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_471" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_140" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_420" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_424" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_411" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_67" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_79" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_423" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_45" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_70" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_418" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_28" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_507" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_44" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_61" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_407" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_114" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_115" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_148" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_428" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_102" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_415" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_187" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_80" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_410" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_413" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_34" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_153" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_412" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_35" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_150" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_151" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_417" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_155" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_419" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_8" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_4" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_5" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_6" groups="!base.group_no_one" readonly="sel_groups_1_9_10 != 1" invisible="1"/>
  <field name="in_group_398" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_399" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_400" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_401" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_208" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_468" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_403" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_402" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_122" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_123" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_271" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_170" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_197" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_171" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_189" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_192" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_191" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_185" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_203" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_204" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_210" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_100" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_98" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_99" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_105" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <field name="in_group_173" readonly="sel_groups_1_9_10 != 1" invisible="1" groups="!base.group_no_one"/>
  <group groups="base.group_no_one">
    <separator string="User Type" colspan="2" groups="base.group_no_one"/>
    <field name="sel_groups_1_9_10" widget="radio" on_change="1"/>
    <newline/>
  </group>
  <group invisible="sel_groups_1_9_10 != 1">
    <div class="alert alert-warning" role="alert" colspan="2" invisible="not user_group_warning">
      <label for="user_group_warning" string="Access Rights Mismatch" class="text text-warning fw-bold"/>
      <field name="user_group_warning"/>
    </div>
  </group>
  <group invisible="sel_groups_1_9_10 != 1">
    <group string="Sales">
      <newline/>
      <field name="sel_groups_48_49_50" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_62_63" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_52_53" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Services">
      <newline/>
      <field name="sel_groups_68_69" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_55_56_57" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_146_147_225_226_234" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Accounting">
      <newline/>
      <field name="sel_groups_38_39_40_41_172_174_175_176_177_209_261_263" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_427" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Inventory">
      <newline/>
      <field name="sel_groups_58_59" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Manufacturing">
      <newline/>
      <field name="sel_groups_85_86_232_233" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_81_82" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Website">
      <newline/>
      <field name="sel_groups_243_244" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_445_446" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_141_142" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Marketing">
      <newline/>
      <field name="sel_groups_138" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Human Resources">
      <newline/>
      <field name="sel_groups_108_109" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_239_240" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_46_47" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_116_404" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_103_104" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_120_121_408" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_117_118_119" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_92" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Productivity">
      <newline/>
      <field name="sel_groups_87_88" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Localization">
      <newline/>
      <field name="sel_groups_188" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Administration">
      <newline/>
      <field name="sel_groups_2_3_182_183" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
    <group string="Other">
      <newline/>
      <field name="sel_groups_107" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_465_466" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_272" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_422" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
      <field name="sel_groups_513_514_515_516" readonly="sel_groups_1_9_10 != 1" on_change="1"/>
      <newline/>
    </group>
  </group>
  <group invisible="sel_groups_1_9_10 != 1" groups="base.group_no_one" class="o_label_nowrap">
    <separator string="Purchase"/>
    <group>
      <field name="in_group_227" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_229" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_251" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_201" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_249" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_113" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_236" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_245" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_253" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_217" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_198" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_237" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_228" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_230" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_143" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_250" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_112" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_200" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_235" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_246" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_202" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_199" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_216" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Maintenance"/>
    <group>
      <field name="in_group_84" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_231" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_144" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Project"/>
    <group>
      <field name="in_group_32" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_31" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_264" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Inventory"/>
    <group>
      <field name="in_group_21" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_20" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Manufacturing"/>
    <group>
      <field name="in_group_77" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_252" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_432" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_219" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_76" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_220" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_221" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_247" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_238" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Sales"/>
    <group>
      <field name="in_group_257" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_258" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_129" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_256" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_127" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_135" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_260" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_259" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_128" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_125" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_255" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_130" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_132" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_131" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_126" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Payroll"/>
    <group>
      <field name="in_group_137" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_414" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_223" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_136" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Manufacturing"/>
    <group>
      <field name="in_group_133" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_101" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Technical" groups="base.group_no_one"/>
    <group>
      <field name="in_group_42" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_60" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_7" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_43" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_29" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_508" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_429" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_75" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_17" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_23" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_425" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_430" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_149" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_22" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_18" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_19" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_15" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_25" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_78" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_406" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_467" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_470" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_471" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_420" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_411" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_79" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_45" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_418" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_507" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_61" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_114" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_148" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_102" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_187" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_410" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_34" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_412" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_150" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_417" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_419" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_27" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_66" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_14" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_54" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_421" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_13" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_416" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_65" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_409" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_72" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_156" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_64" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_26" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_139" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_12" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_24" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_16" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_152" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_83" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_426" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_472" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_469" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_140" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_424" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_67" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_423" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_70" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_28" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_44" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_407" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_115" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_428" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_415" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_80" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_413" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_153" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_35" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_151" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_155" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Extra Rights" groups="base.group_no_one"/>
    <group>
      <field name="in_group_8" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_5" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_4" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_6" invisible="1" groups="base.group_no_one" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <separator string="Other"/>
    <group>
      <field name="in_group_398" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_400" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_208" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_403" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_122" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_271" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_197" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_189" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_191" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_203" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_210" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_98" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_105" readonly="sel_groups_1_9_10 != 1"/>
    </group>
    <group>
      <field name="in_group_399" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_401" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_468" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_402" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_123" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_170" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_171" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_192" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_185" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_204" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_100" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_99" readonly="sel_groups_1_9_10 != 1"/>
      <field name="in_group_173" readonly="sel_groups_1_9_10 != 1"/>
    </group>
  </group>
</field>
```

**Name:** Odoo Studio: res.users.form customization  
**ID:** 2392 | **Model:** res.users | **Type:** form

```xml
<data>
  <xpath expr="//button[@name='action_open_employees']" position="after">
    <button class="oe_stat_button" icon="fa-cubes" type="action" name="2487">
      <field widget="statinfo" name="x_x_studio_users_stock_location_stock_location_count" string="Stock Locations"/>
    </button>
    <button class="oe_stat_button" icon="fa-cubes" type="action" name="2488">
      <field widget="statinfo" name="x_x_studio_users_internal_transfer_stock_location_count" string="Internal Locations"/>
    </button>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/div[not(@name)][2]/group[1]/field[@name='partner_id']" position="attributes">
    <attribute name="invisible">(not id) or (id == False)</attribute><attribute name="readonly"/></xpath>
  <xpath expr="//field[@name='sel_groups_146_147_225_226_234']" position="attributes">
    <attribute name="string">Helpdesk - ( Repair )</attribute>
  </xpath>
  <xpath expr="//field[@name='active']" position="attributes">
    <attribute name="invisible"/></xpath>
  <xpath expr="//field[@name='tz']" position="after">
    <field name="x_studio_virtual_location" string="Virtual Location" options="{&quot;no_create&quot;:true}" invisible="x_studio_company_id != 1"/>
    <field name="x_studio_virtual_location_1" options="{'create_name_field': 'complete_name'}" string="Virtual Location" invisible="x_studio_company_id != 2"/>
    <field name="x_studio_source_location" string="Source Location" options="{&quot;no_create&quot;:true}" invisible="x_studio_company_id != 1"/>
    <field name="x_studio_source_location_1" options="{'create_name_field': 'complete_name'}" string="Source Location" invisible="x_studio_company_id != 2"/>
    <field name="x_studio_company_id" string="Current Company" invisible="1"/>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/notebook[1]" position="inside">
    <page string="Recruitment" name="studio_page_AZpEI">
      <group name="studio_group_AZpEI">
        <group name="studio_group_AZpEI_left">
          <field name="x_studio_recr_stages" string="Recruitment Stages" widget="many2many_tags" options="{&quot;color_field&quot;: &quot;x_color&quot;}"/>
        </group>
        <group name="studio_group_AZpEI_right"/>
      </group>
    </page>
    <page string="Manufacturing" name="studio_page_diV0C">
      <group name="studio_group_diV0C">
        <group name="studio_group_diV0C_left">
          <field name="x_studio_super_user_melt_items" string="Super User (Melt Items)"/>
          <field name="x_studio_super_user" string="Super User (All Items)" invisible="1"/>
        </group>
        <group name="studio_group_diV0C_right"/>
      </group>
    </page>
    <page string="Attendance Mgt." name="studio_page_AgKEb">
      <group name="studio_group_AgKEb">
        <group name="studio_group_AgKEb_left">
          <field name="x_studio_attendance_administrator" string="Attendance Administrator"/>
        </group>
        <group name="studio_group_AgKEb_right"/>
      </group>
    </page>
  </xpath>
</data>
```

### helpdesk.team (1 view)

**Name:** Odoo Studio: helpdesk.team.tree customization  
**ID:** 5302 | **Model:** helpdesk.team | **Type:** tree

```xml
<data>
  <xpath expr="//field[@name=&quot;use_alias&quot;]" position="after">
    <field name="id" optional="show"/>
  </xpath>
</data>
```

---

## 4. Server Actions on Related Models

### 4.1 stock.picking — Repair-Related Server Actions (8)

#### PROJ - Show Validate Block Errors (ID: 2181)
**State:** code

```python
if record.id:
  raise UserError('Create the budget for the selected project sales order to proceed.')
```

#### RR - Re_return Validation (ID: 1999)
**State:** code

```python
if record.id:
  raise UserError('Perform "Mark As Done" in the linked Task to proceed.')
     






```

#### RR - Request Transfer Approval (ID: 2204)
**State:** multi

```python
# Available variables:
#  - env: Odoo Environment on which the action is triggered
#  - model: Odoo Model of the record on which the action is triggered; is a void recordset
#  - record: record on which the action is triggered; may be void
#  - records: recordset of all records on which the action is triggered in multi-mode; may be void
#  - time, datetime, dateutil, timezone: useful Python libraries
#  - float_compare: Odoo function to compare floats based on specific precisions
#  - log: log(message, level='info'): logging function to record debug information in ir.logging table
#  - UserError: Warning Exception to use with raise
#  - Command: x2Many commands namespace
# To return an action, assign: action = {...}




```

#### RR - Transfer Approval (ID: 2205)
**State:** object_write

**Type:** Write Field  
**Field:** `x_studio_transfer_approved`  
**Value:** `Yes`  
**Boolean Value:** `true`

#### RR - Transfer Approval Request Sent (ID: 2201)
**State:** object_write

**Type:** Write Field  
**Field:** `x_studio_transfer_request_sent`  
**Value:** `Yes`  
**Boolean Value:** `true`

#### RR - Transfer Rejection (ID: 2207)
**State:** code

```python
record.write({"state": 'cancel', "x_studio_transfer_rejected": 'Yes'})
```

#### RR - Transfer Request Approval - Notify User (ID: 2203)
**State:** next_activity

```python
# Available variables:
#  - env: Odoo Environment on which the action is triggered
#  - model: Odoo Model of the record on which the action is triggered; is a void recordset
#  - record: record on which the action is triggered; may be void
#  - records: recordset of all records on which the action is triggered in multi-mode; may be void
#  - time, datetime, dateutil, timezone: useful Python libraries
#  - float_compare: Odoo function to compare floats based on specific precisions
#  - log: log(message, level='info'): logging function to record debug information in ir.logging table
#  - UserError: Warning Exception to use with raise
#  - Command: x2Many commands namespace
# To return an action, assign: action = {...}




```

#### RR - Update Operation Type in Help Desk Repairs (ID: 1996)
**State:** code

```python
if record.x_studio_repair_return_location == True:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  if company.id == 1:
    opt_type = env['stock.picking.type'].search([('default_location_dest_id', '=', record.x_studio_return_receipt_location.id),('code', '=', 'incoming'),('name', '=', 'Returns')],limit=1)
  else:
    opt_type = env['stock.picking.type'].search([('default_location_dest_id', '=', record.x_studio_return_receipt_location.id),('code', '=', 'incoming'),('name', '=', 'Receipts')],limit=1)
  
  if opt_type:
    record['picking_type_id'] = opt_type.id
    
  
    seq = env['ir.sequence'].next_by_code('purchase.request.seq')
    record['name'] = seq
 
```

### 4.2 stock.return.picking — Server Actions (2)

#### RR - Auto Select Product for RUG Repairs-3 (ID: 1991)
**State:** code

```python
if record.ticket_id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  if (record.x_studio_repair_rug == True or record.x_studio_repair_normal_with_serial_no == True):
    if company.id == 1:
      ticket = env['helpdesk.ticket'].search([('id', '=', record.ticket_id.id),('company_id', '=', company.id)],limit=1)
      if ticket:
        if record.location_id.id != record.x_studio_suggested_location_id.id:
          raise UserError("Return Location should be equal to Suggested Return Location.")
    else:
      ticket = env['helpdesk.ticket'].search([('id', '=', record.ticket_id.id),('company_id', '=', company.id)],limit=1)
      if ticket:
        if record.location_id.id != record.x_studio_suggested_location_id_1.id:
          raise UserError('Return Location should be equal to Suggested Return Location.')
      
  
      




```

#### RR - RUG Return from Help desk (ID: 1997)
**State:** code

```python
if record.id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)

  if company.id == 1:
    if record.ticket_id.x_studio_virtual_location == False or record.ticket_id.x_studio_source_location == False:
      raise UserError('Virtual & Source Locations must be setup for Current Logged in User.')
    
    if record.location_id.id != record.x_studio_suggested_location_id.id:
      raise UserError('Return Location should be equal to Suggested Return Location.')
  else:
    if record.ticket_id.x_studio_virtual_location_1 == False or record.ticket_id.x_studio_source_location_1 == False:
      raise UserError('Virtual & Source Locations must be setup for Current Logged in User.')
    
    if record.location_id.id != record.x_studio_suggested_location_id_1.id:
      raise UserError('Return Location should be equal to Suggested Return Location.')
  
  for qtys in record.product_return_moves:
    if qtys.quantity != 1:
      raise UserError('Quantity should be 1 for all the return lines.' )
    
  source_loc = env['stock.location'].search([('usage', '=', 'customer')],limit=1)
  if source_loc:
    if company.id == 1:
      opt_type = env['stock.picking.type'].search([('default_location_dest_id', '=', record.ticket_id.x_studio_return_receipt_location.id),('code', '=', 'incoming'),('name', '=', 'Returns'),('company_id', '=', company.id)],limit=1)
    else:
      opt_type = env['stock.picking.type'].search([('default_location_dest_id', '=', record.ticket_id.x_studio_return_receipt_location.id),('code', '=', 'incoming'),('name', '=', 'Receipts'),('company_id', '=', company.id)],limit=1)
    
    if opt_type:
     #prod_move = env['stock.picking'].create({'x_studio_created_from_help_ticket':record.ticket_id.id,'picking_type_id':opt_type.id,'location_id':source_loc.id,'location_dest_id':record.location_id.id,'origin':('Return of '+ record.picking_id.name),'partner_id':record.partner_id.id})
     prod_move = env['stock.picking'].create({'x_studio_helpdesk_ticket_id':record.ticket_id.id,'picking_type_id':opt_type.id,'location_id':source_loc.id,'location_dest_id':record.location_id.id,'origin':('Return of '+ record.picking_id.name),'partner_id':record.partner_id.id,'company_id':company.id})
     
     
     update_prod_move = env['stock.picking'].search([('id', '=', prod_move.id),('company_id', '=', company.id)],limit=1)
     if update_prod_move:
      pro_group = env['procurement.group'].search([('sale_id', '=', record.sale_order_id.id)],limit=1)
      stock_move = env['stock.move'].create({'picking_id':update_prod_move.id,'name':('New Move:'+record.ticket_id.product_id.name),'reference':update_prod_move.name,'picking_type_id':update_prod_move.picking_type_id.id,'product_id':record.ticket_id.product_id.id,'location_id':update_prod_move.location_id.id,'location_dest_id':update_prod_move.location_dest_id.id,'product_uom_qty':1.00,'product_uom':record.ticket_id.product_id.uom_id.id,'state':'assigned','group_id':pro_group.id,'company_id':company.id}) 
      stock_move_line = env['stock.move.line'].create({'move_id':stock_move.id,'picking_id':update_prod_move.id,'picking_type_id':update_prod_move.picking_type_id.id,'product_id':record.ticket_id.product_id.id,'product_uom_id':record.ticket_id.product_id.uom_id.id,'location_id':update_prod_move.location_id.id,'location_dest_id':update_prod_move.location_dest_id.id,'lot_id':record.ticket_id.x_studio_serial_no.id,'qty_done':1.00,'company_id':company.id}) 
      
      update_ticket = env['helpdesk.ticket'].search([('id', '=', record.ticket_id.id),('company_id', '=', company.id)],limit=1)
      if update_ticket:
        update_ticket.write({'picking_ids':[(4, update_prod_move.id)]})
        
      action = {
              'name': 'Return',
              'domain': [('id', '=', update_prod_move.id)],
              'type': 'ir.actions.act_window',
              'res_model': 'stock.picking',
              'view_mode': 'tree,form',
              'view_type': 'form',
              'view_id': False,
              'context': False,
              }
      
    else:
      raise UserError('The selected return receipt location is not correct.')
     






```

### 4.3 sale.order — Repair-Related Server Actions (18)

#### RR - Auto Generate Quotation Type for Projct SOs (ID: 2113)
**State:** code

```python
#if record.task_id == True:
record['x_studio_quotation_type'] = 'Project'

    




```

#### RR - Auto Generate Quotation Type for Project SOs (ID: 2114)
**State:** code

```python
if record.task_id != False:
  if record.x_studio_project_no.x_studio_repair_project == True:
    record['x_studio_quotation_type'] = 'Repair'
  else:
    record['x_studio_quotation_type'] = record.x_studio_project_no.x_studio_quotation_type
  
  record['x_studio_project_group'] = record.x_studio_project_no.x_studio_project_group
  record['analytic_account_id'] = record.x_studio_project_no.sale_order_id.analytic_account_id.id
  
  project_task = env['project.task'].search([('id', '=', record.task_id.id)],limit=1)  
  if project_task:
    record['x_studio_project_start_date'] = project_task.sale_order_id.x_studio_project_start_date
    record['x_studio_project_end_date'] = project_task.sale_order_id.x_studio_project_end_date
    
    if project_task.sale_order_id.warehouse_id == True:
      record['warehouse_id'] = project_task.sale_order_id.warehouse_id.id
    




```

#### RR - Auto Generate Quotation Type for Project SOs - 2 (ID: 2117)
**State:** code

```python
if record.task_id != False:
  record['x_studio_quotation_type'] = record.x_studio_project_no.x_studio_quotation_type
  record['x_studio_project_group'] = record.x_studio_project_no.x_studio_project_group
  record['analytic_account_id'] = record.x_studio_project_no.sale_order_id.analytic_account_id.id
  
  project_task = env['project.task'].search([('id', '=', record.task_id.id)],limit=1)  
  if project_task:
    record['x_studio_project_start_date'] = project_task.sale_order_id.x_studio_project_start_date
    record['x_studio_project_end_date'] = project_task.sale_order_id.x_studio_project_end_date
    record['warehouse_id'] = project_task.sale_order_id.warehouse_id.id







```

#### RR - Auto Generate Quotation Type for Repair SOs (ID: 1995)
**State:** code

```python
if record.id:
  if record.x_studio_project_no.x_studio_repair_project == True:
    record['x_studio_quotation_type'] = 'Repair'
    record['x_studio_order_payment_method'] = record.partner_id.x_studio_payment_method




```

#### RR - Insufficient Transfer Inventory Details (ID: 2096)
**State:** code

```python
desc = ''
onhand_qty = 0
onhand_qty2 = 0
resupply_count = 0

so_loc = env['stock.warehouse'].search([('id', '=', record.warehouse_id.id)],limit=1)
if so_loc:
  for sup_lines in so_loc.resupply_wh_ids:
    resupply_count += 1
    for line in record.order_line:
      same_item = env['sale.order.line'].search([('order_id', '=', record.id),('product_template_id', '=', line.product_template_id.id)])
      if same_item:
        onhand_qty = 0
        for sameitems in same_item:
          onhand_qty += sameitems.product_uom_qty
      else:
       onhand_qty = line.product_uom_qty 
      for routes in line.product_template_id.route_ids:
        if routes.supplier_wh_id:
          if routes.supplier_wh_id.id == sup_lines.id:
            if routes.supplied_wh_id.id == record.warehouse_id.id:
              onhand = env['stock.quant'].search([('product_tmpl_id', '=', line.product_template_id.id),('location_id', '=', routes.supplier_wh_id.lot_stock_id.id),('quantity', '>=', onhand_qty)], limit=1)
              if not onhand:
                onhand2 = env['stock.quant'].search([('product_tmpl_id', '=', line.product_template_id.id),('location_id', '=', routes.supplier_wh_id.lot_stock_id.id)], limit=1)
                if onhand2:
                  onhand_qty2 = onhand2.quantity
                else: 
                  onhand_qty2 = 0
                desc +=  "Item No: " + str(line.product_template_id.default_code) + "     " + "Location: " + str(routes.supplier_wh_id.lot_stock_id.display_name) + "     " + "Order Qty (Line): " + str(line.product_uom_qty) + "     "  + "     " + "Order Qty (Total): " + str(onhand_qty) + "     "  + "Onhand Qty: " + str(onhand_qty2) + "     " + "Inventory Shortage: " + str(onhand_qty - onhand_qty2) + "\n"

if resupply_count == 0:
  for line in record.order_line:
    same_item = env['sale.order.line'].search([('order_id', '=', record.id),('product_template_id', '=', line.product_template_id.id)])
    if same_item:
      onhand_qty = 0
      for sameitems in same_item:
        onhand_qty += sameitems.product_uom_qty
    else:
     onhand_qty = line.product_uom_qty 
    
    onhand = env['stock.quant'].search([('product_tmpl_id', '=', line.product_template_id.id),('location_id', '=', record.warehouse_id.lot_stock_id.id),('quantity', '>=', onhand_qty)], limit=1)
    if not onhand:
      onhand2 = env['stock.quant'].search([('product_tmpl_id', '=', line.product_template_id.id),('location_id', '=', record.warehouse_id.lot_stock_id.id)], limit=1)
      if onhand2:
        onhand_qty2 = onhand2.quantity
      else: 
        onhand_qty2 = 0
      desc +=  "Item No: " + str(line.product_template_id.default_code) + "     " + "Location: " + str(record.warehouse_id.lot_stock_id.display_name) + "     " + "Order Qty (Line): " + str(line.product_uom_qty) + "     "  + "     " + "Order Qty (Total): " + str(onhand_qty) + "     "  + "Onhand Qty: " + str(onhand_qty2) + "     " + "Inventory Shortage: " + str(onhand_qty - onhand_qty2) + "\n"
    
raise UserError(desc)  


 


```

#### RR - RUG Approval (ID: 1981)
**State:** object_write

**Type:** Write Field  
**Field:** `x_studio_rug_approved`  
**Value:** `Yes`  
**Boolean Value:** `true`

#### RR - RUG Approval Request Sent (ID: 1983)
**State:** object_write

**Type:** Write Field  
**Field:** `x_studio_rug_request_sent`  
**Value:** `Yes`  
**Boolean Value:** `true`

#### RR - RUG Rejection (ID: 2004)
**State:** code

```python
if record.id:
  record.write({'x_studio_rug_rejected': True})
  
  for lines in record.order_line:
    original_price = lines.x_studio_price_unit_original
    lines.write({'price_unit':original_price})




```

#### RR - RUG Request Approval - Notify User (ID: 1985)
**State:** next_activity

**Type:** Schedule Activity (notifies user for approval)

#### RR - Re-estimate Request  Sent (ID: 2244)
**State:** object_write

**Type:** Write Field  
**Field:** `x_studio_re_estimate_request_sent`  
**Value:** `Yes`  
**Boolean Value:** `true`

#### RR - Re-estimate Request  Sent - Validate (ID: 2246)
**State:** code

```python
if record.id:
  record['x_studio_re_estimate_request_count_1'] += 1
```

#### RR - Re-estimate Request - Notify User (ID: 2243)
**State:** next_activity

**Type:** Schedule Activity (notifies user for approval)

#### RR - Request RUG Approval (ID: 1980)
**State:** multi

**Type:** Multi-Action (runs child actions: [1983, 1985])

#### RR - Request Re-estimate Permission (ID: 2248)
**State:** multi

**Type:** Multi-Action (runs child actions: [2244, 2246, 2243])

#### RR - Track Lock Status (ID: 2250)
**State:** code

```python
if record.x_studio_quotation_type == 'Repair':
  count = 0
  if record.state == 'done':
    record['x_studio_locked'] = True
    record['x_studio_unlocked'] = False
    
    re_line = env['sale.order.line'].search([('order_id', '=', record.id),('x_studio_re_estimated', '=', True)],limit=1,order='id desc')
    if re_line:
      count = re_line.x_studio_count_1
    
    record['x_studio_re_estimate_count'] = count
  


```

#### RR - Track Lock Status - 2 (ID: 2251)
**State:** code

```python
if record.x_studio_quotation_type == 'Repair':
 if record.state == 'sale' and record.x_studio_locked == True:
    record['x_studio_unlocked'] = True
    record['x_studio_locked'] = False
    #record['x_studio_re_estimate_count'] = 1
  
  
 


```

#### RR - Track Lock Status - 4 (ID: 2253)
**State:** code

```python
if record.x_studio_quotation_type == 'Repair':
 if record.state == 'done' and record.x_studio_locked == True and record.x_studio_unlocked == True:
    record['x_studio_re_estimate_count'] += 1
  
  
 


```

#### Sale Subscription: generate recurring invoices and payments (ID: 590)
**State:** code

```python
model._cron_recurring_create_invoice()
```

### 4.4 repair.order — All Server Actions (4)

#### RR - Add Draft Quotation Confirm Button (ID: 1814)
**State:** code

```python
if record.id:
  record['x_studio_confirm_draft_quotation'] = True
  
```

#### RR - Notify Customer in RO End - Final (ID: 1817)
**State:** next_activity

**Type:** Schedule Activity (notify customer on repair completion)

#### RR - Notify Customer in RO End - Final - 2 (ID: 1820)
**State:** code

```python

mail_pool = env['mail.mail']

values={}

values.update({'subject': 'Repair Complete Confirmation'})

values.update({'email_to': 'janitharc@gmail.com'})

values.update({'body_html': 'Repair Complete Confirmation' })

values.update({'body': 'Repair Complete Confirmation' })

msg_id = mail_pool.create(values)

# And then call send function of the mail.mail,

if msg_id:
  mail_pool.send([msg_id])




```

#### RR - Update SO in RO (ID: 1979)
**State:** code

```python
if record.ticket_id.id:
  record['sale_order_id'] = record.ticket_id.sale_order_id.id
```

### 4.5 helpdesk.ticket — All Repair-Related Server Actions (21)

#### RR - Auto Create Repair Route (ID: 1993)
**State:** code

```python
if record.id:
  virtual_loc = 0
  source_loc = 0
  
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  if company.id == 1:
    if record.x_studio_virtual_location == False: 
      raise UserError('Virtual Location must be setup for Current Logged in User.')
      
    if record.x_studio_source_location == False:
      raise UserError('Source Location must be setup for Current Logged in User.')
      
    virtual_loc = record.x_studio_virtual_location.id
    source_loc = record.x_studio_source_location.id
  else:
    if record.x_studio_virtual_location_1 == False: 
      raise UserError('Virtual Location must be setup for Current Logged in User.')
      
    if record.x_studio_source_location_1 == False:
      raise UserError('Source Location must be setup for Current Logged in User.')
      
    virtual_loc = record.x_studio_virtual_location_1.id
    source_loc = record.x_studio_source_location_1.id
    
  record['x_studio_repair_serial_created'] = True
  dest_loc = env['stock.location'].search([('usage', '=', 'customer')],limit=1)
  if dest_loc:
    prod_lines=[]
    prod_lines.append([0,0,{
      'product_id':record.product_id.id,
      'product_uom_id':record.product_id.uom_id.id,
      'location_id':virtual_loc,
      'location_dest_id':dest_loc.id, 
      'qty_done':1.00}])
      
    opt_type = env['stock.picking.type'].search([('default_location_src_id', '=', record.x_studio_return_receipt_location.id),('code', '=', 'outgoing'),('company_id', '=', company.id)],limit=1)
    if opt_type:
     prod_move = env['stock.picking'].create({'x_studio_created_from_help_ticket':record.id,'x_studio_helpdesk_ticket_id':record.id,'picking_type_id':opt_type.id,'location_id':source_loc,'location_dest_id':dest_loc.id,'company_id':company.id})
     
     update_prod_move = env['stock.picking'].search([('id', '=', prod_move.id),('company_id', '=', company.id)],limit=1)
     if update_prod_move:
      stock_move = env['stock.move'].create({'picking_id':update_prod_move.id,'name':('New Move:'+record.product_id.name),'reference':update_prod_move.name,'picking_type_id':update_prod_move.picking_type_id.id,'product_id':record.product_id.id,'location_id':update_prod_move.location_id.id,'location_dest_id':update_prod_move.location_dest_id.id,'product_uom_qty':1.00,'product_uom':record.product_id.uom_id.id,'state':'done','company_id':company.id}) 
      stock_move_line = env['stock.move.line'].create({'move_id':stock_move.id,'picking_id':update_prod_move.id,'picking_type_id':update_prod_move.picking_type_id.id,'product_id':record.product_id.id,'product_uom_id':record.product_id.uom_id.id,'location_id':update_prod_move.location_id.id,'location_dest_id':update_prod_move.location_dest_id.id,'qty_done':1.00,'company_id':company.id}) 
       
      update_prod_move.write({'state':'done'})
      
     record['x_studio_picking_id'] = prod_move.id
     record['x_studio_pick_id'] = prod_move.id
    else:
      raise UserError('The selected return receipt location is not correct.')
     






```

#### RR - Auto Create Repair Serial Nos (ID: 1994)
**State:** code

```python
if record.id:
  virtual_loc = 0
  source_loc = 0
  
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  if company.id == 1:
    if record.x_studio_virtual_location == False: 
      raise UserError('Virtual Location must be setup for Current Logged in User.')
      
    if record.x_studio_source_location == False:
      raise UserError('Source Location must be setup for Current Logged in User.')
      
    virtual_loc = record.x_studio_virtual_location.id
    source_loc = record.x_studio_source_location.id
  else:
    if record.x_studio_virtual_location_1 == False: 
      raise UserError('Virtual Location must be setup for Current Logged in User.')
      
    if record.x_studio_source_location_1 == False:
      raise UserError('Source Location must be setup for Current Logged in User.')
      
    virtual_loc = record.x_studio_virtual_location_1.id
    source_loc = record.x_studio_source_location_1.id
    
  #seq = env['ir.sequence'].next_by_code('repair.serial.seq')
  seq = env['ir.sequence'].with_context(company_id=company.id).next_by_code('repair.serial.seq')
    
  rep_serial = env['stock.lot'].create({'name':seq,'product_id':record.product_id.id,'company_id':company.id})
  record['x_studio_serial_no'] = rep_serial.id
  record['lot_id'] = rep_serial.id
  record['x_studio_repair_serial_created'] = True 
  
  dest_loc = env['stock.location'].search([('usage', '=', 'customer')],limit=1)
  if dest_loc:
    
    opt_type = env['stock.picking.type'].search([('default_location_src_id', '=', record.x_studio_return_receipt_location.id),('code', '=', 'outgoing'),('company_id', '=', company.id)],limit=1)
    if opt_type:
     prod_move = env['stock.picking'].create({'x_studio_created_from_help_ticket':record.id,'x_studio_helpdesk_ticket_id':record.id,'picking_type_id':opt_type.id,'location_id':source_loc,'location_dest_id':dest_loc.id,'company_id':company.id})
     
     update_prod_move = env['stock.picking'].search([('id', '=', prod_move.id),('company_id', '=', company.id)],limit=1)
     if update_prod_move:
      stock_move = env['stock.move'].create({'picking_id':update_prod_move.id,'name':('New Move:'+record.product_id.name),'reference':update_prod_move.name,'picking_type_id':update_prod_move.picking_type_id.id,'product_id':record.product_id.id,'location_id':update_prod_move.location_id.id,'location_dest_id':update_prod_move.location_dest_id.id,'product_uom_qty':1.00,'product_uom':record.product_id.uom_id.id,'state':'done','company_id':company.id}) 
      stock_move_line = env['stock.move.line'].create({'move_id':stock_move.id,'picking_id':update_prod_move.id,'picking_type_id':update_prod_move.picking_type_id.id,'product_id':record.product_id.id,'product_uom_id':record.product_id.uom_id.id,'location_id':update_prod_move.location_id.id,'location_dest_id':update_prod_move.location_dest_id.id,'lot_id':record.x_studio_serial_no.id,'qty_done':1.00,'company_id':company.id}) 
      
      update_prod_move.write({'state':'done'})
      
     record['x_studio_picking_id'] = prod_move.id
     record['x_studio_pick_id'] = prod_move.id
    else:
      raise UserError('The selected return receipt location is not correct.')
     






```

#### RR - Auto Populate Repair Location (ID: 2000)
**State:** code

```python
if record.x_studio_return_receipt_location != False:
  record['x_studio_repair_location'] = record.x_studio_return_receipt_location
else:
  record['x_studio_repair_location'] = ''
    



```

#### RR - Auto Select Product for RUG Repairs (ID: 1989)
**State:** code

```python
if record.x_studio_serial_no:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  cust_location = env['stock.location'].search([('usage', '=', 'customer')], limit=1)
  trans_line = env['stock.move.line'].search([('product_id', '=', record.x_studio_serial_no.product_id.id),('lot_id', '=', record.x_studio_serial_no.id),('picking_code', '=', 'outgoing'),('location_dest_id', '=', cust_location.id),('company_id', '=', company.id)], limit=1)
  if trans_line:
   so = env['sale.order'].search([('name', '=', trans_line.origin),('company_id', '=', company.id)], limit=1) 
   if so:
    record['sale_order_id'] = so.id
    #record['picking_ids'] = [(4, trans_line.picking_id.id)]
    record['x_studio_picking_id'] = trans_line.picking_id.id
    record['x_studio_pick_id'] = trans_line.picking_id.id
    
  record['product_id'] = record.x_studio_serial_no.product_id.id
  record['lot_id'] = record.x_studio_serial_no.id
  
  if record.x_studio_normal_repair_without_serial_no == True:
    #record['x_studio_serial_no'] = False
    record['sale_order_id'] = False
    #record['x_studio_picking_id'] = False
    #record['x_studio_pick_id'] = False
    #record['lot_id'] = False
else:
  if record.x_studio_normal_repair_without_serial_no == True:
    record['sale_order_id'] = False
    record['x_studio_picking_id'] = False
    record['x_studio_pick_id'] = False
    record['lot_id'] = False
  else:  
    record['sale_order_id'] = False
    record['x_studio_picking_id'] = False
    record['x_studio_pick_id'] = False
    record['product_id'] = False
    record['lot_id'] = False  



```

#### RR - Auto Select Product for RUG Repairs-2 (ID: 1990)
**State:** code

```python
if record.x_studio_serial_no:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  cust_location = env['stock.location'].search([('usage', '=', 'customer')], limit=1)
  trans_line = env['stock.move.line'].search([('product_id', '=', record.x_studio_serial_no.product_id.id),('lot_id', '=', record.x_studio_serial_no.id),('picking_code', '=', 'outgoing'),('location_dest_id', '=', cust_location.id)], limit=1)
  if trans_line:
   so = env['sale.order'].search([('name', '=', trans_line.origin),('company_id', '=', company.id)], limit=1) 
   if so:
    record['sale_order_id'] = so.id
    #record['picking_ids'] = [(4, trans_line.picking_id.id)]
    record['x_studio_picking_id'] = trans_line.picking_id.id
    record['x_studio_pick_id'] = trans_line.picking_id.id
    
  record['product_id'] = record.x_studio_serial_no.product_id.id
  record['lot_id'] = record.x_studio_serial_no.id
  
  if record.x_studio_normal_repair_without_serial_no == True:
    #record['x_studio_serial_no'] = False
    record['sale_order_id'] = False
    #record['x_studio_picking_id'] = False
    #record['x_studio_pick_id'] = False
    #record['lot_id'] = False
else:
  if record.x_studio_normal_repair_without_serial_no == True:
    record['sale_order_id'] = False
    record['x_studio_picking_id'] = False
    record['x_studio_pick_id'] = False
    record['lot_id'] = False
  else:  
    record['sale_order_id'] = False
    record['x_studio_picking_id'] = False
    record['x_studio_pick_id'] = False
    record['product_id'] = False
    record['lot_id'] = False
    




```

#### RR - Auto Select Product for RUG Repairs-33 (ID: 2451)
**State:** code

```python
record['sale_order_id'] = False
record['x_studio_picking_id'] = False
record['x_studio_pick_id'] = False
record['product_id'] = False
record['lot_id'] = False
record['x_studio_sn_updated'] = False
    




```

#### RR - Auto Select Product for RUG Repairs-4 (ID: 1992)
**State:** code

```python
if record.ticket_type_id:
  record['sale_order_id'] = False
  record['x_studio_picking_id'] = False
  record['x_studio_pick_id'] = False
  record['product_id'] = False
  record['lot_id'] = False
  record['x_studio_serial_no'] = False
  



```

#### RR - Cancel Repair (ID: 2220)
**State:** code

```python
if record.id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  if record.x_studio_cancel_reason == False:
    raise UserError('Cancel reason must be specified.')
    
  record['x_studio_cancelled_stage_id'] = record.stage_id.id
  if company.id == 1:
    record['stage_id'] = 4
  else:
    record['stage_id'] = 23
  record['x_studio_cancelled'] = True
  record['x_studio_reopened'] = False
  record['x_studio_cancelled_by'] = uid
  record['x_studio_cancelled_date'] = datetime.datetime.now()
  record['x_studio_cancel_status'] = 'Cancelled'
  
  
    



```

#### RR - Cancel Repair-2 (ID: 2343)
**State:** code

```python
if record.id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  if record.x_studio_cancel_reason == False:
    raise UserError('Cancel reason must be specified.')
  
  record['x_studio_repair_complete_stage_updated'] = True
  if company.id == 1:
    record['stage_id'] = 9
  else:
    record['stage_id'] = 28
  record['x_studio_stage_date'] = datetime.datetime.now()
  record['x_studio_created_by_8'] = uid
  record['x_studio_created_on_8'] = datetime.datetime.now()
  record['x_studio_cancelled_2'] = True
  record['x_studio_cancel_status'] = 'Cancelled'
  
   
      
      
  
  
    



```

#### RR - Change Repair Type to RUG (ID: 2159)
**State:** code

```python
if record.x_studio_warranty_card == False:
  raise UserError("Warranty Card Document must be Uploaded!")

for sos in record.fsm_task_ids:
  so = env['sale.order'].search([('id', '=', sos.sale_order_id.id)],limit=1)
  if so:
    for so_line in so.order_line:
      original_price = so_line.price_unit
      so_line.write({'price_unit': so_line.product_template_id.standard_price,'x_studio_price_unit_original': original_price})
      
record.write({'ticket_type_id': 1}) 

```

#### RR - RR - Auto Select Product for RUG Repairs-22 (ID: 2450)
**State:** code

```python
if record.x_studio_serial_no:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  cust_location = env['stock.location'].search([('usage', '=', 'customer')], limit=1)
  trans_line = env['stock.move.line'].search([('product_id', '=', record.x_studio_serial_no.product_id.id),('lot_id', '=', record.x_studio_serial_no.id),('picking_code', '=', 'outgoing'),('location_dest_id', '=', cust_location.id)], limit=1)
  if trans_line:
   so = env['sale.order'].search([('name', '=', trans_line.origin),('company_id', '=', company.id)], limit=1) 
   if so:
    record['sale_order_id'] = so.id
    #record['picking_ids'] = [(4, trans_line.picking_id.id)]
    record['x_studio_picking_id'] = trans_line.picking_id.id
    record['x_studio_pick_id'] = trans_line.picking_id.id
    
  record['product_id'] = record.x_studio_serial_no.product_id.id
  record['lot_id'] = record.x_studio_serial_no.id
  
  if record.x_studio_normal_repair_without_serial_no == True:
    #record['x_studio_serial_no'] = False
    record['sale_order_id'] = False
    #record['x_studio_picking_id'] = False
    #record['x_studio_pick_id'] = False
    #record['lot_id'] = False
else:
  if record.x_studio_normal_repair_without_serial_no == True:
    record['sale_order_id'] = False
    record['x_studio_picking_id'] = False
    record['x_studio_pick_id'] = False
    record['lot_id'] = False
  else:  
    record['sale_order_id'] = False
    record['x_studio_picking_id'] = False
    record['x_studio_pick_id'] = False
    record['product_id'] = False
    record['lot_id'] = False
    
record['x_studio_sn_updated'] = True
```

#### RR - Receive at Factory (ID: 2002)
**State:** code

```python
if record.id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  record['x_studio_receive_at_factory'] = True
  record['x_studio_f_received_date'] = datetime.datetime.now()
  record['x_studio_f_received_by'] = uid
  if company.id == 1:
    record['stage_id'] = 6
  else:
    record['stage_id'] = 25
  record['x_studio_stage_date'] = datetime.datetime.now()
  record['x_studio_created_by_2'] = uid
  record['x_studio_created_on_2'] = datetime.datetime.now()

    



```

#### RR - Receive at Sales Centre (ID: 2006)
**State:** code

```python
if record.id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  record['x_studio_receive_at_centre'] = True
  record['x_studio_s_received_date'] = datetime.datetime.now()
  record['x_studio_s_received_by'] = uid
  if company.id == 1:
    record['stage_id'] = 8
  else:
    record['stage_id'] = 27
  record['x_studio_stage_date'] = datetime.datetime.now()
  record['x_studio_created_by_10'] = uid
  record['x_studio_created_on_10'] = datetime.datetime.now()

    



```

#### RR - Reopen Repair (ID: 2221)
**State:** code

```python
if record.id:
  record['stage_id'] = record.x_studio_cancelled_stage_id.id
  record['x_studio_cancelled'] = False
  record['x_studio_reopened'] = True
  record['x_studio_cancelled_stage_id'] = False
  record['x_studio_reopened_by'] = uid
  record['x_studio_reopened_date'] = datetime.datetime.now()
  record['x_studio_reopen_status'] = 'Reopened'
  
  
    



```

#### RR - Repair Seq.No (ID: 1976)
**State:** code

```python
#record['x_name'] = env['ir.sequence'].next_by_code('purchase.request.seq')

if record.name == 'New':
 seq = env['ir.sequence'].next_by_code('repair.seq')
 record.write({'name': seq})



```

#### RR - Send to Factory (ID: 2001)
**State:** code

```python
if record.id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  factory_location = env['stock.location'].search([('x_studio_repair_factory_location', '=', True)],limit=1)
  if factory_location:
    record['x_studio_repair_location'] = factory_location.id
    record['x_studio_send_to_factory'] = True
    record['x_studio_s_shipped_date'] = datetime.datetime.now()
    record['x_studio_s_shipped_by'] = uid
    if company.id == 1:
      record['stage_id'] = 5
    else:
      record['stage_id'] = 24
    record['x_studio_stage_date'] = datetime.datetime.now()
    record['x_studio_created_by_1'] = uid
    record['x_studio_created_on_1'] = datetime.datetime.now()
  else:
    raise UserError("Setup Repair Factory Location in stock locations to proceed.")

    



```

#### RR - Send to Sales Centre (ID: 2007)
**State:** code

```python
if record.id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  record['x_studio_send_to_centre'] = True
  record['x_studio_f_shipped_date'] = datetime.datetime.now()
  record['x_studio_f_shipped_by'] = uid
  if company.id == 1:
    record['stage_id'] = 7
  else:
    record['stage_id'] = 26
  record['x_studio_stage_date'] = datetime.datetime.now()
  record['x_studio_created_by_9'] = uid
  record['x_studio_created_on_9'] = datetime.datetime.now()
  

    



```

#### RR - Update RUG Approval in Pipeline (ID: 1998)
**State:** object_write

**Type:** Write Field  
**Field:** `-`  
**Value:** `-`

#### RR - Validate Cancelled Tickets (ID: 2222)
**State:** code

```python
if record.x_studio_cancelled == True:
  raise UserError('Cancelled tickets can not be deleted.')
    
 


```

#### Send Repair Customer Letter (ID: 2269)
**State:** code

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 56)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  #template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [1]})
  #template.with_context(variable1=record.partner_id.name, variable2=record.product_id.name).send_mail(record.id, force_send=True, email_values={'recipient_ids': [1]})
  #variables = {'variable1': record.partner_id.name, 'variable2': record.product_id.name}
  #template.send_mail(record.id, force_send=True, email_values=variables, recipient_ids=[1])
      
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
  
  
  










```

#### User Location Validation - Helpdesk (ID: 2558)
**State:** code

```python
if user.id != 1:
  if record.x_studio_user_location_validation == True:
    warehouse = str(record.x_studio_return_receipt_location.complete_name)
      
    loc = env['stock.location'].search([('x_studio_users_stock_location', 'ilike', user.id),('active', '=', True)])
    if loc:
      locations = ""
      for locs in loc:
        locations += str(locs.complete_name + "\n")
            
      raise UserError('The current logged-in user does not have access to below listed warehouse.' + "\n" + "\n" +'Repair Location:' + "\n" + warehouse + "\n" + "\n" + 'Only the below listed stock warehouses are permitted for the current logged-in user for repair module.' + "\n" + "\n" + locations)
    else:
      raise UserError('The current logged-in user does not have access to below listed warehouse.' + "\n" + "\n" +'Repair Location:' + "\n" + warehouse + "\n" + "\n" + 'There are no permitted stock warehouses set up for the current logged-in user for repair module.')

```

---
## 5. Automated Actions on Related Models

### sale.order repair-related automations (5)

#### RR - Auto Generate Quotation Type for Repair SOs (ID: 176)
**Model:** sale.order | **Trigger:** `on_create_or_write` | **Active:** Yes
**Filter Domain:** `-`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Auto Generate Quotation Type for Repair SOs (ID: 1995) — State: code

```python
if record.id:
  if record.x_studio_project_no.x_studio_repair_project == True:
    record['x_studio_quotation_type'] = 'Repair'
    record['x_studio_order_payment_method'] = record.partner_id.x_studio_payment_method




```

#### RR - Auto Generate Quotation Type for Project SOs (ID: 186)
**Model:** sale.order | **Trigger:** `on_create_or_write` | **Active:** Yes
**Filter Domain:** `[["task_id","!=",False]]`
**Pre-Filter Domain:** `[["task_id","!=",False]]`

**Linked Server Action:** RR - Auto Generate Quotation Type for Project SOs (ID: 2114) — State: code

```python
if record.task_id != False:
  if record.x_studio_project_no.x_studio_repair_project == True:
    record['x_studio_quotation_type'] = 'Repair'
  else:
    record['x_studio_quotation_type'] = record.x_studio_project_no.x_studio_quotation_type
  
  record['x_studio_project_group'] = record.x_studio_project_no.x_studio_project_group
  record['analytic_account_id'] = record.x_studio_project_no.sale_order_id.analytic_account_id.id
  
  project_task = env['project.task'].search([('id', '=', record.task_id.id)],limit=1)  
  if project_task:
    record['x_studio_project_start_date'] = project_task.sale_order_id.x_studio_project_start_date
    record['x_studio_project_end_date'] = project_task.sale_order_id.x_studio_project_end_date
    
    if project_task.sale_order_id.warehouse_id == True:
      record['warehouse_id'] = project_task.sale_order_id.warehouse_id.id
    




```

#### RR - Auto Generate Quotation Type for Project SOs - 2 (ID: 187)
**Model:** sale.order | **Trigger:** `on_change` | **Active:** Yes
**Filter Domain:** `[["task_id","!=",False]]`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Auto Generate Quotation Type for Project SOs - 2 (ID: 2117) — State: code

```python
if record.task_id != False:
  record['x_studio_quotation_type'] = record.x_studio_project_no.x_studio_quotation_type
  record['x_studio_project_group'] = record.x_studio_project_no.x_studio_project_group
  record['analytic_account_id'] = record.x_studio_project_no.sale_order_id.analytic_account_id.id
  
  project_task = env['project.task'].search([('id', '=', record.task_id.id)],limit=1)  
  if project_task:
    record['x_studio_project_start_date'] = project_task.sale_order_id.x_studio_project_start_date
    record['x_studio_project_end_date'] = project_task.sale_order_id.x_studio_project_end_date
    record['warehouse_id'] = project_task.sale_order_id.warehouse_id.id







```

#### RR - Track Lock Status (ID: 202)
**Model:** sale.order | **Trigger:** `on_create_or_write` | **Active:** Yes
**Filter Domain:** `-`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Track Lock Status (ID: 2250) — State: code

```python
if record.x_studio_quotation_type == 'Repair':
  count = 0
  if record.state == 'done':
    record['x_studio_locked'] = True
    record['x_studio_unlocked'] = False
    
    re_line = env['sale.order.line'].search([('order_id', '=', record.id),('x_studio_re_estimated', '=', True)],limit=1,order='id desc')
    if re_line:
      count = re_line.x_studio_count_1
    
    record['x_studio_re_estimate_count'] = count
  


```

#### RR - Track Lock Status - 2 (ID: 203)
**Model:** sale.order | **Trigger:** `on_create_or_write` | **Active:** Yes
**Filter Domain:** `-`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Track Lock Status - 2 (ID: 2251) — State: code

```python
if record.x_studio_quotation_type == 'Repair':
 if record.state == 'sale' and record.x_studio_locked == True:
    record['x_studio_unlocked'] = True
    record['x_studio_locked'] = False
    #record['x_studio_re_estimate_count'] = 1
  
  
 


```

### stock.return.picking (1)

#### RR - Auto Select Product for RUG Repairs-3 (ID: 174)
**Model:** stock.return.picking | **Trigger:** `on_create_or_write` | **Active:** Yes
**Filter Domain:** `-`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Auto Select Product for RUG Repairs-3 (ID: 1991) — State: code

```python
if record.ticket_id:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  if (record.x_studio_repair_rug == True or record.x_studio_repair_normal_with_serial_no == True):
    if company.id == 1:
      ticket = env['helpdesk.ticket'].search([('id', '=', record.ticket_id.id),('company_id', '=', company.id)],limit=1)
      if ticket:
        if record.location_id.id != record.x_studio_suggested_location_id.id:
          raise UserError("Return Location should be equal to Suggested Return Location.")
    else:
      ticket = env['helpdesk.ticket'].search([('id', '=', record.ticket_id.id),('company_id', '=', company.id)],limit=1)
      if ticket:
        if record.location_id.id != record.x_studio_suggested_location_id_1.id:
          raise UserError('Return Location should be equal to Suggested Return Location.')
      
  
      




```

### repair.order (1)

#### RR - Notify Customer in RO End - Final (ID: 149)
**Model:** repair.order | **Trigger:** `on_create_or_write` | **Active:** Yes
**Filter Domain:** `-`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Notify Customer in RO End - Final (ID: 1817) — State: next_activity

### helpdesk.ticket (5)

#### JIN-Helpdesk(Repair) Seq.No (ID: 171)
**Model:** helpdesk.ticket | **Trigger:** `on_create_or_write` | **Active:** Yes
**Filter Domain:** `-`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Repair Seq.No (ID: 1976) — State: code

```python
#record['x_name'] = env['ir.sequence'].next_by_code('purchase.request.seq')

if record.name == 'New':
 seq = env['ir.sequence'].next_by_code('repair.seq')
 record.write({'name': seq})



```

#### RR - Auto Select Product for RUG Repairs (ID: 172)
**Model:** helpdesk.ticket | **Trigger:** `on_change` | **Active:** Yes
**Filter Domain:** `-`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Auto Select Product for RUG Repairs (ID: 1989) — State: code

```python
if record.x_studio_serial_no:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  cust_location = env['stock.location'].search([('usage', '=', 'customer')], limit=1)
  trans_line = env['stock.move.line'].search([('product_id', '=', record.x_studio_serial_no.product_id.id),('lot_id', '=', record.x_studio_serial_no.id),('picking_code', '=', 'outgoing'),('location_dest_id', '=', cust_location.id),('company_id', '=', company.id)], limit=1)
  if trans_line:
   so = env['sale.order'].search([('name', '=', trans_line.origin),('company_id', '=', company.id)], limit=1) 
   if so:
    record['sale_order_id'] = so.id
    #record['picking_ids'] = [(4, trans_line.picking_id.id)]
    record['x_studio_picking_id'] = trans_line.picking_id.id
    record['x_studio_pick_id'] = trans_line.picking_id.id
    
  record['product_id'] = record.x_studio_serial_no.product_id.id
  record['lot_id'] = record.x_studio_serial_no.id
  
  if record.x_studio_normal_repair_without_serial_no == True:
    #record['x_studio_serial_no'] = False
    record['sale_order_id'] = False
    #record['x_studio_picking_id'] = False
    #record['x_studio_pick_id'] = False
    #record['lot_id'] = False
else:
  if record.x_studio_normal_repair_without_serial_no == True:
    record['sale_order_id'] = False
    record['x_studio_picking_id'] = False
    record['x_studio_pick_id'] = False
    record['lot_id'] = False
  else:  
    record['sale_order_id'] = False
    record['x_studio_picking_id'] = False
    record['x_studio_pick_id'] = False
    record['product_id'] = False
    record['lot_id'] = False  



```

#### RR - Auto Populate Repair Location (ID: 178)
**Model:** helpdesk.ticket | **Trigger:** `on_change` | **Active:** Yes
**Filter Domain:** `-`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Auto Populate Repair Location (ID: 2000) — State: code

```python
if record.x_studio_return_receipt_location != False:
  record['x_studio_repair_location'] = record.x_studio_return_receipt_location
else:
  record['x_studio_repair_location'] = ''
    



```

#### RR - Validate Cancelled Tickets (ID: 201)
**Model:** helpdesk.ticket | **Trigger:** `on_unlink` | **Active:** Yes
**Filter Domain:** `[["x_studio_cancelled","=",True]]`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Validate Cancelled Tickets (ID: 2222) — State: code

```python
if record.x_studio_cancelled == True:
  raise UserError('Cancelled tickets can not be deleted.')
    
 


```

#### RR - Auto Select Product for RUG Repairs-33 (ID: 243)
**Model:** helpdesk.ticket | **Trigger:** `on_change` | **Active:** Yes
**Filter Domain:** `[]`
**Pre-Filter Domain:** `-`

**Linked Server Action:** RR - Auto Select Product for RUG Repairs-33 (ID: 2451) — State: code

```python
record['sale_order_id'] = False
record['x_studio_picking_id'] = False
record['x_studio_pick_id'] = False
record['product_id'] = False
record['lot_id'] = False
record['x_studio_sn_updated'] = False
    




```

---

## 6. Smart Button Counter Fields (x_x_ prefix)

| Model | Field Name | Label | Linked Model | Compute Expression | Purpose |
|-------|-----------|-------|-------------|-------------------|---------|
| stock.picking | `x_x_studio_create_from_transfer_1__account_move_count` | Create From Transfer count | account.move | `results = self.env['account.move'].read_group([('x_studio_create_from_transfer_...` | Count journal entries linked to transfer via create_from_transfer_1 |
| helpdesk.ticket | `x_x_studio_created_from_help_ticket_stock_picking_count` | Created from Help Ticket count | stock.picking | `for record in self: record['x_x_studio_created_from_help_ticket_stock_picking_c...` | Count transfers created from a helpdesk ticket |
| purchase.order | `x_x_studio_created_from_purchase_order__x_lc_header_count` | Created From Purchase Order count | x_lc_header | `results = self.env['x_lc_header'].read_group([('x_studio_created_from_purchase_...` | Count LC headers linked to PO |
| sale.order | `x_x_studio_created_from_sales_order_1_crossovered_budget_count` | Project Budget | crossovered.budget | `for record in self: record['x_x_studio_created_from_sales_order_1_crossovered_b...` | Count project budgets from SO |
| sale.order | `x_x_studio_created_from_so_x_purchase_request_count` | Created From SO count | x_purchase_request | `for record in self: record['x_x_studio_created_from_so_x_purchase_request_count...` | Count purchase requests from SO |
| stock.picking | `x_x_studio_created_from_transfer__account_move_count` | Created From Transfer count | account.move | `results = self.env['account.move'].read_group([('x_studio_created_from_transfer...` | Count journal entries linked from transfer |
| purchase.order | `x_x_studio_purchase_order_account_payment_count` | Purchase Order count | account.payment | `for record in self: record['x_x_studio_purchase_order_account_payment_count'] =...` | Count payments linked to PO |
| purchase.order | `x_x_studio_rfq_id__x_import_rfq_charge_he_count` | RFQ Id count | x_import_rfq_charge_he | `results = self.env['x_import_rfq_charge_he'].read_group([('x_studio_rfq_id', 'i...` | Count import RFQ header charges |
| purchase.order | `x_x_studio_rfq_id__x_import_rfq_charge_li_count` | RFQ Id count | x_import_rfq_charge_li | `results = self.env['x_import_rfq_charge_li'].read_group([('x_studio_rfq_id', 'i...` | Count import RFQ line charges |
| sale.order | `x_x_studio_sales_order_account_payment_count` | Sales Order count | account.payment | `for record in self: record['x_x_studio_sales_order_account_payment_count'] = se...` | Count payments directly linked to SO (smart button) |
| sale.order | `x_x_studio_subcontracting_so_purchase_order_count` | Subcontracting SO count | purchase.order | `for record in self: record['x_x_studio_subcontracting_so_purchase_order_count']...` | Count subcontracting POs from SO |

### Full Compute Expressions

**`x_x_studio_create_from_transfer_1__account_move_count`** on `stock.picking`

```python

results = self.env['account.move'].read_group([('x_studio_create_from_transfer_1', 'in', self.ids)], ['x_studio_create_from_transfer_1'], ['x_studio_create_from_transfer_1'])
dic = {}
for x in results: dic[x['x_studio_create_from_transfer_1'][0]] = x['x_studio_create_from_transfer_1_count']
for record in self: record['x_x_studio_create_from_transfer_1__account_move_count'] = dic.get(record.id, 0)

```

**`x_x_studio_created_from_help_ticket_stock_picking_count`** on `helpdesk.ticket`

```python

for record in self: record['x_x_studio_created_from_help_ticket_stock_picking_count'] = self.env['stock.picking'].search_count([('x_studio_created_from_help_ticket', '=', record.id)])

```

**`x_x_studio_created_from_purchase_order__x_lc_header_count`** on `purchase.order`

```python

results = self.env['x_lc_header'].read_group([('x_studio_created_from_purchase_order', 'in', self.ids)], ['x_studio_created_from_purchase_order'], ['x_studio_created_from_purchase_order'])
dic = {}
for x in results: dic[x['x_studio_created_from_purchase_order'][0]] = x['x_studio_created_from_purchase_order_count']
for record in self: record['x_x_studio_created_from_purchase_order__x_lc_header_count'] = dic.get(record.id, 0)

```

**`x_x_studio_created_from_sales_order_1_crossovered_budget_count`** on `sale.order`

```python

for record in self: record['x_x_studio_created_from_sales_order_1_crossovered_budget_count'] = self.env['crossovered.budget'].search_count([('x_studio_created_from_sales_order_1', '=', record.id)])

```

**`x_x_studio_created_from_so_x_purchase_request_count`** on `sale.order`

```python

for record in self: record['x_x_studio_created_from_so_x_purchase_request_count'] = self.env['x_purchase_request'].search_count([('x_studio_created_from_so', '=', record.id)])

```

**`x_x_studio_created_from_transfer__account_move_count`** on `stock.picking`

```python

results = self.env['account.move'].read_group([('x_studio_created_from_transfer', 'in', self.ids)], ['x_studio_created_from_transfer'], ['x_studio_created_from_transfer'])
dic = {}
for x in results: dic[x['x_studio_created_from_transfer'][0]] = x['x_studio_created_from_transfer_count']
for record in self: record['x_x_studio_created_from_transfer__account_move_count'] = dic.get(record.id, 0)

```

**`x_x_studio_purchase_order_account_payment_count`** on `purchase.order`

```python

for record in self: record['x_x_studio_purchase_order_account_payment_count'] = self.env['account.payment'].search_count([('x_studio_purchase_order', '=', record.id)])

```

**`x_x_studio_rfq_id__x_import_rfq_charge_he_count`** on `purchase.order`

```python

results = self.env['x_import_rfq_charge_he'].read_group([('x_studio_rfq_id', 'in', self.ids)], ['x_studio_rfq_id'], ['x_studio_rfq_id'])
dic = {}
for x in results: dic[x['x_studio_rfq_id'][0]] = x['x_studio_rfq_id_count']
for record in self: record['x_x_studio_rfq_id__x_import_rfq_charge_he_count'] = dic.get(record.id, 0)

```

**`x_x_studio_rfq_id__x_import_rfq_charge_li_count`** on `purchase.order`

```python

results = self.env['x_import_rfq_charge_li'].read_group([('x_studio_rfq_id', 'in', self.ids)], ['x_studio_rfq_id'], ['x_studio_rfq_id'])
dic = {}
for x in results: dic[x['x_studio_rfq_id'][0]] = x['x_studio_rfq_id_count']
for record in self: record['x_x_studio_rfq_id__x_import_rfq_charge_li_count'] = dic.get(record.id, 0)

```

**`x_x_studio_sales_order_account_payment_count`** on `sale.order`

```python

for record in self: record['x_x_studio_sales_order_account_payment_count'] = self.env['account.payment'].search_count([('x_studio_sales_order', '=', record.id)])

```

**`x_x_studio_subcontracting_so_purchase_order_count`** on `sale.order`

```python

for record in self: record['x_x_studio_subcontracting_so_purchase_order_count'] = self.env['purchase.order'].search_count([('x_studio_subcontracting_so', '=', record.id)])

```

---

## 7. Access Rights — Related Models

### stock.picking (35 rules)

| Rule Name | Group | Read | Write | Create | Delete |
|-----------|-------|------|-------|--------|--------|
| stock.picking | Purchase / # Jin - PO Invoicing & Payment - Inventory Credit | Yes | Yes | No | No |
| stock.picking | Purchase / Administrator | Yes | Yes | Yes | Yes |
| stock.picking manager | Inventory / Administrator | Yes | Yes | Yes | Yes |
| stock.picking.sales | Sales / Administrator | Yes | Yes | Yes | Yes |
| stock.picking manager | Ajith - Super | Yes | Yes | Yes | Yes |
| stock.picking | Accounting / Billing | Yes | Yes | Yes | No |
| stock.picking | Accounting / Billing Limited (archived) | Yes | Yes | Yes | No |
| stock.picking | Accounting / Billing limited - Cashier | Yes | Yes | Yes | No |
| Transfer | Sale / Default User - Read only for all models | Yes | No | No | No |
| Transfer | Manufacturing / Jin - Manufacturing - MO Creator | Yes | Yes | Yes | No |
| Transfer | Manufacturing / Jin - Manufacturing - MO Operator | Yes | No | No | No |
| stock.picking user | Manufacturing / Jin - Manufacturing - MO Operator | Yes | No | No | No |
| Transfer | Manufacturing / Jin - Manufacturing - Production Orders Dismantler | Yes | No | No | No |
| stock.picking user | Manufacturing / Jin - Manufacturing - Production Orders Dismantler | Yes | No | No | No |
| Transfer | Manufacturing / Jin - Manufacturing - Those with only view Rights | Yes | No | No | No |
| stock.picking user | Manufacturing / Jin - Manufacturing - Those with only view Rights | Yes | No | No | No |
| stock.picking | Purchase / Jin - PO Goods Receivers | Yes | Yes | Yes | Yes |
| stock.picking | Purchase / Jin - Procurement - View Only | Yes | No | No | No |
| Jin - Repair - Minimum Rights | Helpdesk / Jin - Repair - Full Rights | Yes | No | No | No |
| Jin - Repair - Minimum Rights | Helpdesk / Jin - Repair - Minimum Rights | Yes | No | No | No |
| User | Helpdesk / Jin - Repair - Ticket Creater | Yes | Yes | Yes | No |
| stock.picking | Sales / Jin - Sales - POS Users | Yes | Yes | No | No |
| stock.picking | Sales / Jin - Sales - View Only | Yes | Yes | No | No |
| stock_picking salesman | Sales / Jin - Sales - View Only | Yes | No | No | No |
| stock.picking | User types / Portal | Yes | No | No | No |
| stock.picking | Accounting / Read-only | Yes | No | No | No |
| stock.picking | Accounting / Read-only | Yes | No | No | No |
| stock_picking salesman | Sales User - New | Yes | Yes | Yes | No |
| stock.picking | Accounting / Test - Inheritance | Yes | No | No | No |
| User | Helpdesk / User | Yes | Yes | Yes | No |
| stock.move.line | Quality / User | Yes | No | No | No |
| stock.picking | Purchase / User | Yes | Yes | Yes | Yes |
| stock.picking pos_user | Point of Sale / User | Yes | Yes | Yes | Yes |
| stock.picking user | Inventory / User | Yes | No | No | No |
| stock_picking salesman | Sales / User: Own Documents Only | Yes | Yes | Yes | No |

### stock.return.picking (6 rules)

| Rule Name | Group | Read | Write | Create | Delete |
|-----------|-------|------|-------|--------|--------|
| Inv - Administrator | Inventory / Administrator | Yes | Yes | Yes | Yes |
| access.stock.return.picking | Manufacturing / Jin - Manufacturing - MO Operator | Yes | No | No | No |
| access.stock.return.picking | Manufacturing / Jin - Manufacturing - Production Orders Dismantler | Yes | No | No | No |
| access.stock.return.picking | Manufacturing / Jin - Manufacturing - Those with only view Rights | Yes | No | No | No |
| access.stock.return.picking | Purchase / Jin - PO Goods Receivers | Yes | No | No | No |
| access.stock.return.picking | Inventory / User | Yes | No | No | No |

### stock.location (12 rules)

| Rule Name | Group | Read | Write | Create | Delete |
|-----------|-------|------|-------|--------|--------|
| stock.location | Purchase / # Jin - PO Invoicing & Payment - Inventory Credit | Yes | No | No | No |
| stock.location | Purchase / Administrator | Yes | No | No | No |
| stock.location manager | Point of Sale / Administrator | Yes | No | No | No |
| stock.location sale manager | Sales / Administrator | Yes | No | No | No |
| stock.location.manager | Inventory / Administrator | Yes | Yes | Yes | Yes |
| stock.location.partner.manager | Extra Rights / Contact Creation | Yes | No | No | No |
| stock.location.user | User types / Internal User | Yes | No | No | No |
| stock.location | Purchase / Jin - Procurement - View Only | Yes | No | No | No |
| stock.location.user | Sales / Jin - Sales - View Only | Yes | No | No | No |
| stock.location.user | Sales User - New | Yes | No | No | No |
| stock.location | Purchase / User | Yes | No | No | No |
| stock.location.user | Sales / User: Own Documents Only | Yes | No | No | No |

---
## 8. Report Templates

### 8.1 repair.order Reports

Total repair.order reports: 12

| ID | Name | Report Name | Type | Print Name Formula | Attachment |
|----|------|------------|------|-------------------|------------|
| 712 | Repair Order | `repair.report_repairorder2` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3447 | Template C09 Repair Receipt | `repair.report_repairorder2_copy_1` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3448 | Template C10 Repair Estimate | `repair.report_repairorder2_copy_2` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3451 | Template C11 Repair Quotation | `repair.report_repairorder2_copy_3` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3452 | Template C12 Repair Invoice | `repair.report_repairorder2_copy_4` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3453 | Template C13 Repair AOD | `repair.report_repairorder2_copy_5` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3457 | Template C14 Ready for collection letter | `repair.report_repairorder2_copy_6` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3458 | Template C15 Final notice | `repair.report_repairorder2_copy_7` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3463 | Template C16 Final notice - Estimated | `repair.report_repairorder2_copy_7_copy_1` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3464 | Template C17 Final notice - Scrappage | `repair.report_repairorder2_copy_7_copy_2` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3465 | Template C18 Final notice - Estimated Scrappage | `repair.report_repairorder2_copy_7_copy_3` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |
| 3466 | Template C19 Reminder (Repair reminding letter) | `repair.report_repairorder2_copy_7_copy_4` | qweb-pdf | ('Repair Order - %s' % (object.name)) | - |

#### repair.order — Wrapper QWeb Templates (report_name2 series)

These are the outer HTML container templates that call the inner document templates:

**Key:** `repair.report_repairorder2`  

```xml
<?xml version="1.0"?>
<t t-name="repair.report_repairorder2">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>

```

**Key:** `repair.report_repairorder2_copy_1`  

```xml
<t t-name="repair.report_repairorder2_copy_1">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_1" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_2`  

```xml
<t t-name="repair.report_repairorder2_copy_2">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_2" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_3`  

```xml
<t t-name="repair.report_repairorder2_copy_3">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_3" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_4`  

```xml
<t t-name="repair.report_repairorder2_copy_4">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_4" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_5`  

```xml
<t t-name="repair.report_repairorder2_copy_5">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_5" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_6`  

```xml
<t t-name="repair.report_repairorder2_copy_6">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_6" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_7`  

```xml
<t t-name="repair.report_repairorder2_copy_7">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_7" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_7_copy_1`  

```xml
<t t-name="repair.report_repairorder2_copy_7_copy_1">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_7_copy_1" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_7_copy_2`  

```xml
<t t-name="repair.report_repairorder2_copy_7_copy_2">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_7_copy_2" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_7_copy_3`  

```xml
<t t-name="repair.report_repairorder2_copy_7_copy_3">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_7_copy_3" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

**Key:** `repair.report_repairorder2_copy_7_copy_4`  

```xml
<t t-name="repair.report_repairorder2_copy_7_copy_4">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-call="repair.report_repairorder_copy_7_copy_4" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>
```

#### repair.order — Full Document QWeb Templates

These templates define the actual PDF content and are called by the wrapper templates above.

**Key / Name:** `web_studio.report_editor_customization_full.view._repair.report_repairorder_copy_1`

```xml
<data><xpath expr="/t[@t-name='repair.report_repairorder_copy_1']" position="replace" mode="inner"><t t-set="o" t-value="doc"/>
            <t t-call="web.external_layout">
                <t t-set="o" t-value="o.with_context(lang=o.partner_id.lang)"/><div class="page">
                    
                    <h2><strong>Repair Receipt</strong>
                    </h2>
                  
                    <div class="row">
                        <div class="col-6">
                            <span style="white-space: pre-line;">
                                Customer Name   : <span t-field="o.partner_id"/>
                                Address         : <span t-field="o.partner_id.street"/>
                                Phone           : 0715279420
                                FAX NO.         : 0112421201
                                Mobile          : 0715306627UDESH
                                E Mail          : chinthaka inv-cont.menaka 0774105058
                                Item Id         : <span t-field="o.product_id.code"/>
                                Item Name       : <span t-field="o.product_id"/>
                                Serial Number   : 
                                NAT:I/D Card No :
                            </span>
                        </div>
                        <div class="col-6">
                            <span style="white-space: pre-line;">
                                Repair Receipts Id  : <span t-field="o.name"/>
                                Date                : <span t-esc="datetime.datetime.now().strftime('%Y-%m-%d')"/>
                            </span>
                        </div>
                        <strong style="white-space: pre-line;">When handing over this item and obtaining this receipt, I accept the conditions below.</strong>
                    </div>
                    
                    <div>
                        <h4 class="mb-3 border-bottom border-2 border-dark"/>
                        <div style="text-align: center; width: 100%;">
                            <strong>CONDITIONS</strong>
                        </div>
                        <span>
                            <p>
                            1. This receipt must be produced at the time the pump is collected either after repairs or otherwise. If the receipt is lost or misplaced,
                            an affidavit must be submitted. Alternatively, the pump will be handed over to the person whose ID card and other details are given
                            in the receipt above.
                            </p>
                            <p>
                            2. Payments can be made either by cash or by online bank transfer. Bank account details are given below. Once the payment is made,
                            WhatsApp the payment receipt to 0740 600 700 or email it to customercare@jinasena.com.lk for confirmation.
                                <span style="white-space: pre-line;">
                                    • Beneficiary Account No.: 1500007722 | Bank: Commercial Bank of Ceylon PLC | Branch: Foreign Branch – 003
                                </span>
                            </p><p>
                            3. Please note that it is required to dismantle the pump in order to prepare an estimate which consumes a considerable amount of
                            resources including skilled manpower. Therefore a fee will be charged as per the below rates, only if the quotation is not accepted.
                            The appropriate amount shall be paid at the time of the collection of the pump.
                                <span style="white-space: pre-line;">
                                    Pump categories and the Rates charged:
                                    • Domestic Pumps: Rs. 500/-
                                    • Small and Medium Industrial Pumps: Rs.1000/-
                                    • Other Pumps (Large industrial, Multistage, Engine driven): Rs.1500/-
                                </span>
                            </p><p>
                            4. Once an estimate is issued, if we do not receive confirmation to proceed within sixty(60) days from the date of the estimate, such
                            quotations are considered canceled. Customers are required to collect item/items handed over for repair estimates within the
                            above specified period. Please note that Jinasena (Pvt) Ltd, will not be responsible for failure to collect items within the specified
                            period and shall have the right to dispose appropriately.
                            </p>
                        </span>
                        
                    </div>
                    <div class="row" style="width: 40%; height: 50px; margin: 5 auto 5px auto;"/>
                    <div class="row">
                        <div class="col-6" style="align:left; border-top: 1px solid #000; width: 40%; margin: 0 auto 0px auto;">
                            Jinasena (Pvt) Ltd.
                        </div>
                        <div class="col-6" style="border-top: 1px solid #000; width: 40%; margin: 0 auto 5px auto;">
                            For and on behalf of the Owner
                        </div>
                    </div>
                    
                    <div class="oe_structure"/>
                </div></t>
</xpath></data>
```

**Key / Name:** `web_studio.report_editor_customization_full.view._repair.report_repairorder_copy_2`

```xml
<data><xpath expr="/t[@t-name='repair.report_repairorder_copy_2']" position="replace" mode="inner"><t t-set="o" t-value="doc"/>
            <t t-call="web.external_layout">
                <t t-set="o" t-value="o.with_context(lang=o.partner_id.lang)"/><div class="page">
                    <div class="oe_structure"/>
                    <h2><span>Estimated Sheet</span></h2>
                  
                    <div class="row">
                        <!-- ===== Column 1 ===== -->
                        <div class="col-6">
                            <span style="white-space: pre-line;">
                                Repair Order    :   
                                Cust. Number    :   <span t-field="o.partner_id"/>
                            </span>
                        </div>
                            
                        <div class="col-6">
                            <span style="white-space: pre-line;">
                                Product Number  :   <span t-field="o.product_id"/>
                                Customer Name   :   <span t-field="o.partner_id"/>
                            </span>
                        </div>
                        <span style="white-space: pre-line;">Work to be done and materials consumed</span>
                    </div>
                    <hr/>
                  
                    <table class="table table-sm o_main_table">
                        <thead>
                            <tr>
                                <th class="text-start">Item Id</th>
                                <th class="text-start">Name</th>
                                <th class="text-start">Quantity</th>
                                <th class="text-start">Units</th>
                                <th class="text-start">Sales price</th>
                                <th class="text-end">Net amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr t-foreach="o.move_ids" t-as="line">
                                <td class="text-start">
                                    <span t-field="line.product_id"/>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_name"/>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty"/>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom.name"/>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_price"/>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_price.subtotal"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <hr/>
                    <div class="row mt-4"/>

                    
                    <!-- ===== Table 2 ===== -->
                    <table class="table table-sm o_main_table w-100">
                        <thead>
                            <tr>
                                <th class="text-start"/>
                                <th class="text-end"/>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-start">
                                    <span>Net Amount</span>
                                </td>
                                <td class="text-end">
                                   <!-- <span t-esc="o.amount_untaxed"/> -->
                                </td>
                            </tr>
                            <tr>
                                <td class="text-start">
                                    <span>Margin</span>
                                </td>
                                <td class="text-end">
                                    <!-- <span t-esc="o.amount_tax"/> -->
                                </td>
                            </tr>
                            <tr>
                                <td class="text-start">
                                    <span>Discount</span>
                                </td>
                                <td class="text-end">
                                    <!-- <span t-esc="o.amount_discount"/> -->
                                </td>
                            </tr>
                            <tr>
                                <td class="text-start">
                                    <span>VAT</span>
                                </td>
                                <td class="text-end">
                                    <!-- <span t-esc="o.amount_tax"/>-->
                                </td>
                            </tr>
                            <tr>
                                <td class="text-start">
                                    <span>Total</span>
                                </td>
                                <td class="text-end">
                                    <!-- <span t-esc="o.amount_total"/>-->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div t-if="o.internal_notes">
                    </div>
                    <div class="oe_structure"/>
                </div></t>
</xpath></data>
```

**Key / Name:** `web_studio.report_editor_customization_full.view._repair.report_repairorder_copy_3`

```xml
<data><xpath expr="/t[@t-name='repair.report_repairorder_copy_3']" position="replace" mode="inner"><t t-set="o" t-value="doc"/>
            <t t-call="web.external_layout">
                <t t-set="o" t-value="o.with_context(lang=o.partner_id.lang)"/><div class="page">
                    <div class="oe_structure"/>
                    <h2>
                        <span>Repair Quotation</span></h2>
                    <div class="oe_structure"/>
                    
                    <div id="informations" class="row mb-3">
                        <div class="col-6">
                            <span style="white-space: pre-line;">
                                <span t-field="o.partner_id"/>
                                MR A S M RILWAN
                                05 PANTRIVE GARDEN
                                COLOMBO 03,
                            </span>
                            <span style="white-space: pre-line;">
                                VAT No              :
                                SVAT No             :
                                Customer Ref        : <span t-field="o.partner_id"/>
                            </span>
                        </div>
                        <div class="col-6">
                            <span style="white-space: pre-line;">
                                Number            : <span t-field="o.partner_id"/>
                                Date              : <span t-field="o.schedule_date"/>
                                Sales/Repairs Id  : 00070564_157
                                Requisition       :
                                Your ref          :
                                Our ref           : <span t-field="o.company_id"/>
                                Quotation deadline:
                                Payment           :
                                Reference Num     : 00084830_158
                                Serial Num        : df9012
                                
                            </span>
                        </div>
                    </div>
                    
                    <!-- ===== Table 1 ===== -->
                    <table class="table table-sm o_main_table">
                        <thead>
                            <tr>
                                <th class="text-start">Item number</th>
                                <th class="text-end">Description</th>
                                <th class="text-end">Quantity</th>
                                <th class="text-end">Unit</th>
                                <th class="text-end">Unit price</th>
                                <th class="text-end"> Disc %</th>
                                <th class="text-end">Discount</th>
                                <th class="text-end">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr t-foreach="o.move_ids" t-as="line">
                                <td class="text-start">
                                    <span t-field="line.product_id">1</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_name">LPL02</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_qty">2</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_uom_qty">pcs</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_price">100</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_discount_rate">15</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_discount">30</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_total_amount">170</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row mt-4"/>

                    <!-- ===== Table 2 ===== -->
                    <table class="table table-sm o_main_table">
                        <thead>
                            <tr>
                                <th class="text-start">Item Id</th>
                                <th class="text-start">Item Name</th>
                                <th class="text-start">Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr t-foreach="o.move_ids" t-as="line">
                                <td class="text-start">
                                    <span t-field="line.product_id">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_name">Lp06 Item 1015</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_qty">5</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row mt-4"/>

                    <!-- ===== Table 3 ===== -->
                    <table class="table table-sm o_main_table">
                        <thead>
                            <tr>
                                <th class="text-start">Condition Id</th>
                                <th class="text-start">Condition Detail</th>
                                <th class="text-start">Total Payable : </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr t-foreach="o.move_ids" t-as="line">
                                <td class="text-start">
                                    <span t-field="line.condition_id">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.condition_detail">condition detail relted to 5ILP06</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_payable">8200 LKR</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row mt-4"/>

                    
                    <!-- ===== Table 4 ===== -->
                    <table class="table table-sm o_main_table">
                        <thead>
                            <tr>
                                <th class="text-start">Sales balance</th>
                                <th class="text-start">Total discount</th>
                                <th class="text-start">Misc. charges</th>
                                <th class="text-start">Sales tax</th>
                                <th class="text-start">Round-off</th>
                                <th class="text-start">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr t-foreach="o.move_ids" t-as="line">
                                <td class="text-start">
                                    <span t-field="line.sales_balance">5000</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.total_discount">200</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.misc_charges">50</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.sales_tax">150</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.round_off">100</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.total">5200</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row mt-4"/>

                    <!-- ===== TERMS AND CONDITIONS ===== -->
                    <div>
                        <span style="white-space: pre-line;">
                            <strong>TERMS AND CONDITIONS</strong>
                            <p>
                            1. If we do not receive a confirmation to proceed with the repair within 60 days of the date of estimate, this quotation is considered as cancelled. However if you wish to proceed with the repair thereafter our repair team will issue you a renewed quotation for the same.
                            </p><p>
                            2. Repairs will commence only on receipt of confirmation together with a 50% advance payment from the total amount.
                            </p><p>
                            3. Payments can be made either by cash or online bank transfer. (Bank account details given below – Once payment is made please whatsapp the payment receipt to 0740600700 or email to customercare@jinasena.com.lk for conformation.
                            • Beneficiary Account No.: 1500007722 | Bank: Commercial Bank of Ceylon PLC | Branch: Foreign Branch – 003
                            </p><p>
                            4. Motors are tested under no load conditions - if, after repairs any motor components are found to be defective a subsequent estimate will be forwarded for your approval.
                            </p>
                        </span>
                    </div>
                    

                    <div class="oe_structure"/>
                    <div t-if="o.internal_notes">
                    </div>
                    <div class="oe_structure"/>
                </div></t>
</xpath></data>
```

**Key / Name:** `web_studio.report_editor_customization_full.view._repair.report_repairorder_copy_4`

```xml
<data><xpath expr="/t[@t-name='repair.report_repairorder_copy_4']" position="replace" mode="inner"><t t-set="o" t-value="doc"/>
            <t t-call="web.external_layout">
                <t t-set="o" t-value="o.with_context(lang=o.partner_id.lang)"/><div class="page">
                    <div class="oe_structure"/>
                    <h2><span>Repair Invoice</span></h2>
                    <p><br/></p>
                    
                    <div id="informations" class="row mb-3">
                        <div class="col-4">
                            <span style="white-space: pre-line;">
                                Customer Id         : 
                                MR THALAGALA
                                215B GALVIHARA PLACE
                                DEHIWELA,
                                <span t-field="o.partner_id"/>
                                Cust. VAT Reg No.   :
                                Cust. SVAT Reg No.  :
                            </span>
                        </div>
                        <div class="col-4">
                            <span style="white-space: pre-line;">
                                Invoice Num :   <span/>
                                Sales order :   <span/>
                                Requisition :   <span/>
                                Payment     :   <span/>
                                Warehouse   :   <span/>
                            </span>
                        </div>
                        <div class="col-4">
                            <span style="white-space: pre-line;">
                                Date            : <span t-field="o.schedule_date"/>
                                Your ref        : <span/>
                                Our ref         : <span/>
                                Com.Vat RegNo   : 104024955 7000<span/>
                                Com.SVat RegNo  : 001873<span/>
                                Com.NBT RegNo.  : 104024955<span/>
                                Reference Num   : 00084830_158<span/>
                                Serial Num      : df9012<span/>
                            </span>
                        </div>
                    </div>
                   
                    <h2 class="mb-3 border-bottom border-2 border-dark"/>
                    <table class="table table-sm o_main_table">
                        <thead>
                            <tr>
                                <th class="text-start">Item number</th>
                                <th class="text-end">Description</th>
                                <th class="text-end">Quantity</th>
                                <th class="text-end">Unit</th>
                                <th class="text-end">Unit price</th>
                                <th class="text-end">Disc %</th>
                                <th class="text-end">Discount</th>
                                <th class="text-end">Amount</th>  
                            </tr>
                        </thead>
                        <tbody>
                            <tr t-foreach="o.move_ids" t-as="line">
                                <td class="text-end">
                                    <span t-field="line.id">1</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_id">LP06 wre1201</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_qty">500</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_uom_qty">pcs</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_price_unit">1260</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_discount">5</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_discount">50</span>
                                </td>
                                <td class="text-end">
                                    <span t-field="line.product_total_amount">12000</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-sm o_main_table" style="width:100%;">
                        <thead>
                            <tr>
                                <th class="text-start"/>
                                <th class="text-end"/>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-start">TOTAL INVOICE VALUE</td>
                                <td class="text-end"><span>12630.00</span></td>
                            </tr>
                            <tr>
                                <td class="text-start">ADVANCE</td>
                                <td class="text-end"><span>2000.00</span></td>
                            </tr>
                            <tr>
                                <td class="text-start">BALANCE</td>
                                <td class="text-end"><span>10630.00</span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <span style="white-space: pre-line;">
                            * Goods returns will not be accepted once sold, unless warranty conditions apply.
                            * All payments should be made by A/C payee cheques in favor of "JINASENA (PVT) LTD".
                            * GOODS RECEIVED IN CORRECT QUANTITY AND IN GOOD CONDITION.
                        </span>
                    </div>
                    <div class="row" style="width: 40%; height: 50px; margin: 5 auto 5px auto;"/>
                    <div class="row">
                        <div class="col-6" style="align:left; border-top: 1px solid #000; width: 20%; margin: 0 auto 0px auto;">
                            Prepared by
                        </div>
                         <div class="col-6" style="align:left; border-top: 1px solid #000; width: 20%; margin: 0 auto 0px auto;">
                            Authorized by
                        </div>
                         <div class="col-6" style="align:left; border-top: 1px solid #000; width: 20%; margin: 0 auto 0px auto;">
                            Customer's Name and NIC No 
                        </div>
                        <div class="col-6" style="border-top: 1px solid #000; width: 20%; margin: 0 auto 5px auto;">
                            Customer's Signature
                        </div>
                    </div>

                    <div t-if="o.internal_notes">
                    </div>
                    <div class="oe_structure"/>
                </div></t>
</xpath></data>
```

**Key / Name:** `web_studio.report_editor_customization_full.view._repair.report_repairorder_copy_5`

```xml
<data><xpath expr="/t[@t-name='repair.report_repairorder_copy_5']" position="replace" mode="inner"><t t-set="o" t-value="doc"/>
            <t t-call="web.external_layout">
                <t t-set="o" t-value="o.with_context(lang=o.partner_id.lang)"/><div class="page">
                    <div class="oe_structure"/>
                    <h2>
                        <span>Repair Advice of dispatch</span></h2>
                    
                    <div id="informations" class="row mb-3">
                        <div class="col-4">
                            <span style="white-space: pre-line;">
                                <span t-field="doc.partner_id"/>
                                <span t-field="doc.partner_id.street"/><span t-field="doc.partner_id.street2"/><span t-field="doc.partner_id.city"/><span t-field="doc.partner_id.zip"/><span t-field="doc.partner_id.country_id"/>
                                <span t-field="doc.partner_id.city"/>
                                RUBBER RESEARCH INSTITUTE OF SRI LANKA
                                DARTONFIELD
                                AGALAWATTA,
                            </span>
                        </div>
                        <div class="col-4">
                            <span style="white-space: pre-line;">
                                Reference Number    : 00083117_158
                                Invoice ID          : RP-CM-004854-23
                                Repair Sales Id     : <span t-field="doc.display_name"/>
                            </span>
                        </div>
                    </div>
                   
                    <h2 class="mb-3 border-bottom border-2 border-dark"/>
                    <table class="table table-sm o_main_table">
                        <thead>
                            <tr>
                                <th class="text-start">AOD Id</th>
                                <th class="text-start">Status</th>
                                <th class="text-start">Despatch Type</th>
                                <th class="text-start">Reference type</th>
                                <th class="text-start">Reference id </th>
                                <th class="text-start">Delivered by</th>
                                <th class="text-end">Delivered date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr t-foreach="o.move_ids" t-as="line">
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                        
                    <h2 class="mb-3 border-bottom border-2 border-dark"/>
                    <table class="table table-sm o_main_table">
                        <thead>
                            <tr>
                                <th class="text-start">Item number</th>
                                <th class="text-start">Description</th>
                                <th class="text-start">Serial Number</th>
                                <th class="text-start">Quantity</th>
                                <th class="text-start">Unit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr t-foreach="o.move_ids" t-as="line">
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                                <td class="text-start">
                                    <span t-field="line.product_uom_qty">5</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div>
                        <span style="white-space: pre-line;">
                            Recieved the above in good order
                        </span>
                    </div>
                    
                    <div class="row" style="width: 40%; height: 50px; margin: 5 auto 5px auto;"/>
                    <div class="row">
                        <div class="col-6" style="align:left; border-top: 1px solid #000; width: 40%; margin: 0 auto 0px auto;">
                            For and behalf of Consignee
                        </div>
                        <div class="col-6" style="border-top: 1px solid #000; width: 40%; margin: 0 auto 5px auto;">
                            JINASENA LTD.
                        </div>
                    </div>
                   
                    <div t-if="o.internal_notes">
                    </div>
                    <div class="oe_structure"/>
                </div></t>
</xpath></data>
```

---

### 8.2 helpdesk.ticket Reports

Total helpdesk.ticket reports: 18

| ID | Name | Report Name | Type |
|----|------|------------|------|
| 3492 | C09 Repair Receipt | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2` | qweb-pdf |
| 3494 | C10 Repair Estimate | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_1` | qweb-pdf |
| 3495 | C11 Repair Quotation | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_2` | qweb-pdf |
| 3496 | C12 Repair Invoice | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_3` | qweb-pdf |
| 3516 | C13 Repair AOD | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_10` | qweb-pdf |
| 3515 | C14 Ready for collection letter | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_9` | qweb-pdf |
| 3514 | C15 Final notice | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_8` | qweb-pdf |
| 3513 | C16 Final notice - Estimated | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_7` | qweb-pdf |
| 3512 | C17 Final notice - Scrappage | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_6` | qweb-pdf |
| 3511 | C18 Final notice - Estimated Scrappage | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_5` | qweb-pdf |
| 3510 | C19 Reminder (Repair reminding letter) | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_2_copy_4` | qweb-pdf |
| 2237 | Customer Letter | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_1` | qweb-pdf |
| 2420 | Helpdesk Ticket Report | `studio_customization.studio_report_docume_78e655c4-b305-48ac-95e4-92166e28f8f8` | qweb-pdf |
| 2240 | Repair Final Notice | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_1_copy_1` | qweb-pdf |
| 2241 | Repair Final Notice - Scrappage | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb_copy_1_copy_1_copy_1` | qweb-pdf |
| 2094 | Repair Receipt | `studio_customization.studio_report_docume_73c7b165-9179-4119-993c-d9ea506c43eb` | qweb-pdf |
| 2093 | Repair Status | `studio_customization.studio_report_docume_4ba14515-b356-4e1d-8b52-1811bba71761` | qweb-pdf |
| 3036 | Timesheets | `helpdesk_timesheet.report_timesheet_ticket` | qweb-pdf |

**Template:** `helpdesk_timesheet.report_timesheet_ticket`

```xml
<t t-name="helpdesk_timesheet.report_timesheet_ticket">
        <t t-call="web.html_container">
            <t t-call="web.external_layout">
                <t t-set="company" t-value="docs.company_id if len(docs) == 1 else docs.env.company"/>
                <div class="page">
                    <t t-foreach="docs" t-as="doc">
                        <div class="oe_structure"/>
                        <div class="row mt8">
                            <div class="col-12">
                                <t t-if="doc.use_helpdesk_timesheet and doc.timesheet_ids">
                                    <h1 class="my-4">
                                        <t t-if="not show_ticket">
                                            Ticket: <span t-field="doc.name"/>
                                        </t>
                                    </h1>
                                    <h2>
                                        <span>Timesheets
                                            <t t-if="show_ticket">
                                                for the <t t-out="doc.name"/> Ticket
                                            </t>
                                        </span>
                                    </h2>
                                    <t t-set="lines" t-value="doc.timesheet_ids"/>
                                    <t t-call="hr_timesheet.timesheet_table"/>
                                </t>
                            </div>
                        </div>
                    </t>
                </div>
            </t>
        </t>
    </t>
```

---

## 9. Mail Activity Types

| Name | Summary | Model | Category | Delay | Icon |
|------|---------|-------|---------|-------|------|
| Handle Ticket | - | helpdesk.ticket | default | 0 days | fa-ticket |

**Note:** Only 1 repair-domain activity type was filtered. The full system has 28 activity types. The repair workflow primarily uses the standard "Handle Ticket" activity on helpdesk.ticket.

---

## 10. Portal / Website QWeb Templates (Studio-Modified)

Total Studio-modified templates: 40 (out of 83 total website/portal templates).

Only repair/helpdesk relevant non-empty templates are shown below.

### Key: `website_helpdesk.team`
**Name:** Helpdesk Team

```xml
<t name="Helpdesk Team" t-name="website_helpdesk.team">
  <t t-call="website.layout">
    <t t-set="additional_title">Helpdesk Team</t>
    <div id="wrap" class="container mt-4">
      <div class="row mb16">
        <div class="oe_structure" id="oe_structure_website_helpdesk_team_1"/>
        <div class="col-md-9">
          <h2 class="o_page_header mt0 d-none" id="team-page"/>
        </div>
        <div class="col-md-9 ps-4">
          <!-- placeholder -->
          <div t-if="team.use_website_helpdesk_form"><t t-set="template_xmlid" t-value="team.website_form_view_id.xml_id"/><t t-call="#{template_xmlid}"/></div>
        </div>
        <div class="col-md-3" id="right-column">
          <div class="oe_structure" id="oe_structure_website_helpdesk_team_2"/>
          <div class="row justify-content-end mb-5" id="website_published_button" groups="helpdesk.group_helpdesk_manager">
            <t t-call="website.publish_management">
              <t t-set="object" t-value="team"/>
              <t t-set="publish_edit" t-value="True"/>
              <t t-set="action" t-value="'helpdesk.helpdesk_team_action'"/>
              <t t-set="menu" t-value="env.ref('helpdesk.menu_helpdesk_root').id"/>
            </t>
          </div>
          <t t-if="not is_html_empty(team.description)">
            <div class="card bg-secondary mt-2" id="about_team">
              <h6 class="card-header">
                <b>About our team</b>
              </h6>
              <div class="card-body">
                <span t-field="team.description"/>
              </div>
            </div>
          </t>
          <div class="oe_structure" id="oe_structure_website_helpdesk_team_3"/>
        </div>
      </div>
      <div class="oe_structure" id="oe_structure_website_helpdesk_team_4"/>
    </div>
  </t>
</t>
```

### Key: `website_helpdesk.team_oe_structure_website_helpdesk_team_4`
**Name:** Helpdesk Team (oe_structure_website_helpdesk_team_4)

```xml
<data>
  <xpath expr="//*[hasclass('oe_structure')][@id='oe_structure_website_helpdesk_team_4']" position="replace">
    <div class="oe_structure" id="oe_structure_website_helpdesk_team_4"><section class="s_faq_collapse pt32 pb32 o_colored_level" data-snippet="s_faq_collapse" data-name="Accordion" style="background-image: none;">
        <div class="container">
            <div id="myCollapse" class="accordion" role="tablist">
                <div class="card bg-white" data-name="Item" role="presentation">
                    <a href="#" role="tab" data-bs-toggle="collapse" aria-expanded="false" class="card-header o_default_snippet_text collapsed" data-bs-target="#myCollapseTab364658_1" aria-controls="myCollapseTab364658_1">Terms of service</a>
                    <div class="collapse" data-bs-parent="#myCollapse" role="tabpanel" id="myCollapseTab364658_1">
                        <div class="card-body">
                            <p class="card-text o_default_snippet_text">These terms of service ("Terms", "Agreement") are an agreement between the website ("Website operator", "us", "we" or "our") and you ("User", "you" or "your"). This Agreement sets forth the general terms and conditions of your use of this website and any of its products or services (collectively, "Website" or "Services").</p>
                        </div>
                    </div>
                </div>
                <div class="card bg-white" data-name="Item" role="presentation">
                    <a href="#" role="tab" data-bs-toggle="collapse" aria-expanded="false" class="card-header o_default_snippet_text collapsed" data-bs-target="#myCollapseTab364658_2" aria-controls="myCollapseTab364658_2">Links to other Websites</a>
                    <div class="collapse" data-bs-parent="#myCollapse" role="tabpanel" id="myCollapseTab364658_2">
                        <div class="card-body">
                            <p class="card-text o_default_snippet_text">Although this Website may be linked to other websites, we are not, directly or indirectly, implying any approval, association, sponsorship, endorsement, or affiliation with any linked website, unless specifically stated herein.</p>
                            <p class="card-text o_default_snippet_text">You should carefully review the legal statements and other conditions of use of any website which you access through a link from this Website. Your linking to any other off-site pages or other websites is at your own risk.</p>
                        </div>
                    </div>
                </div>
                <div class="card bg-white" data-name="Item" role="presentation">
                    <a href="#" role="tab" data-bs-toggle="collapse" aria-expanded="false" class="collapsed card-header o_default_snippet_text" data-bs-target="#myCollapseTab364658_3" aria-controls="myCollapseTab364658_3">Use of Cookies</a>
                    <div class="collapse" data-bs-parent="#myCollapse" role="tabpanel" id="myCollapseTab364658_3">
                        <div class="card-body">
                            <p class="card-text o_default_snippet_text">Website may use cookies to personalize and facilitate maximum navigation of the User by this site. The User may configure his / her browser to notify and reject the installation of the cookies sent by us.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section></div>
  </xpath>
</data>
```

### Key: `website.helpdesk`
**Name:** helpdesk

```xml
<t t-name="website.helpdesk">
    <t t-call="website.layout">
        <div id="wrap" class="oe_structure oe_empty"/>
    </t>
</t>
```

### Key: `website_helpdesk.team_form_11`
**Name:** website_helpdesk.team_form_11

```xml
<t name="Helpdesk: Submit a Ticket Form" t-name="website_helpdesk.ticket_submit_form">
        <div class="container">
            <h2 class="text-muted">
                Submit a Ticket
                <t t-if="multiple_teams"> - <t t-out="team.name"/></t>
            </h2>
            <div class="oe_structure" id="oe_structure_whelpdesk_form_1"/>
            <span class="hidden" data-for="helpdesk_ticket_form" t-att-data-values="{'team_id': team and team.id or ''}"/>
            <div id="helpdesk_section" class="">
                <section class="s_website_form pt16 pb16 o_colored_level" data-vcss="001" data-snippet="s_website_form" data-name="Form" style="background-image: none;">
                    <div class="container">
                        <form id="helpdesk_ticket_form" action="/website/form/" method="post" enctype="multipart/form-data" class="o_mark_required" data-mark="*" data-pre-fill="true" data-success-mode="redirect" data-success-page="/your-ticket-has-been-submitted" data-model_name="helpdesk.ticket">
                            <div class="s_website_form_rows row s_col_no_bgcolor">
                                <div class="mb-0 py-2 s_website_form_field col-12 s_website_form_required" data-type="char" data-name="Field">
                                    <div class="row s_col_no_resize s_col_no_bgcolor">
                                        <label class="col-form-label col-sm-auto s_website_form_label" style="width: 200px" for="helpdesk1">
                                            <span class="s_website_form_label_content">Your Name</span>
                                            <span class="s_website_form_mark"> *</span>
                                        </label>
                                        <div class="col-sm">
                                            <input type="text" class="form-control s_website_form_input" name="partner_name" required="1" data-fill-with="name" id="helpdesk1"/>
                                        </div>
                                    </div>
                                </div><div data-name="Field" class="s_website_form_field mb-3 col-12 s_website_form_custom" data-type="char" data-translated-name="Field"><div class="row s_col_no_resize s_col_no_bgcolor"><label class="col-form-label col-sm-auto s_website_form_label" style="width: 200px" for="opgy92veoow"><span class="s_website_form_label_content"/></label><div class="col-sm"><input class="form-control s_website_form_input" type="text" name="" placeholder="" id="opgy92veoow" data-fill-with="undefined"/></div></div></div><div data-name="Field" class="s_website_form_field mb-3 col-12" data-type="many2one" data-translated-name="Field"><div class="row s_col_no_resize s_col_no_bgcolor"><label class="col-form-label col-sm-auto s_website_form_label" style="width: 200px" for="o8e1iixipvrd"><span class="s_website_form_label_content">Serial Number</span></label><div class="col-sm"><select class="form-select s_website_form_input" style="" name="x_studio_serial_no" id="o8e1iixipvrd"><option value="2790" selected="selected">A0001</option><option value="2800">AA0001</option><option value="2815">AA0002</option><option value="2817">AA0003</option><option value="2788">AS0001</option><option value="2793">KA-0001</option><option value="2794">KA-0002</option><option value="2795">KA-0003</option><option value="2796">KA-0004</option><option value="2797">KA-0005</option><option value="2799">KA-0006</option><option value="2814">KA-0007</option><option value="2816">KA-0008</option><option value="2789">T0001</option></select></div></div></div><div data-name="Field" class="s_website_form_field mb-3 col-12" data-type="many2one" data-translated-name="Field"><div class="row s_col_no_resize s_col_no_bgcolor"><label class="col-form-label col-sm-auto s_website_form_label" style="width: 200px" for="o0cw630rl619b"><span class="s_website_form_label_content">Repair Location</span></label><div class="col-sm"><select class="form-select s_website_form_input" style="" name="x_studio_repair_location" id="o0cw630rl619b"><option value="148">BR-AM</option><option value="149">BR-AM/Stock</option><option value="157">BR-AN</option><option value="158">BR-AN/Stock</option><option value="352">BR-EK</option><option value="353">BR-EK/Stock</option><option value="75">CW-CM</option><option value="76">CW-CM/Stock</option><option value="83">MW-CM</option><option value="84">MW-CM/Stock</option><option value="207">MW-CM/Transit</option><option value="182">MW-EK</option><option value="485">MW-EK/FinishGood</option><option value="183">MW-EK/Stock</option><option value="208">MW-EK/Transit</option><option value="222">MW-JC</option><option value="460">MW-JC/FinishGood</option><option value="223">MW-JC/Stock</option><option value="443">MW-JE</option><option value="444">MW-JE/Stock</option><option value="91">OW-EK</option><option value="92">OW-EK/Stock</option><option value="210">OW-EK/Transit</option><option value="368">PJ-EI</option><option value="369">PJ-EI/Stock</option><option value="758">PL-EK</option><option value="759">PL-EK/Stock</option><option value="131">PW-E1</option><option value="191">PW-E1/Dismantle</option><option value="451">PW-E1/FinishGood</option><option value="132">PW-E1/Stock</option><option value="213">PW-E1/Transit</option><option value="115">PW-JE</option><option value="116">PW-JE/Stock</option><option value="212">PW-JE/Transit</option><option value="750">PW-MA</option><option value="751">PW-MA/Stock</option><option value="123">PW-MW</option><option value="124">PW-MW/Stock</option><option value="2">Partner Locations</option><option value="5">Partner Locations/Customers</option><option value="4">Partner Locations/Vendors</option><option value="1">Physical Locations</option><option value="13">Physical Locations/Inter-warehouse transit</option><option value="387">Physical Locations/Subcontracting Location</option><option value="488">Physical Locations/Subcontracting Location</option><option value="166">RC-TM</option><option value="390">RC-TM/RC-TM-Consignment Location</option><option value="167">RC-TM/Stock</option><option value="333">RP-CM</option><option value="334">RP-CM/Stock</option><option value="139">RP-EK</option><option value="480">RP-EK/FinishGood</option><option value="140">RP-EK/Stock</option><option value="190">RP-EK/Transit</option><option value="360">RP-QU</option><option value="361">RP-QU/Stock</option><option value="99">SP-RC</option><option value="100">SP-RC/Stock</option><option value="209">SP-RC/Transit</option><option value="406">TV-SC</option><option value="766">Temp</option><option value="3">Virtual Locations</option><option value="14">Virtual Locations/Inventory adjustment</option><option value="385">Virtual Locations/MJ</option><option value="205">Virtual Locations/MR</option><option value="15">Virtual Locations/Production</option><option value="256">Virtual Locations/Production</option><option value="255">Virtual Locations/Repair/Colombo</option><option value="389">Virtual Locations/Repair/Ekala</option><option value="415">Virtual Locations/Repair/RP-QU</option><option value="16">Virtual Locations/Scrap</option></select></div></div></div><div data-name="Field" class="s_website_form_field mb-3 col-12 s_website_form_custom" data-type="char" data-translated-name="Field"><div class="row s_col_no_resize s_col_no_bgcolor"><label class="col-form-label col-sm-auto s_website_form_label" style="width: 200px" for="or1m1l738ef"><span class="s_website_form_label_content">Custom Text</span></label><div class="col-sm"><input class="form-control s_website_form_input" type="text" name="Custom Text" id="or1m1l738ef"/></div></div></div>
                                <div class="mb-0 py-2 s_website_form_field col-12 s_website_form_required" data-type="email" data-name="Field">
                                    <div class="row s_col_no_resize s_col_no_bgcolor">
                                        <label class="col-form-label col-sm-auto s_website_form_label " style="width: 200px" for="helpdesk2">
                                            <span class="s_website_form_label_content">Your Email</span>
                                            <span class="s_website_form_mark"> *</span>
                                        </label>
                                        <div class="col-sm">
                                            <input type="email" class="form-control s_website_form_input" name="partner_email" required="1" data-fill-with="email" id="helpdesk2"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-0 py-2 s_website_form_field col-12 s_website_form_model_required" data-type="char" data-name="Field">
                                    <div class="row s_col_no_resize s_col_no_bgcolor">
                                        <label class="col-form-label col-sm-auto s_website_form_label " style="width: 200px" for="helpdesk3">
                                            <span class="s_website_form_label_content">Subject</span>
                                            <span class="s_website_form_mark"> *</span>
                                        </label>
                                        <div class="col-sm">
                                            <input type="text" class="form-control s_website_form_input" name="name" required="true" id="helpdesk3"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-0 py-2 s_website_form_field col-12" data-type="char" data-name="Field">
                                    <div class="row s_col_no_resize s_col_no_bgcolor">
                                        <label class="col-form-label col-sm-auto s_website_form_label " style="width: 200px" for="helpdesk4">
                                            <span class="s_website_form_label_content">Description</span>
                                        </label>
                                        <div class="col-sm">
                                            <textarea type="text" class="form-control s_website_form_input" name="description" id="helpdesk4" rows="5"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-0 py-2 s_website_form_field col-12 s_website_form_custom" data-type="binary" data-name="Field">
                                    <div class="row s_col_no_resize s_col_no_bgcolor">
                                        <label class=" col-sm-auto s_website_form_label " style="width: 200px" for="helpdesk5">
                                            <span class="s_website_form_label_content">Attachment</span>
                                        </label>
                                        <div class="col-sm">
                                            <input type="file" class="form-control s_website_form_input" name="Attachment" id="helpdesk5"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-0 py-2 s_website_form_field col-12 s_website_form_dnone" data-name="Field">
                                    <div class="row s_col_no_resize s_col_no_bgcolor">
                                        <label class="col-form-label col-sm-auto s_website_form_label" style="width: 200px">
                                            <span class="s_website_form_label_content"/>
                                        </label>
                                        <div class="col-sm">
                                            <input type="hidden" class="form-control s_website_form_input" name="team_id" id="helpdesk6"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-0 py-2 col-12 s_website_form_submit" data-name="Submit Button">
                                    <div style="width: 200px;" class="s_website_form_label"/>
                                    <a href="#" role="button" class="btn btn-primary btn-lg s_website_form_send o_default_snippet_text">Submit Ticket</a>
                                    <span id="s_website_form_result"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </t>
```

### Key: `website_helpdesk.team_form_2`
**Name:** website_helpdesk_form.team_form_2

```xml
<t name="Helpdesk: Submit a Ticket Form" t-name="website_helpdesk_form.ticket_submit_form">
  <div class="container">
    <h2 class="text-muted">
      <b>
        <font style="color: rgb(4, 22, 87);">Send Message</font>
      </b>
      <br/>
    </h2>
    <span class="hidden" data-for="helpdesk_ticket_form" t-att-data-values="{'team_id': team and team.id or False}"/>
    <div id="helpdesk_section" class="">
      
    </div>
  </div>
</t>
```

### repair.report_repairorder_copy_N — Content Summary

The portal/website templates for `repair.report_repairorder_copy_1` through `_copy_19` are the Studio-customized versions of the PDF reports. Each copy corresponds to one of the 11 report templates (C09–C19). The inner document content is rendered via `web_studio.report_editor_customization_full.view.*` overrides (see Section 8.1 above).

The 5 `web_studio.report_editor_customization_full.view._repair.report_repairorder_copy_*` templates (arch lengths: 5519, 5825, 10746, 7345, 6946) correspond to:

| Copy | Arch Length | Report Name |
|------|------------|-------------|
| copy_1 | 5,519 | Repair Receipt (C09) |
| copy_2 | 5,825 | Repair Estimate (C10) |
| copy_3 | 10,746 | Repair Quotation (C11) |
| copy_4 | 7,345 | Repair Invoice (C12) |
| copy_5 | 6,946 | Repair AOD (C13 – Advice of Dispatch) |

---
## 11. Wizard Models

### stock.return.picking — Return Wizard Fields

The `stock.return.picking` model is the core Return wizard. Below are its manual/studio fields:

#### Studio-added Fields (5)

| Field | Label | Type | Relation | Required | Readonly | Related |
|-------|-------|------|---------|----------|----------|---------|
| `x_studio_repair_normal_with_serial_no` | Repair Normal With Serial No | boolean | - | No | Yes | ticket_id.x_studio_normal_repair_with_serial_no |
| `x_studio_repair_normal_without_serial_no` | Repair Normal Without Serial No | boolean | - | No | Yes | ticket_id.x_studio_normal_repair_without_serial_no |
| `x_studio_repair_rug` | Repair RUG | boolean | - | No | Yes | ticket_id.x_studio_rug_repair |
| `x_studio_suggested_location_id` | Suggested Return Location | many2one | stock.location | No | Yes | ticket_id.x_studio_virtual_location |
| `x_studio_suggested_location_id_1` | Suggested Return Location | many2one | stock.location | No | Yes | ticket_id.x_studio_virtual_location_1 |

#### Manual Fields (same 5, confirmed store/compute details)

| Field | Label | Type | Stored | Related |
|-------|-------|------|--------|---------|
| `x_studio_repair_normal_with_serial_no` | Repair Normal With Serial No | boolean | No | ticket_id.x_studio_normal_repair_with_serial_no |
| `x_studio_repair_normal_without_serial_no` | Repair Normal Without Serial No | boolean | Yes | ticket_id.x_studio_normal_repair_without_serial_no |
| `x_studio_repair_rug` | Repair RUG | boolean | No | ticket_id.x_studio_rug_repair |
| `x_studio_suggested_location_id` | Suggested Return Location | many2one | Yes | ticket_id.x_studio_virtual_location |
| `x_studio_suggested_location_id_1` | Suggested Return Location | many2one | Yes | ticket_id.x_studio_virtual_location_1 |

### x_ Repair Wizard / Reference Models (8)

These are Studio-created custom models (prefixed `x_`) used by the repair workflow:

| Model | Label | Purpose |
|-------|-------|---------|
| `x_mass_produce_serial` | Mass Produce Serial | Batch serial number creation wizard for manufacturing repair items |
| `x_mass_produce_serial_` | Mass Produce Serial Line | Line items for mass produce serial wizard |
| `x_repair_accounts` | Repair Accounts | Holds GL account mappings for repair cost categories |
| `x_repair_reason` | Repair Reason | Master data: Repair reasons (linked to helpdesk ticket and sale.order) |
| `x_repair_reason_custom` | Repair Reason - Customer | Customer-provided reasons for repair (customer perspective) |
| `x_repair_stages` | Repair Stages | Custom repair stage records (used for stage tracking beyond kanban) |
| `x_repair_sub_reason` | Repair Sub Reason | Sub-categories under x_repair_reason |
| `x_account_winbooks_import_wizard` | Account Winbooks import wizard | Accounting import utility (not repair-specific) |

**Note:** The wizard models currently have 0 fields returned from the API (fields may be stored in ir.model.fields without the standard field accessor). Their existence as models is confirmed. Fields for `x_repair_reason`, `x_repair_stages`, `x_repair_sub_reason`, `x_repair_accounts` must be reverse-engineered from usage in computed fields and server action code.

### x_ Model Field References (from usage in code)

**x_repair_reason** — used as `many2many` target in:
- `sale.order.x_studio_repair_reason` (m2m → `x_repair_reason`)
- `project.task.x_studio_repair_reason` (inferred via related chain)

**x_repair_stages** — referenced in stage tracking:
- Likely fields: `name` (char), `sequence` (int), `company_id` (m2o)

**x_repair_accounts** — GL account mapping:
- Likely fields: `name`, `account_id` (m2o → `account.account`), `picking_type` (selection)

**x_consignment_header** — referenced in `stock.picking.x_studio_consignment_no`:
- Fields: `x_studio_custom_clearance_no` (char), `x_studio_supplier_invoice_number` (char)

---

## 12. Module Flow Diagram

The following shows the complete lifecycle of a repair job, mapping which models connect to which, which server actions fire, and which automated actions trigger:

```
STAGE 0: TICKET CREATED (helpdesk.ticket)
  ├─ Fields set: name, partner_id, product_id, lot_id (serial), ticket_type_id
  ├─ x_studio_ticket_type: determines repair path
  │    ├─ "Repair - Under Warranty - RUG" (ticket_type_id=1)
  │    ├─ "Repair - Under Warranty - External not RUG" (ticket_type_id=2)
  │    ├─ "Repair - Not Under Warranty (With Serial No)" (ticket_type_id=3)
  │    └─ "Repair - Not Under Warranty (Without Serial No)" (ticket_type_id=4)
  ├─ AUTO: x_studio_virtual_location / x_studio_source_location pulled from res.users
  ├─ AUTO: x_studio_return_receipt_location pulled from x_studio_virtual_location.x_studio_return_receipt_location
  ├─ AUTOMATED: "JIN-Helpdesk(Repair) Seq.No" → assigns ticket name from ir.sequence (repair.seq)
  ├─ AUTOMATED: "RR - Auto Select Product for RUG Repairs" (on_change: x_studio_serial_no)
  │    → Searches stock.move.line for serial → populates sale_order_id, x_studio_picking_id, product_id, lot_id
  ├─ AUTOMATED: "RR - Auto Populate Repair Location" (on_change: x_studio_return_receipt_location)
  │    → sets x_studio_repair_location = x_studio_return_receipt_location
  └─ SERVER ACTION: "User Location Validation - Helpdesk" → validates user has access to repair warehouse

STAGE 1: stock.picking CREATED (outgoing delivery to customer location)
  ├─ Triggered by: Server Action "RR - Auto Create Repair Serial Nos" or "RR - Auto Create Repair Route"
  ├─ Fields set:
  │    x_studio_created_from_help_ticket = helpdesk.ticket.id
  │    x_studio_helpdesk_ticket_id = helpdesk.ticket.id
  │    picking_type_id = outgoing type from x_studio_return_receipt_location
  │    location_id = user.x_studio_source_location (or _1 for company 2)
  │    location_dest_id = stock.location(usage=customer)
  ├─ stock.move + stock.move.line created with serial (lot_id) if "With Serial No"
  ├─ Transfer immediately validated (state=done)
  ├─ Ticket picking_ids updated: picking_ids [(4, new_picking.id)]
  └─ COMPUTE: x_studio_valid_factory_repair / x_studio_received_at_centre / x_studio_factory_repair
             all computed based on ticket fields

STAGE 2: QUOTATION / sale.order CREATED
  ├─ Linked via: project.task (FSM) → sale_order_id
  ├─ Fields from helpdesk.ticket:
  │    x_studio_quotation_type = "Repair" (auto by server action 1995)
  │    x_studio_order_payment_method = ticket partner.x_studio_payment_method
  ├─ AUTO: "RR - Auto Generate Quotation Type for Repair SOs" fires on create_or_write
  ├─ x_studio_rug_approved = False initially
  ├─ RUG WORKFLOW (if ticket_type_id = 1):
  │    → SA "RR - Request RUG Approval" (multi) fires:
  │         → SA "RR - RUG Approval Request Sent" (write: x_studio_rug_request_sent=True)
  │         → SA "RR - RUG Request Approval - Notify User" (activity)
  │    → Manager runs SA "RR - RUG Approval" → x_studio_rug_approved=True
  │    OR → Manager runs SA "RR - RUG Rejection" → x_studio_rug_rejected=True, prices reset
  └─ repair.order.sale_order_id = this sale.order

STAGE 3: project.task (FSM) CREATED
  ├─ Linked to helpdesk.ticket via ticket.fsm_task_ids (m2m)
  ├─ Linked to sale.order via task.sale_order_id
  ├─ Fields: x_studio_repair_reason (m2m → x_repair_reason)
  ├─ Fields: x_studio_repair_image_01, x_studio_repair_image_02 (binary)
  ├─ Fields: x_studio_warranty_card (binary — required for RUG)
  └─ When task marked done (fsm_done=True):
       → stock.picking.x_studio_fsm_task_done = True (computed)
       → Enables "Dispatch" button on Transfer form

STAGE 4: repair.order CREATED
  ├─ Linked to helpdesk.ticket via repair.order.ticket_id
  ├─ SA "RR - Update SO in RO" → repair.order.sale_order_id = ticket.sale_order_id
  ├─ AUTOMATED: "RR - Notify Customer in RO End - Final"
  │    Trigger: on_create_or_write
  │    → schedules activity when repair is done
  ├─ SA "RR - Add Draft Quotation Confirm Button" → sets x_studio_confirm_draft_quotation=True
  └─ SA "RR - Notify Customer in RO End - Final - 2" → sends email to customer

STAGE 5: REPAIR STAGE TRANSITIONS (via server actions on helpdesk.ticket)
  ├─ "RR - Send to Factory" (ID: 2001)
  │    → Finds stock.location(x_studio_repair_factory_location=True)
  │    → Sets stage_id to "Sent to Factory" (5 or 24)
  │    → Sets x_studio_send_to_factory=True, x_studio_s_shipped_date, _by
  ├─ "RR - Receive at Factory" (ID: 2002)
  │    → Sets stage_id to "Received at Factory" (6 or 25)
  │    → Sets x_studio_receive_at_factory=True, x_studio_f_received_date, _by
  ├─ Diagnosis / Estimation / Approval stages — manual stage changes
  ├─ "RR - Send to Sales Centre" (ID: 2007)
  │    → Sets stage_id "Sent to Sales Centre" (7 or 26)
  └─ "RR - Receive at Sales Centre" (ID: 2006)
       → Sets stage_id "Received at Sales Centre" (8 or 27)

STAGE 6: stock.return.picking (RETURN WIZARD)
  ├─ Wizard opened from Validated delivery (stock.picking state=done)
  ├─ Studio Fields:
  │    x_studio_repair_rug (related: ticket_id.x_studio_rug_repair)
  │    x_studio_repair_normal_with_serial_no (related: ticket_id.x_studio_normal_repair_with_serial_no)
  │    x_studio_repair_normal_without_serial_no
  │    x_studio_suggested_location_id (related: ticket_id.x_studio_virtual_location)
  │    x_studio_suggested_location_id_1 (related: ticket_id.x_studio_virtual_location_1)
  ├─ AUTOMATED: "RR - Auto Select Product for RUG Repairs-3" (on_create_or_write)
  │    → Validates return location equals suggested location
  │    → Raises UserError if mismatch (company-aware)
  ├─ SA "RR - RUG Return from Help desk" (ID: 1997)
  │    → Validates virtual & source locations on user
  │    → Creates new stock.picking (incoming return receipt)
  │    → Creates stock.move + stock.move.line with serial
  │    → Updates ticket.picking_ids
  └─ SA "RR - Auto Select Product for RUG Repairs-3" validates at save time

STAGE 7: INVOICE (account.move)
  ├─ Linked via: sale.order.invoice_ids
  ├─ stock.picking computed fields:
  │    x_studio_repair_payment_made:
  │         Credit payment method → True immediately
  │         RUG approved → True
  │         Otherwise: checks account.payment linked to SO or invoice payment_state
  └─ x_studio_cash_full_payment_made:
         Cash payment method → checks all invoices not fully paid
         Other → checks if invoices exist

STAGE 8: PAYMENT
  ├─ account.payment with x_studio_sales_order = sale.order
  ├─ Checked in x_studio_repair_payment_made compute
  ├─ x_studio_fully_paid_so on helpdesk.ticket → propagated via related field to stock.picking
  └─ When paid: "Dispatch" button on Transfer becomes available (payment gate lifted)

STAGE 9: HANDOVER
  ├─ SA "RR - Receive at Sales Centre" sets stage to "Received at Sales Centre"
  ├─ Manual stage change to "Handed Over to Customer" (stage_id=13 or 32)
  ├─ SA "Send Repair Customer Letter" (ID: 2269)
  │    → Validates stage_id == 13
  │    → Sends mail.template (ID=56) to customer
  │    → Posts chatter message
  └─ x_studio_repair_complete_stage_updated = True marks final completion

CANCEL/REOPEN PATH:
  ├─ SA "RR - Cancel Repair" (ID: 2220)
  │    → Requires x_studio_cancel_reason
  │    → Saves current stage in x_studio_cancelled_stage_id
  │    → Sets stage to "Cancelled" (4 or 23)
  ├─ AUTOMATED: "RR - Validate Cancelled Tickets" (on_unlink)
  │    → Prevents deletion of cancelled tickets
  └─ SA "RR - Reopen Repair" (ID: 2221)
       → Restores stage from x_studio_cancelled_stage_id
       → Sets x_studio_reopen_status = "Reopened"
```

### Key Field Linkages Between Models

| Source Model | Source Field | Links To | Target Field |
|-------------|-------------|---------|-------------|
| helpdesk.ticket | `x_studio_serial_no` | stock.lot | `id` |
| helpdesk.ticket | `sale_order_id` | sale.order | `id` |
| helpdesk.ticket | `fsm_task_ids` | project.task | `id` (m2m) |
| helpdesk.ticket | `picking_ids` | stock.picking | `id` (m2m) |
| helpdesk.ticket | `x_studio_virtual_location` | stock.location | `id` (from res.users) |
| helpdesk.ticket | `x_studio_return_receipt_location` | stock.location | `x_studio_return_receipt_location` |
| stock.picking | `x_studio_created_from_help_ticket` | helpdesk.ticket | `id` |
| stock.picking | `x_studio_helpdesk_ticket_id` | helpdesk.ticket | `id` |
| stock.picking | `x_studio_ticket_sales_order` | sale.order | via ticket.x_studio_sale_order |
| stock.return.picking | `ticket_id` | helpdesk.ticket | `id` |
| stock.return.picking | `x_studio_suggested_location_id` | stock.location | via ticket virtual_location |
| sale.order | `x_studio_rug_approved` | (approval flag) | - |
| sale.order | `x_studio_repair_reason` | x_repair_reason | via task relation |
| repair.order | `ticket_id` | helpdesk.ticket | `id` |
| repair.order | `sale_order_id` | sale.order | set by SA 1979 |
| res.users | `x_studio_virtual_location` | stock.location | `id` |
| res.users | `x_studio_source_location` | stock.location | `id` |
| stock.location | `x_studio_repair_factory_location` | (boolean flag) | - |
| stock.location | `x_studio_return_receipt_location` | stock.location | self-referential |
| stock.location | `x_studio_users_stock_location` | res.users | m2m |

---
## 13. Developer Checklist — What to Build

Based on all data in this document and the main developer package.

### Python Files Needed

```
models/
├── __init__.py
├── repair_stages.py
│     _name = "x.repair.stages"  (maps to x_repair_stages)
│     Fields: name (Char, required), sequence (Int), company_id (m2o res.company),
│              active (Boolean, default=True)
│     _order = "sequence, id"
│
├── repair_reason.py
│     _name = "x.repair.reason"  (maps to x_repair_reason)
│     Fields: name (Char, required), active (Boolean)
│     Used by: helpdesk.ticket (m2m), sale.order (m2m via task related),
│              project.task (m2m)
│
├── repair_sub_reason.py
│     _name = "x.repair.sub.reason"
│     Fields: name (Char), reason_id (m2o → x.repair.reason), active (Boolean)
│
├── repair_reason_custom.py
│     _name = "x.repair.reason.custom"
│     Fields: name (Char, required) — customer-reported reason
│
├── repair_accounts.py
│     _name = "x.repair.accounts"
│     Fields: name (Char), account_id (m2o account.account),
│              picking_type_code (Selection: incoming/outgoing/internal)
│
├── helpdesk_ticket.py
│     _inherit = "helpdesk.ticket"
│     Fields: (107 x_studio_ fields from Studio — must be replicated as proper _inherit fields)
│     Key fields:
│       x_studio_serial_no → Many2one(stock.lot)
│       x_studio_virtual_location → Many2one(stock.location)
│       x_studio_source_location → Many2one(stock.location)
│       x_studio_virtual_location_1 → Many2one(stock.location) [company 2]
│       x_studio_source_location_1 → Many2one(stock.location) [company 2]
│       x_studio_return_receipt_location → Many2one(stock.location, related=...)
│       x_studio_repair_location → Many2one(stock.location)
│       x_studio_sale_order → Many2one(sale.order)
│       x_studio_rug_repair, x_studio_rug_confirmed, x_studio_rug_approved
│       x_studio_normal_repair_with_serial_no, x_studio_normal_repair_without_serial_no
│       x_studio_job_location (Selection: Centre Repair, Factory Repair)
│       x_studio_quick_repair_status (Selection: Quick Repair, ...)
│       x_studio_cancelled, x_studio_reopened, x_studio_cancel_reason
│       x_studio_cancelled_stage_id → Many2one(helpdesk.stage)
│       x_studio_repair_complete_stage_updated (Boolean)
│       x_studio_fully_paid_so (Boolean, computed)
│       x_studio_task_status (Boolean, computed)
│       x_studio_user_location_validation (Boolean, computed)
│       x_studio_send_to_factory, x_studio_receive_at_factory
│       x_studio_send_to_centre, x_studio_receive_at_centre
│       x_studio_f_received_date, x_studio_f_shipped_date
│       x_studio_s_received_date, x_studio_s_shipped_date
│       x_studio_repair_serial_created (Boolean)
│       x_studio_picking_id → Many2one(stock.picking)
│       x_studio_pick_id → Many2one(stock.picking)
│     Methods:
│       _compute_fully_paid_so()
│       _compute_task_status()
│       _compute_user_location_validation()
│       action_send_to_factory()  [wraps server action 2001]
│       action_receive_at_factory()  [wraps SA 2002]
│       action_send_to_sales_centre()  [wraps SA 2007]
│       action_receive_at_sales_centre()  [wraps SA 2006]
│       action_cancel_repair()  [wraps SA 2220]
│       action_reopen_repair()  [wraps SA 2221]
│       action_auto_create_repair_route()  [wraps SA 1993]
│       action_auto_create_repair_serial()  [wraps SA 1994]
│       action_send_customer_letter()  [wraps SA 2269]
│       action_change_type_to_rug()  [wraps SA 2159]
│
├── stock_picking.py
│     _inherit = "stock.picking"
│     Fields:
│       x_studio_created_from_help_ticket → Many2one(helpdesk.ticket)
│       x_studio_helpdesk_ticket_id → Many2one(helpdesk.ticket)
│       x_studio_ticket_sales_order → Many2one(sale.order, related=x_studio_helpdesk_ticket_id.x_studio_sale_order)
│       x_studio_factory_repair (Boolean, computed from ticket)
│       x_studio_received_at_centre (Boolean, computed from ticket)
│       x_studio_valid_factory_repair (Boolean, computed)
│       x_studio_fsm_task_done (Boolean, computed)
│       x_studio_fully_paid_so (Boolean, computed)
│       x_studio_cash_full_payment_made (Boolean, computed)
│       x_studio_repair_payment_made (Boolean, computed)
│       x_studio_valid_transfer_lines (Boolean, computed)
│       x_studio_need_approval (Boolean, computed)
│       x_studio_user_location_validation (Boolean, computed)
│       x_studio_transfer_approval, _approved, _rejected, _request_sent (Boolean, stored)
│       x_studio_repair_return_location (Boolean, related=location_dest_id.x_studio_repair_return_location)
│       x_studio_return_receipt_location (Many2one, related=location_dest_id.x_studio_return_receipt_location)
│       x_studio_cancelled (Boolean, related=x_studio_created_from_help_ticket.x_studio_cancelled)
│       x_studio_task_status (Boolean, related=x_studio_helpdesk_ticket_id.x_studio_task_status)
│     Methods:
│       _compute_valid_factory_repair()  — also sets factory_repair, received_at_centre, picking_count
│       _compute_fsm_task_done()
│       _compute_fully_paid_so()
│       _compute_cash_full_payment_made()
│       _compute_repair_payment_made()
│       _compute_valid_transfer_lines()
│       _compute_need_approval()
│       _compute_user_location_validation()
│
├── stock_return_picking.py
│     _inherit = "stock.return.picking"
│     Fields:
│       x_studio_repair_rug (Boolean, related=ticket_id.x_studio_rug_repair)
│       x_studio_repair_normal_with_serial_no (Boolean, related=ticket_id.x_studio_normal_repair_with_serial_no)
│       x_studio_repair_normal_without_serial_no (Boolean, related=ticket_id.x_studio_normal_repair_without_serial_no)
│       x_studio_suggested_location_id (Many2one, related=ticket_id.x_studio_virtual_location)
│       x_studio_suggested_location_id_1 (Many2one, related=ticket_id.x_studio_virtual_location_1)
│     Methods:
│       action_rug_return_from_helpdesk()  [wraps SA 1997]
│       _check_rug_repair_location()  [wraps SA 1991 — validate return location]
│
├── stock_location.py
│     _inherit = "stock.location"
│     Fields:
│       x_studio_repair_factory_location (Boolean)
│       x_studio_repair_return_location (Boolean)
│       x_studio_return_receipt_location (Many2one → stock.location)
│       x_studio_return_sequence (Many2one → ir.sequence)
│       x_studio_temp_location (Boolean)
│       x_studio_users_internal_transfer (Many2many → res.users)
│       x_studio_users_stock_location (Many2many → res.users)
│       x_studio_many2many_field_7kpUe (Many2many → res.users, cell visibility)
│       x_studio_finished_good_location (Boolean)
│
├── res_users.py
│     _inherit = "res.users"
│     Fields:
│       x_studio_virtual_location (Many2one → stock.location, company 1)
│       x_studio_virtual_location_1 (Many2one → stock.location, company 2)
│       x_studio_source_location (Many2one → stock.location, company 1)
│       x_studio_source_location_1 (Many2one → stock.location, company 2)
│       x_studio_many2many_field_Q50dg (Many2many → stock.location, label: "Inventory Locations")
│       x_studio_many2many_field_bQRSA (Many2many → stock.location, label: "Inventory Locations")
│       x_studio_super_user (Boolean, label: "Super User (All Items)")
│       x_studio_super_user_melt_items (Boolean, label: "Super User (Melt Items)")
│
├── sale_order.py
│     _inherit = "sale.order"
│     Fields:
│       x_studio_rug_approved (Boolean)
│       x_studio_rug_request_sent (Boolean)
│       x_studio_rug_rejected (Boolean)
│       x_studio_rug_confirmed (Boolean, related=task_id.helpdesk_ticket_id.x_studio_rug_confirmed)
│       x_studio_fsm_done (Boolean, computed, depends=x_studio_quotation_type)
│       x_studio_authorized_repair_user (Boolean, computed, depends=task_id)
│       x_studio_repair_reason (Many2many → x_repair_reason, related=task_id.x_studio_repair_reason)
│       x_studio_warranty_card (Binary, related=task_id.x_studio_warranty_card)
│       x_studio_repair_image_01, _02 (Binary, related=task_id...)
│       x_studio_repair_validation (Char)
│       x_studio_locked, x_studio_unlocked (Boolean, tracked by automations)
│       x_studio_re_estimate_count, _re_estimate_request_count_1 (Int)
│     Methods:
│       _compute_fsm_done()
│       _compute_authorized_repair_user()
│       action_request_rug_approval()  [multi → 1983 + 1985]
│       action_rug_approval()  [write: 1981]
│       action_rug_rejection()  [code: 2004]
│       action_track_lock_status()  [automation hooks]
│
└── repair_order.py
      _inherit = "repair.order"
      Fields:
        x_studio_confirm_draft_quotation (Boolean)
      Methods:
        action_update_so()  [wraps SA 1979 — syncs sale_order_id from ticket]
        action_notify_customer()  [wraps SA 1820 — sends email]
```

### XML View Files Needed

```
views/
├── helpdesk_ticket_views.xml  — Full custom form, list, kanban views for helpdesk.ticket
├── helpdesk_ticket_form_header_buttons.xml  — Stage-transition buttons (Send to Factory, Receive, etc.)
├── stock_picking_views.xml  — Inherits stock.picking.form, adds Dispatch/Return buttons and repair fields
├── stock_return_picking_views.xml  — Inherits return wizard views, adds suggested location + RUG button
├── stock_picking_type_views.xml  — Adds movement_journal / mj_in / mj_out to operation type form
├── stock_location_views.xml  — Adds repair flags and user access fields to location form
├── res_users_views.xml  — Adds virtual/source location fields and super_user flags to user form
├── sale_order_views.xml  — Adds RUG approval buttons and repair fields to SO form
├── repair_order_views.xml  — Adds confirm_draft_quotation button to repair form
├── repair_stages_views.xml  — CRUD views for x.repair.stages
├── repair_reason_views.xml  — CRUD views for x.repair.reason
├── repair_sub_reason_views.xml  — CRUD views for x.repair.sub.reason
├── repair_reason_custom_views.xml  — CRUD views for x.repair.reason.custom
├── repair_accounts_views.xml  — CRUD views for x.repair.accounts
└── menus.xml  — Menu items for repair configuration
```

### Security Files

```
security/
├── ir.model.access.csv  — Must include access rules for all these models:
│     x.repair.stages — full admin, read for repair users
│     x.repair.reason — full admin, read for all
│     x.repair.sub.reason — full admin, read for all
│     x.repair.reason.custom — full admin, read for all
│     x.repair.accounts — full admin, read-only for repair users
│     helpdesk.ticket — inherits from helpdesk module (see Section 7 access rights)
│     stock.picking — inherits from stock module (see Section 7)
│     stock.return.picking — inherits from stock module
│     stock.location — inherits from stock module
│
└── security.xml  — Record rules for repair domain:
      Repair tickets: company-based multi-company record rule
      Stock locations: user-based visibility (x_studio_users_stock_location)
      Transfers: user-location-based access validation (replicates computed field logic)
```

### Data Files

```
data/
├── repair_stages_data.xml  — Master stage data matching production stages:
│     Company 1 (Jinasena Pvt Ltd): New, Sent to Factory, Received at Factory, Diagnosis,
│       Estimation Sent, Estimation Approval Received, Advance Received, Repair Started,
│       Repair Completed, Sent to Sales Centre, Received at Sales Centre,
│       Handed Over to Customer, Cancelled, On Hold
│     Company 2 (JAM): Same set with different IDs
│
├── repair_reason_data.xml  — Seed repair reason records
├── helpdesk_team_data.xml  — Configure "Customer Care - Repair" team (use_fsm=True, use_product_returns=True)
├── mail_alias_data.xml  — support@, customer-care-repair@, customer-care-repair-jld@ aliases
├── ir_sequence_data.xml  — repair.seq, repair.serial.seq sequences
├── activity_types_data.xml  — "Handle Ticket" activity type for helpdesk.ticket
└── report_actions_data.xml  — 11 report actions (C09–C19) linked to repair.order and helpdesk.ticket
```

### Key _inherit Declarations

| Model | _inherit | Key Additions |
|-------|---------|---------------|
| x.repair.stages | (new model) | name, sequence, company_id |
| x.repair.reason | (new model) | name, active |
| x.repair.sub.reason | (new model) | name, reason_id |
| x.repair.accounts | (new model) | name, account_id, picking_type_code |
| helpdesk.ticket | helpdesk.ticket | 30+ repair fields, 10 stage transition methods |
| stock.picking | stock.picking | 20 repair fields, 8 computed fields |
| stock.return.picking | stock.return.picking | 5 Studio fields, 2 custom methods |
| stock.location | stock.location | 9 repair configuration fields |
| res.users | res.users | 8 repair-location assignment fields |
| sale.order | sale.order | 11 repair fields, RUG workflow methods |
| repair.order | repair.order | x_studio_confirm_draft_quotation + SO sync method |

### External Dependencies (manifest depends)

```python
depends = [
    'helpdesk',            # Core helpdesk.ticket model
    'helpdesk_timesheet',  # Timesheets on tickets (report 3036)
    'helpdesk_fsm',        # FSM tasks on helpdesk tickets (use_fsm=True on team)
    'helpdesk_sale',       # sale_order_id on helpdesk.ticket
    'repair',              # repair.order model
    'sale',                # sale.order model
    'sale_management',     # sale.order state management
    'stock',               # stock.picking, stock.location, stock.lot
    'project',             # project.task (FSM)
    'industry_fsm',        # FSM done button and fsm_done field on project.task
    'account',             # account.move, account.payment
    'maintenance',         # maintenance.request (x_studio_maintenance_request_ field)
    'website_helpdesk',    # Portal helpdesk templates (Section 10)
    'website_helpdesk_form', # Ticket submit form on website
    'mail',                # mail.template for customer letter (SA 2269)
]
```

### Important Implementation Notes

1. **Multi-Company Architecture**: All stage transitions and stock operations are company-aware. Company 1 = Jinasena (Pvt) Ltd (id=1), Company 2 = JAM (id=2). Every server action checks `env.context.get("allowed_company_ids")` and uses different stage IDs and operation types per company. This must be replicated in Python methods using `self.env.company` rather than hardcoded IDs.

2. **Dual Helpdesk Link on stock.picking**: The system uses BOTH `x_studio_created_from_help_ticket` AND `x_studio_helpdesk_ticket_id` pointing to the same `helpdesk.ticket`. All computed fields check both fields with `or` logic. In a clean module, consolidate to one field or maintain backward compatibility by keeping both.

3. **Location Validation is User-Specific**: `x_studio_user_location_validation` on stock.picking is a computed field that checks whether the currently logged-in user (`self._uid`) has the destination location in their `x_studio_users_stock_location` or `x_studio_users_internal_transfer` list. This requires the compute to use `self.env.user` carefully in `@api.depends` — it depends on `x_studio_type_of_operation`.

4. **Serial Number Creation Flow**: For "With Serial No" repairs, the server action creates a new `stock.lot` with sequence `repair.serial.seq`, creates an outgoing `stock.picking` in **done** state (not just confirmed), creates `stock.move` + `stock.move.line` all in one transaction. This means no separate validation step — the transfer is immediately done at ticket creation.

5. **RUG Workflow (Replacement Under Guarantee)**: RUG requires a `warranty_card` binary on the task. The SA `RR - Change Repair Type to RUG` (ID: 2159) resets all SO line prices to `standard_price`, stores originals in `x_studio_price_unit_original`, and changes `ticket_type_id` to 1. RUG rejection restores original prices. This whole price manipulation must be tracked carefully.

6. **Return Location Validation**: The `stock.return.picking` wizard validates that `location_id` equals the `x_studio_suggested_location_id` (company 1) or `x_studio_suggested_location_id_1` (company 2). Both are related fields pointing back to `ticket_id.x_studio_virtual_location`. The wizard form shows only the relevant field based on `company_id`. The standard `create_returns` button is augmented with a "Return" button that runs the RUG-specific SA.

7. **Stage Tracking Timestamps**: Every stage transition records: date (`x_studio_X_shipped/received_date`), user (`x_studio_X_shipped/received_by`), and sequence tracking (`x_studio_created_by_N`, `x_studio_created_on_N`). There are 10+ audit timestamp fields per direction of movement. These must be implemented as Many2one(res.users) and Datetime stored fields.

8. **Repair Payment Gate on Dispatch Button**: The Dispatch button on stock.picking is invisible unless ALL of these conditions are true: `state == done`, `x_studio_fsm_task_done == True`, `x_studio_fully_paid_so == True` (or Credit payment), `x_studio_cash_full_payment_made == False`, `x_studio_picking_count == False` (not already dispatched), `x_studio_cancelled == False`. The invisibility condition in the view is a complex nested expression (see Section 3 view XML).

9. **Sequence Configuration**: Two key IR sequences are needed: `repair.seq` (format: REP/YYYY/MMDD/NNNNN) for ticket names assigned by automation, and `repair.serial.seq` (format: RS/COMPANY/NNNNNN) for serial numbers auto-created without physical serial. The sequence code must match exactly what the server actions reference.

10. **Operation Type Lookup**: The server actions search for `stock.picking.type` by `default_location_src_id` or `default_location_dest_id` combined with `name` ("Returns" for company 1, "Receipts" for company 2) and `code`. This means the picking types must be correctly configured in the destination database — the module should validate this in a `post_init_hook`.

11. **ir.sequence for Ticket Names**: The automation "JIN-Helpdesk(Repair) Seq.No" assigns names only when `record.name == "New"`. This means the standard Odoo helpdesk sequence must be overridden or disabled for repair tickets, otherwise they get double-named. The module needs a `@api.model_create_multi` override in `helpdesk.ticket`.

12. **11 Report Templates (C09–C19)**: These are distinct PDF reports for the repair lifecycle:
    - C09: Repair Receipt (initial intake document)
    - C10: Repair Estimate (diagnosis + cost estimate)
    - C11: Repair Quotation (formal quote to customer)
    - C12: Repair Invoice (payment demand)
    - C13: Repair AOD (Advice of Dispatch)
    - C14: Ready for Collection letter
    - C15: Final Notice
    - C16: Final Notice – Estimated
    - C17: Final Notice – Scrappage
    - C18: Final Notice – Estimated Scrappage
    - C19: Reminder (Repair reminding letter)
    Each exists as both a `repair.order` report and a `helpdesk.ticket` report pointing to the same QWeb template.

13. **Re-estimate Workflow**: When a repair estimate needs to be revised, `sale.order` has: `x_studio_re_estimate_request_sent` (bool), `x_studio_re_estimate_request_count_1` (int), `x_studio_locked` / `x_studio_unlocked` flags, and `x_studio_re_estimate_count`. Automations track lock status transitions: `done` → locked, `sale + locked` → unlocked. SA 2246 increments the re-estimate counter.

14. **Cancel/Reopen State Machine**: Cancelled tickets are blocked from deletion by automation ID 201 (`on_unlink` trigger). The `x_studio_cancelled_stage_id` stores the previous stage so reopen restores it exactly. The `x_studio_reopen_status = "Reopened"` field is Char, not Boolean — must match this type in `_inherit`.

15. **Smart Buttons on res.users**: The user form shows "Stock Locations" and "Internal Locations" smart buttons (via `x_x_studio_users_stock_location_stock_location_count` and `x_x_studio_users_internal_transfer_stock_location_count` integer computed fields on `stock.location`). These are reverse-computed counts: for a user, count how many locations have them in the m2m list.

---

*Document generated from live production database data. All field IDs, view arches, server action codes, and automation rules are as exported from the source system.*