# Repair & Helpdesk — Developer Package

> Source: Clear_DB Staging | Odoo 17.0 Enterprise | Captured: 2026-05-12

---

## 1. Module Dependencies (`__manifest__.py`)

All modules this custom module must depend on, based on installed modules in the system.

```python
'depends': [
    'project',  # Project v17.0.1.3
    'web_studio',  # Studio v17.0.1.0
    'helpdesk',  # Helpdesk v17.0.1.6
    'mail',  # Discuss v17.0.1.15
    'industry_fsm',  # Field Service v17.0.1.0
    'repair',  # Repairs v17.0.1.0
    'base_automation',  # Automation Rules v17.0.1.0
    'base_setup',  # Initial Setup Tools v17.0.1.0
    'helpdesk_fsm',  # Helpdesk FSM v17.0.1.0
    'helpdesk_repair',  # Helpdesk Repair v17.0.1.0
    'helpdesk_sale',  # Helpdesk After Sales v17.0.1.0
    'helpdesk_stock',  # Helpdesk Stock v17.0.1.0
    'helpdesk_timesheet',  # Helpdesk Timesheet v17.0.1.0
]
```

### 1.1 Full Installed Module List (repair/helpdesk related)

| Module | Short Description | Version |
|--------|------------------|---------|
| `project` | Project | 17.0.1.3 |
| `web_studio` | Studio | 17.0.1.0 |
| `helpdesk` | Helpdesk | 17.0.1.6 |
| `mail` | Discuss | 17.0.1.15 |
| `industry_fsm` | Field Service | 17.0.1.0 |
| `repair` | Repairs | 17.0.1.0 |
| `base_automation` | Automation Rules | 17.0.1.0 |
| `base_setup` | Initial Setup Tools | 17.0.1.0 |
| `helpdesk_fsm` | Helpdesk FSM | 17.0.1.0 |
| `helpdesk_repair` | Helpdesk Repair | 17.0.1.0 |
| `helpdesk_sale` | Helpdesk After Sales | 17.0.1.0 |
| `helpdesk_stock` | Helpdesk Stock | 17.0.1.0 |
| `helpdesk_timesheet` | Helpdesk Timesheet | 17.0.1.0 |

### 1.2 Additional Installed Modules (context)

| Module | Short Description | Version |
|--------|------------------|---------|
| `helpdesk` | Helpdesk | 17.0.1.6 |
| `repair` | Repairs | 17.0.1.0 |
| `helpdesk_holidays` | Helpdesk Time Off | 17.0.1.0 |
| `website_helpdesk` | Website Helpdesk | 17.0.1.0 |
| `website_helpdesk_forum` | Helpdesk: Help Center | 17.0.1.0 |
| `website_helpdesk_livechat` | Website IM Livechat Helpdesk | 17.0.1.0 |
| `website_helpdesk_slides` | Website Slides Helpdesk | 17.0.1.0 |
| `Fix-repair` | Fix Repair | 17.0.1.0.0 |
| `helpdesk_account` | Helpdesk Account | 17.0.1.0 |
| `helpdesk_fsm` | Helpdesk FSM | 17.0.1.0 |
| `helpdesk_fsm_report` | Helpdesk FSM Reports | 17.0.1.0 |
| `helpdesk_fsm_sale` | Helpdesk FSM - Sale | 17.0.1.0 |
| `helpdesk_repair` | Helpdesk Repair | 17.0.1.0 |
| `helpdesk_sale` | Helpdesk After Sales | 17.0.1.0 |
| `helpdesk_sale_timesheet` | Sell Helpdesk Timesheet | 17.0.1.0 |
| `helpdesk_sms` | Helpdesk - SMS | 17.0.1.0 |
| `helpdesk_stock` | Helpdesk Stock | 17.0.1.0 |
| `helpdesk_stock_account` | Helpdesk Stock Account | 17.0.1.0 |
| `helpdesk_timesheet` | Helpdesk Timesheet | 17.0.1.0 |
| `mrp_repair` | Mrp Repairs | 17.0.1.0 |
| `project_helpdesk` | Project Helpdesk | 17.0.1.0 |
| `spreadsheet_dashboard_helpdesk` | Spreadsheet dashboard for helpdesk | 17.0.1.0 |
| `website_helpdesk_knowledge` | Helpdesk Knowledge | 17.0.1.0 |
| `website_helpdesk_slides_forum` | Website Slides Forum Helpdesk | 17.0.1.0 |

---

## 2. Email Templates

Total: 17 templates

### Template ID 45: Field Service: Intervention Scheduled

- **Model**: `project.task`
- **Subject**: `Your intervention is scheduled {{ object.planned_date_begin and object.date_deadline and 'from the ' + format_datetime(object.planned_date_begin, tz=object.partner_id.tz, lang_code=object.partner_id.lang) + ' to the ' + format_datetime(object.date_deadline, tz=object.partner_id.tz, lang_code=object.partner_id.lang) or '' }}`
- **email_to**: `-`
- **email_from**: `-`
- **lang**: `{{ object.partner_id.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<div>
    <t t-set="date_begin" t-value="format_datetime(object.planned_date_begin, tz=object.partner_id.tz, lang_code=object.partner_id.lang)"></t>

    <t t-set="date_end" t-value="format_datetime(object.date_deadline, tz=object.partner_id.tz, lang_code=object.partner_id.lang)"></t>

    Dear <t t-out="object.partner_id.name or 'customer'">customer</t>,<br><br>
    <t t-if="date_begin and date_end">
        Your <t t-out="object.name or ''">Boiler maintenance</t> intervention is scheduled from the <t t-out="date_begin or ''">05/31/2021 12:30:00</t> to the <t t-out="date_end or ''">05/31/2021 14:30:00</t>.
    </t>
    <t t-else="">
        Your <t t-out="object.name or ''">Boiler maintenance</t> intervention is scheduled.
    </t>
    <br><br>
    Best regards,
    <t t-if="user.signature">
        <br>
        <t t-out="user.signature or ''">--<br>Mitchell Admin</t>
    </t>
</div>
        
```

### Template ID 60: RR- Customer Repair Letter - Test

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `-`
- **email_from**: `-`
- **lang**: `{{ object.partner_id.lang }}`
- **auto_delete**: `False`

**Body HTML:**
```html
<div style="margin: 0px; padding: 0px;">
    <p style="box-sizing:border-box;margin: 0px; padding: 0px; font-size: 13px;">
        <t t-assign="variable1" t-value="variable1"></t>
        <t t-assign="variable2" t-value="variable2"></t>

        </p><div>
            <!-- Use the variables in the content section -->
            <p style="margin:0px 0 12px 0;box-sizing:border-box;"><br></p><p style="margin:0px 0 12px 0;box-sizing:border-box;">{{ <a href="https://object.partner_id.active" style="text-decoration:none;box-sizing:border-box;background-color:transparent;color:#008f8c;">object.partner_id.active</a> }}<br></p><p style="margin:0px 0 12px 0;box-sizing:border-box;">Hello <span t-esc="variable1"></span></p>
            <p style="margin:0px 0 12px 0;box-sizing:border-box;">Your email is: <span t-esc="variable2"></span></p>
        </div>
        
    <p style="margin:0px 0 12px 0;box-sizing:border-box;"></p>
</div>
```

### Template ID 63: RR- Customer Repair Letter - Test2

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `-`
- **email_from**: `-`
- **lang**: `{{ object.partner_id.lang }}`
- **auto_delete**: `False`

**Body HTML:**
```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer :<t t-out="object.partner_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

### Template ID 64: RR- Customer Repair Letter - Test3

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `-`
- **email_from**: `-`
- **lang**: `{{ object.partner_id.lang }}`
- **auto_delete**: `False`

**Body HTML:**
```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer :<t t-out="object.partner_id.display_name" style="box-sizing:border-box;"> </t> Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

### Template ID 71: RR- Customer Repair Letter - Test4

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `-`
- **email_from**: `-`
- **lang**: `{{ object.partner_id.lang }}`
- **auto_delete**: `False`

**Body HTML:**
```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer :<t t-out="object.fsm_task_count.sale_order_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true"> </t> Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

### Template ID 56: Repair - Customer Letter

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ object._rating_get_operator().email_formatted }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer Name :<t t-out="object.partner_id.display_name" style="box-sizing:border-box;"> </t> </p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;">
Dear Sir/Madam ,
</p><p style="box-sizing:border-box;margin-bottom: 0px;">  
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;">
We have pleasure in advising you that the <t t-out="object.product_id.display_name" style="box-sizing:border-box;"> </t> pumping unit sent to us for repairs is now is ready for collection.
(IF THIS UNIT IS NOT COLLECTED WITHIN 2 WEEKS OF LETTER STORAGE CHARGE OF RS 15/- PER DAY WILL BE LEVIED.)</p><p style="caret-color:#37352f;position:relative;box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">  
 </p><p style="box-sizing:border-box;margin-bottom: 0px;">

The balance due Rs. <t t-out="object.x_studio_balance_due" style="box-sizing:border-box;"> </t> should be paid in cash prior to collection (IF PAYMENT IS MADE BY CHEQUE, THE PUMP CAN BE COLLECTED ONLY ON REALIZATION OF THE CHEQUE)&nbsp;</p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">When calling to make final payment and collecting the pump our reservation deposit number and our machinery report number <t t-out="object.display_name" style="box-sizing:border-box;"> </t>  must be surrendered. (IF EITHER OR BOTH OF RECEIPTS ARE LOST, OT CANNOT BE SURRENDERED, AN AFFIDAVIT MUST BE SUBMITTED.)&nbsp;</p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">If the pump is to be handed over to a representative, please send through him/her letter authorizing us to hand over the pump to him/her. His/her specimen signature and national identity card should be certified by you.&nbsp;</p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">Assuring your of our best attention&nbsp;</p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">Yours faithfully,

</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

### Template ID 59: Repair - Customer Letter - 2

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ object._rating_get_operator().email_formatted }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<div>
    <t t-set="access_token" t-value="object._rating_get_access_token()">

<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Dear&nbsp;</span>Madam/Sir<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">,</span><br><br><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Your request&nbsp;</span>&nbsp;<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">has been received and is being reviewed by our&nbsp;</span>Table legs are unbalanced<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">&nbsp;team. The reference of your ticket is&nbsp;</span>15<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">.</span><br><a style="text-decoration:none;box-sizing:border-box;background-color:transparent;color:inherit;">View the ticket</a><br><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">To add additional comments, reply to this email.</span><br><br><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Thank you,</span><br><br>Helpdesk<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">&nbsp;Team.</span>

<br></t><t t-set="access_token" t-value="object._rating_get_access_token()"></t><t t-set="partner" t-value="object._rating_get_partner()"></t><t t-set="access_token" t-value="object._rating_get_access_token()"></t><t t-set="access_token" t-value="object._rating_get_access_token()"></t></div>
```

### Template ID 66: Repair - Final Notice

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ object._rating_get_operator().email_formatted }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<p style="margin:0px 0 12px 0;box-sizing:border-box;">

<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Customer Name : <t t-out="object.partner_id.display_name" style="box-sizing:border-box;"> </t></span></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff"></span><span style="color: #000000;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">REPAIRS TO&nbsp; <t t-out="object.product_id.display_name" style="box-sizing:border-box;"> </t> PUMP - FINAL NOTICE</span><br><br>Dear Sir/Madam ,<br><span style="font-size: 13px">We refer to the <span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">"CENTRIC"</span>

type&nbsp;</span>pumping unit No&nbsp;<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff"><t t-out="object.product_id.display_name" style="box-sizing:border-box;"> </t></span>

&nbsp;repaired on the above references and job number. We note that you have not responded to our email dated&nbsp; <t t-out="object.x_studio_created_on_8" style="box-sizing:border-box;"> </t> and requesting you to collect same.<br><br><br>Since we are unable to store this pumping unit any longer, we must finally request you to make payment of Rs. <t t-out="object.x_studio_balance_due" style="box-sizing:border-box;"> </t><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">&nbsp;</span>in cash and remove same from our workshop within 2 weeks of this letter. (PLEASE NOTE THAT A STORAGGE CHARGE OF RS 15/- PER DAY WILL BE LEVIED FROM <t t-out="object.x_studio_created_on_8" style="box-sizing:border-box;"> </t> IN ADDITION TO THE REPAIR CHARGE. )<br><br>When calling to make final payment and collecting the pump our reservation deposit receipt number <t t-out="object.name" style="box-sizing:border-box;"> </t> &nbsp; OR BOTH OF THESE RECEIPTS ARE LOST, OR CANNOT BE SURRENDERED AN AFFIDAVIT MUST BE SUBMITTED. )<br><br><br>If the pump is to be handed over to a representative, please send through him a letter authorizing us to hand over the pump to him/her. His/her specimen signature and national identity card number should be certified by you.<br><br>If the pump is not collected within 2 weeks of this letter, it will be considered to be abandoned and will be destroyed.<br>Yours faithfully,<br><span style="font-size: 13px"><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br>Jinasena Ltd</strong></span><br><br><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br><br><br>Repairs Department</strong>

<br></p>
```

### Template ID 67: Repair - Final Notice - Estimated

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ object._rating_get_operator().email_formatted }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<p style="margin:0px 0 12px 0;box-sizing:border-box;">

<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Customer Name : <t t-out="object.partner_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t></span></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff"></span><span style="color: #000000;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">CENTRIC PUMPS HANDED IN FOR REPAIRS - FINAL NOTICE</span><br><br>Dear Sir/Madam ,</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><br>We refer to the "CENTRIC" type <t t-out="object.product_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> given to us for repairs and our quotation dated <t t-out="object.x_studio_sale_order.create_date" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> .It is noted with regret that you have not responded to this quotation to date. We now wish to inform you that this quotation is no longer valid and e are not in a position to store this pump in our stores.<br></p><p style="margin:0px 0 12px 0;box-sizing:border-box;">Due to limited space we have, we must make an urgent request to you, to make necessary arrangements to collect same within 10 days of this e-mail, in which event, we shall not be responsible for this item after the stipulated time period.</p><p style="margin:0px 0 12px 0;box-sizing:border-box;">When calling to collect same, please ensure to produce the repair receipt issued to you at the time the pump was handed over to us.&nbsp;&nbsp;<br><br><br><br>Yours faithfully,<br><span style="font-size: 13px"><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br>Jinasena Ltd</strong></span><br><br><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br><br><br>Repairs Department</strong>

<br></p>
```

### Template ID 69: Repair - Final Notice - Scrappage

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ object._rating_get_operator().email_formatted }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer Name :<t t-out="object.partner_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> </p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;">NOTICE OF SCRAPPAGE</p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">Dear Sir/Madam ,
</p><p style="box-sizing:border-box;margin-bottom: 0px;">  
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">We refer to the "CENTRIC" type <t t-out="object.product_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> &nbsp;water pump handed over to us on <t t-out="object.x_studio_created_on_1" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> under the reference number <t t-out="object.name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> and regret to note that in spite of ready for collection notices sent to you on <t t-out="object.create_date" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> &amp; XXXX &amp; XXXX, you have failed to respond positively.</p><p style="box-sizing:border-box;margin-bottom: 0px;"><br>

</p><p style="box-sizing:border-box;margin-bottom: 0px;"><span style="color: #000000;font-size: 13px;font-style: normal;font-weight: 400;background-color: rgba(1, 126, 132, 0.1)"><br></span><span style="box-sizing:border-box;background-color:#f6f6f6;color: #000000; font-size: 13px; font-style: normal; font-weight: 400;" class="bg-o-color-3">We regret to note that continue to ignore our notices and can only assume that you are no longer interested in this pump and accordingly we have scrapped this item.<br><br><br>Therefore, please be informed that we are no longer responsible for this item.</span>

<br></p><p style="box-sizing:border-box;margin-bottom: 0px;"><font class="bg-o-color-3" style="box-sizing:border-box;background-color:#f6f6f6;color:#091124;">​</font></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">Yours faithfully,

</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="caret-color:#37352f;position:relative;margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

### Template ID 70: Repair - Reminding Letter

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ object._rating_get_operator().email_formatted }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<p style="margin:0px 0 12px 0;box-sizing:border-box;">

<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Customer Name : <t t-out="object.partner_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t></span></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">REMINDER</span><br><br>Dear Sir/Madam ,<br><span style="font-size: 13px">We refer to the <span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">"CENTRIC"</span>

type <t t-out="object.product_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable="">&nbsp;</t></span>&nbsp;pumping unit No <t t-out="object.x_studio_serial_no.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> repaired on the above references and job number. We note that you have not responded to our letter dated <t t-out="object.create_date" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t>   and requesting you to collect same.<br><br><br>Due to limited sapce for holding " Awaiting collection pumps " in colombo and therefore we must take an urgent request to you to make necessary arrangements to collect same from our repair department at Colombo.</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><br>When calling to collect please ensure that you have all necessary documents including the repair receipt issued to you at the time the pump was handed over to us.<br><br><br>In the event that the pump is not collected within 10 days of this letter we will be transferring this pump to our warehouse in Ekala and the pump can only be collected by you from our warehouse after making payment (if any) at our colombo office.</p><p style="margin:0px 0 12px 0;box-sizing:border-box;">To avoid the resultant inconvinience to you, plea ensure you pay close attention to this communication.<br><br></p><p style="margin:0px 0 12px 0;box-sizing:border-box;">Yours faithfully,<br><span style="font-size: 13px"><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br>Jinasena Ltd</strong></span><br><br><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br><br><br>Repairs Department</strong>

<br></p>
```

### Template ID 47: Task Report

- **Model**: `project.task`
- **Subject**: `{{ object.name }} Report`
- **email_to**: `{{ (object.partner_id.email_formatted) }}`
- **email_from**: `-`
- **lang**: `{{ object.partner_id.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<p>
                    Dear <t t-out="object.partner_id.name or 'Customer'">Customer</t>,<br/><br/>
                    Please find attached the worksheet of our onsite operation. <br/><br/>
                    Feel free to contact us if you have any questions.<br/><br/>
                    Best regards,<br/><br/>
                </p>
            
```

### Template ID 9: Task: Rating Request

- **Model**: `project.task`
- **Subject**: `{{ object.project_id.company_id.name }}: Satisfaction Survey`
- **email_to**: `-`
- **email_from**: `{{ (object._rating_get_operator().email_formatted if object._rating_get_operator() else user.email_formatted) }}`
- **lang**: `{{ object._rating_get_partner().lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<div>
    <t t-set="access_token" t-value="object._rating_get_access_token()"/>
    <t t-set="partner" t-value="object._rating_get_partner()"/>
    <table border="0" cellpadding="0" cellspacing="0" width="590" style="width:100%; margin:0px auto;">
    <tbody>
        <tr><td valign="top" style="font-size: 13px;">
            <t t-if="partner.name">
                Hello <t t-out="partner.name or ''">Brandon Freeman</t>,<br/><br/>
            </t>
            <t t-else="">
                Hello,<br/><br/>
            </t>
            Please take a moment to rate our services related to the task "<strong t-out="object.name or ''">Planning and budget</strong>"
            <t t-if="object._rating_get_operator().name">
                assigned to <strong t-out="object._rating_get_operator().name or ''">Mitchell Admin</strong>.<br/>
            </t>
            <t t-else="">
                .<br/>
            </t>
        </td></tr>
        <tr><td style="text-align: center;">
            <table border="0" cellpadding="0" cellspacing="0" width="590" summary="o_mail_notification" style="width:100%; margin: 32px 0px 32px 0px;">
                <tr><td style="font-size: 13px;">
                    <strong>Tell us how you feel about our service</strong><br/>
                    <span style="text-color: #888888">(click on one of these smileys)</span>
                </td></tr>
                <tr><td style="font-size: 13px;">
                    <table style="width:100%;text-align:center;margin-top:2rem;">
                        <tr>
                            <td>
                                <a t-attf-href="/rate/{{ access_token }}/5">
                                    <img alt="Satisfied" src="/rating/static/src/img/rating_5.png" title="Satisfied"/>
                                </a>
                            </td>
                            <td>
                                <a t-attf-href="/rate/{{ access_token }}/3">
                                    <img alt="Okay" src="/rating/static/src/img/rating_3.png" title="Okay"/>
                                </a>
                            </td>
                            <td>
                                <a t-attf-href="/rate/{{ access_token }}/1">
                                    <img alt="Dissatisfied" src="/rating/static/src/img/rating_1.png" title="Dissatisfied"/>
                                </a>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            </table>
        </td></tr>
        <tr><td valign="top" style="font-size: 13px;">
            We appreciate your feedback. It helps us to improve continuously.
            <t t-if="object.project_id.rating_status == 'stage'">
                <br/><span style="margin: 0px 0px 0px 0px; font-size: 12px; opacity: 0.5; color: #454748;">This customer survey has been sent because your task has been moved to the stage <b t-out="object.stage_id.name or ''">In progress</b></span>
            </t>
            <t t-if="object.project_id.rating_status == 'periodic'">
                <br/><span style="margin: 0px 0px 0px 0px; font-size: 12px; opacity: 0.5; color: #454748;">This customer survey is sent <b t-out="object.project_id.rating_status_period or ''">Weekly</b> as long as the task is in the <b t-out="object.stage_id.name or ''">In progress</b> stage.</span>
            </t>
        </td></tr>
    </tbody>
    </table>
</div>
            
```

### Template ID 8: Task: Reception Acknowledgment

- **Model**: `project.task`
- **Subject**: `Reception of {{ object.name }}`
- **email_to**: `-`
- **email_from**: `-`
- **lang**: `{{ object.partner_id.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<div>
    Dear <t t-out="object.partner_id.name or 'customer'">Brandon Freeman</t>,<br/>
    Thank you for your enquiry.<br/>
    If you have any questions, please let us know.
    <br/><br/>
    Thank you,
    <t t-if="user.signature">
        <br/>
        <t t-out="user.signature or ''">--<br/>Mitchell Admin</t>
    </t>
</div>
        
```

### Template ID 41: Ticket: Rating Request (requires rating enabled on team)

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.company_id.name or object.user_id.company_id.name or 'Helpdesk' }}: Service Rating Request`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ object._rating_get_operator().email_formatted }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `True`

**Body HTML:**
```html
<div>
    <t t-set="access_token" t-value="object._rating_get_access_token()"/>
    <t t-set="partner" t-value="object._rating_get_partner()"/>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%; margin:0;">
    <tbody>
        <tr><td valign="top" style="font-size: 14px;">
            <t t-if="partner.name">
                Hello <t t-out="partner.name or ''">Brandon Freeman</t>,<br/>
            </t>
            <t t-else="">
                Hello,<br/>
            </t>
            Please take a moment to rate our services related to the ticket "<strong t-out="object.name or ''">Table legs are unbalanced</strong>"
            <t t-if="object._rating_get_operator().name">
                assigned to <strong t-out="object._rating_get_operator().name or ''">Mitchell Admin</strong>.<br/>
            </t>
            <t t-else="">
                .<br/>
            </t>
        </td></tr>
        <tr><td style="text-align: center;">
            <table border="0" cellpadding="0" cellspacing="0" summary="o_mail_notification" style="width:100%; margin: 32px 0px 32px 0px;">
                <tr><td style="font-size: 14px;">
                    <strong>Tell us how you feel about our service</strong><br/>
                    <span style="text-color: #888888">(click on one of these smileys)</span>
                </td></tr>
                <tr><td style="font-size: 14px;">
                    <table style="width:100%;text-align:center;margin-top:2rem;">
                        <tr>
                            <td>
                                <a t-attf-href="/rate/{{ access_token }}/5">
                                    <img alt="Satisfied" src="/rating/static/src/img/rating_5.png" title="Satisfied"/>
                                </a>
                            </td>
                            <td>
                                <a t-attf-href="/rate/{{ access_token }}/3">
                                    <img alt="Okay" src="/rating/static/src/img/rating_3.png" title="Okay"/>
                                </a>
                            </td>
                            <td>
                                <a t-attf-href="/rate/{{ access_token }}/1">
                                    <img alt="Dissatisfied" src="/rating/static/src/img/rating_1.png" title="Dissatisfied"/>
                                </a>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            </table>
        </td></tr>
        <tr><td valign="top" style="font-size: 14px;">
            We appreciate your feedback. It helps us to improve continuously.
            <br/><span style="margin: 0px 0px 0px 0px; font-size: 12px; opacity: 0.5; color: #454748;">This customer survey has been sent because your ticket has been moved to the stage <b t-out="object.stage_id.name or ''">In Progress</b></span>
        </td></tr>
    </tbody>
    </table>
</div>
        
```

### Template ID 39: Ticket: Reception Acknowledgment

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ (object.user_id.email_formatted or user.email_formatted) }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `False`

**Body HTML:**
```html
<div>
    Dear <t t-out="object.sudo().partner_id.name or 'Madam/Sir'">Madam/Sir</t>,<br/><br/>
    Your request
    <t t-if="object.get_portal_url()">
        <a t-attf-href="/my/ticket/{{ object.id }}/{{ object.access_token }}" t-out="object.name or ''"/>
    </t>
    has been received and is being reviewed by our <t t-out="object.team_id.name or ''">Table legs are unbalanced</t> team.
    The reference of your ticket is <t t-out="object.id or ''">15</t>.<br/>

    <div style="text-align: center; padding: 16px 0px 16px 0px;">
        <a style="background-color: #875A7B; padding: 8px 16px 8px 16px; text-decoration: none; color: #fff; border-radius: 5px; font-size:13px;" t-att-href="object.get_portal_url()">View the ticket</a><br/>
    </div>

    To add additional comments, reply to this email.<br/><br/>

    Thank you,<br/><br/>
    <t t-out="object.team_id.name or 'Helpdesk'">Helpdesk</t> Team.
</div>
        
```

### Template ID 40: Ticket: Solved

- **Model**: `helpdesk.ticket`
- **Subject**: `{{ object.display_name }}`
- **email_to**: `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}`
- **email_from**: `{{ (object.user_id.email_formatted or user.email_formatted) }}`
- **lang**: `{{ object.partner_id.lang or object.user_id.lang or user.lang }}`
- **auto_delete**: `False`

**Body HTML:**
```html
<div>
    Dear <t t-out="object.sudo().partner_id.name or 'Madam/Sir'">Madam/Sir</t>,<br/><br/>
    This automatic message informs you that we have closed your ticket (reference <t t-out="object.id or ''">15</t>).
    We hope that the services provided have met your expectations.
    If you have any more questions or comments, don't hesitate to reply to this e-mail to re-open your ticket.<br/><br/>
    Thank you for your cooperation.<br/>
    Kind regards,<br/><br/>
    <t t-out="object.team_id.name or 'Helpdesk'">Helpdesk</t> Team.
</div>
        
```

---

## 3. Sequences (ir.sequence)

Only sequences clearly repair/helpdesk related (those with code or with repair/helpdesk name patterns).

Showing 128 of 211 total sequences (repair/helpdesk relevant).

| ID | Name | Code | Prefix | Suffix | Padding | Next | Increment | Implementation |
|----|------|------|--------|--------|---------|------|-----------|----------------|
| 903 | Advance Payment - Repairs : Check Number Sequence | - | - | - | 5 | 1 | 1 | no_gap |
| 1322 | Advance Receipt - Repairs: Check Number Sequence | - | - | - | 5 | 1 | 1 | no_gap |
| 989 | BR-AM - Warehouse for Ampara Sales Center Sequence repair | - | BR-AM/RO/ | - | 5 | 1 | 1 | standard |
| 990 | BR-AN - Warehouse for Anuradhapura Sales Center Sequence repair | - | BR-AN/RO/ | - | 5 | 1 | 1 | standard |
| 996 | BR-EK - Warehouse for Ekala Sales Center Sequence repair | - | BR-EK/RO/ | - | 5 | 1 | 1 | standard |
| 1003 | Branch Warehouse - Ekala(BR-EK) Sequence repair | - | BR-EK/RO/ | - | 5 | 1 | 1 | standard |
| 1033 | Branch warehouse - Ampara Sequence repair | - | BR-AM/RO/ | - | 5 | 1 | 1 | standard |
| 1043 | Branch warehouse - Anuradhapura Sequence repair | - | BR-AN/RO/ | - | 5 | 1 | 1 | standard |
| 1053 | Branch warehouse - Avissawella Sequence repair | - | BR-AV/RO/ | - | 5 | 1 | 1 | standard |
| 1063 | Branch warehouse - Bandarawela Sequence repair | - | BR-BA/RO/ | - | 5 | 1 | 1 | standard |
| 1073 | Branch warehouse - Beruwela Sequence repair | - | BR-BE/RO/ | - | 5 | 1 | 1 | standard |
| 1083 | Branch warehouse - Buttala Sequence repair | - | BR-BU/RO/ | - | 5 | 1 | 1 | standard |
| 1093 | Branch warehouse - Dambulla Sequence repair | - | BR-DA/RO/ | - | 5 | 1 | 1 | standard |
| 1017 | Branch warehouse - Ekala (BR-EK) Sequence repair | - | BR-EK/RO/ | - | 5 | 1 | 1 | standard |
| 1103 | Branch warehouse - Embilipitiya Sequence repair | - | BR-EM/RO/ | - | 5 | 1 | 1 | standard |
| 1113 | Branch warehouse - Galle Sequence repair | - | BR-GA/RO/ | - | 5 | 1 | 1 | standard |
| 1123 | Branch warehouse - Girandurukotte Sequence repair | - | BR-GK/RO/ | - | 5 | 1 | 1 | standard |
| 1133 | Branch warehouse - Jaffna Sequence repair | - | BR-JF/RO/ | - | 5 | 1 | 1 | standard |
| 1153 | Branch warehouse - Kaduruwela Sequence repair | - | BR-KD/RO/ | - | 5 | 1 | 1 | standard |
| 1143 | Branch warehouse - Kandy Sequence repair | - | BR-KA/RO/ | - | 5 | 1 | 1 | standard |
| 1163 | Branch warehouse - Kurunegala Sequence repair | - | BR-KU/RO/ | - | 5 | 1 | 1 | standard |
| 1173 | Branch warehouse - Nuwara-Eliya Sequence repair | - | BR-NE/RO/ | - | 5 | 1 | 1 | standard |
| 1183 | Branch warehouse - Thambuttegama Sequence repair | - | BR-TH/RO/ | - | 5 | 1 | 1 | standard |
| 994 | Casting Department - MW-JC Sequence repair | - | MW-JC/RO/ | - | 5 | 1 | 1 | standard |
| 1007 | Casting warehouse -  (CW-CM) Sequence repair | - | CW-CM/RO/ | - | 5 | 1 | 1 | standard |
| 981 | Casting warehouse - CW-CM Sequence repair | - | CW-CM/RO/ | - | 5 | 1 | 1 | standard |
| 1333 | Customer Invoices - Repairs: Check Number Sequence | - | - | - | 5 | 1 | 1 | no_gap |
| 998 | Electrical Installation Projects warehouse - PJ-EI Sequence repair | - | PJ-EI/RO/ | - | 5 | 1 | 1 | standard |
| 1253 | Intransit warehouse - Embilipitiya Sequence repair | - | IB-EM/RO/ | - | 5 | 1 | 1 | standard |
| 1243 | Intransit warehouse - JAM Sequence repair | - | IW-JM/RO/ | - | 5 | 1 | 1 | standard |
| 1233 | JAM Non Moving Warehouse Sequence repair | - | JM-NM/RO/ | - | 5 | 1 | 1 | standard |
| 1193 | JAM Scrap Warehouse Sequence repair | - | RP-SC/RO/ | - | 5 | 1 | 1 | standard |
| 1018 | JAM Warehouse Ekala- (JM-EK) Sequence repair | - | JM-EK/RO/ | - | 5 | 1 | 1 | standard |
| 993 | Jinasena Agricultural Machinery (Pvt) Ltd. Sequence repair | - | Jinas/RO/ | - | 5 | 1 | 1 | standard |
| 982 | Main warehouse - MW-CM Sequence repair | - | MW-CM/RO/ | - | 5 | 1 | 1 | standard |
| 1013 | Main warehouse - MW-EK Sequence repair | - | MW-EK/RO/ | - | 5 | 1 | 1 | standard |
| 992 | Main warehouse - MW-EK Sequence repair | - | MW-EK/RO/ | - | 5 | 1 | 1 | standard |
| 1014 | Main warehouse - Raw material for motors - (MW-JE) Sequence repair | - | MW-JE/RO/ | - | 5 | 1 | 1 | standard |
| 999 | Main warehouse - Raw material for motors - MW-JE Sequence repair | - | MW-JE/RO/ | - | 5 | 1 | 1 | standard |
| 1012 | Main warehouse(Primovers) - (MW-CM) Sequence repair | - | MW-CM/RO/ | - | 5 | 1 | 1 | standard |
| 1009 | Oils & lubricants warehouse - (OW-EK) Sequence repair | - | OW-EK/RO/ | - | 5 | 1 | 1 | standard |
| 983 | Oils & lubricants warehouse - OW-EK Sequence repair | - | OW-EK/RO/ | - | 5 | 1 | 1 | standard |
| 1020 | Plastic Warehouse - ( PL-EK ) Sequence repair | - | PL-EK/RO/ | - | 5 | 1 | 1 | standard |
| 1001 | Production Warehouse - (PW-JM) Sequence repair | - | PW-JM/RO/ | - | 5 | 1 | 1 | standard |
| 1010 | Production warehouse  JEM Department - (PW-MA) Sequence repair | - | PW-MA/RO/ | - | 5 | 1 | 1 | standard |
| 1006 | Production warehouse - Casting (MW-JC) Sequence repair | - | MW-JC/RO/ | - | 5 | 1 | 1 | standard |
| 1011 | Production warehouse - Motor winding & assembly - (PW-JE) Sequence repair | - | PW-JE/RO/ | - | 5 | 1 | 1 | standard |
| 987 | Production warehouse - PW-E1 Sequence repair | - | PW-E1/RO/ | - | 5 | 1 | 1 | standard |
| 985 | Production warehouse - PW-JE Sequence repair | - | PW-JE/RO/ | - | 5 | 1 | 1 | standard |
| 986 | Production warehouse - PW-MW Sequence repair | - | PW-MW/RO/ | - | 5 | 1 | 1 | standard |
| 1005 | Production warehouse - Plastic (PL-EK) Sequence repair | - | PL-EK/RO/ | - | 5 | 1 | 1 | standard |
| 1004 | Production warehouse - Pumps (PW-E1) Sequence repair | - | PW-E1/RO/ | - | 5 | 1 | 1 | standard |
| 1015 | Production warehouse Motor Winding - (PW-MW) Sequence repair | - | PW-MW/RO/ | - | 5 | 1 | 1 | standard |
| 1019 | Production warehouse for Machining and Assembly of JEM - ( PW-MA ) Sequence repair | - | PW-MA/RO/ | - | 5 | 1 | 1 | standard |
| 330 | Quick Repairs warehouse - RP-QU Picking POS | - | RP-QU/POS/ | - | 5 | 1 | 1 | standard |
| 407 | Quick Repairs warehouse - RP-QU Sequence Resupply Subcontractor | - | RP-QU/RES/ | - | 5 | 1 | 1 | standard |
| 550 | Quick Repairs warehouse - RP-QU Sequence Resupply Subcontractor | - | RP-QU/RES/ | - | 5 | 1 | 1 | standard |
| 321 | Quick Repairs warehouse - RP-QU Sequence in | - | RP-QU/IN/ | - | 5 | 1 | 1 | standard |
| 325 | Quick Repairs warehouse - RP-QU Sequence internal | - | RP-QU/INT/ | - | 5 | 1 | 1 | standard |
| 322 | Quick Repairs warehouse - RP-QU Sequence out | - | RP-QU/OUT/ | - | 5 | 1 | 1 | standard |
| 324 | Quick Repairs warehouse - RP-QU Sequence packing | - | RP-QU/PACK/ | - | 5 | 1 | 1 | standard |
| 323 | Quick Repairs warehouse - RP-QU Sequence picking | - | RP-QU/PICK/ | - | 5 | 1 | 1 | standard |
| 327 | Quick Repairs warehouse - RP-QU Sequence picking before manufacturing | - | RP-QU/PC/ | - | 5 | 1 | 1 | standard |
| 329 | Quick Repairs warehouse - RP-QU Sequence production | - | RP-QU/MO/ | - | 5 | 1 | 1 | standard |
| 997 | Quick Repairs warehouse - RP-QU Sequence repair | - | RP-QU/RO/ | - | 5 | 1 | 1 | standard |
| 326 | Quick Repairs warehouse - RP-QU Sequence return | - | RP-QU/RET/ | - | 5 | 1 | 1 | standard |
| 328 | Quick Repairs warehouse - RP-QU Sequence stock after manufacturing | - | RP-QU/SFP/ | - | 5 | 1 | 1 | standard |
| 549 | Quick Repairs warehouse - RP-QU Sequence subcontracting | - | RP-QU/SBC/ | - | 5 | 1 | 1 | standard |
| 406 | Quick Repairs warehouse - RP-QU Sequence subcontracting | - | RP-QU/SBC/ | - | 5 | 1 | 1 | standard |
| 991 | RC-TM - Warehouse for Colombo Sales Center Sequence repair | - | RC-TM/RO/ | - | 5 | 1 | 1 | standard |
| 988 | Raw Material Main Warehouse - RP-EK Sequence repair | - | RP-EK/RO/ | - | 5 | 1 | 1 | standard |
| 1008 | Raw Material Warehouse - (RP-EK) Sequence repair | - | RP-EK/RO/ | - | 5 | 1 | 1 | standard |
| 278 | Repair Sequence No | repair.seq | REPAIR/%(year)s/ | - | 5 | 1 | 1 | standard |
| 811 | Repair Sequence No | repair.seq | REPAIR/%(year)s/ | - | 5 | 1 | 1 | standard |
| 812 | Repair Serial Sequence No | repair.serial.seq | 	REP-SERIAL/%(year)s/ | - | 5 | 1 | 1 | standard |
| 279 | Repair Serial Sequence No | repair.serial.seq | 	REP-SERIAL/%(year)s/ | - | 5 | 1 | 1 | standard |
| 796 | Repair warehouse - Colombo ( RP-CM) Picking POS | - | RP-CM/POS/ | - | 5 | 1 | 1 | standard |
| 795 | Repair warehouse - Colombo ( RP-CM) Sequence Resupply Subcontractor | - | RP-CM/RES/ | - | 5 | 1 | 1 | standard |
| 791 | Repair warehouse - Colombo ( RP-CM) Sequence picking before manufacturing | - | RP-CM/PC/ | - | 5 | 1 | 1 | standard |
| 793 | Repair warehouse - Colombo ( RP-CM) Sequence production | - | RP-CM/MO/ | - | 5 | 1 | 1 | standard |
| 790 | Repair warehouse - Colombo ( RP-CM) Sequence return | - | RP-CM/RET/ | - | 5 | 1 | 1 | standard |
| 792 | Repair warehouse - Colombo ( RP-CM) Sequence stock after manufacturing | - | RP-CM/SFP/ | - | 5 | 1 | 1 | standard |
| 794 | Repair warehouse - Colombo ( RP-CM) Sequence subcontracting | - | RP-CM/SBC/ | - | 5 | 1 | 1 | standard |
| 785 | Repair warehouse - Colombo (RP-CM) Sequence in | - | RP-CM/IN/ | - | 5 | 1 | 1 | standard |
| 789 | Repair warehouse - Colombo (RP-CM) Sequence internal | - | RP-CM/INT/ | - | 5 | 1 | 1 | standard |
| 786 | Repair warehouse - Colombo (RP-CM) Sequence out | - | RP-CM/OUT/ | - | 5 | 1 | 1 | standard |
| 788 | Repair warehouse - Colombo (RP-CM) Sequence packing | - | RP-CM/PACK/ | - | 5 | 1 | 1 | standard |
| 787 | Repair warehouse - Colombo (RP-CM) Sequence picking | - | RP-CM/PICK/ | - | 5 | 1 | 1 | standard |
| 1016 | Repair warehouse - Colombo (RP-CM) Sequence repair | - | RP-CM/RO/ | - | 5 | 1 | 1 | standard |
| 602 | Repairs Warehouse - (RP-JM) Sequence in | - | RP-JM/IN/ | - | 5 | 1 | 1 | standard |
| 606 | Repairs Warehouse - (RP-JM) Sequence internal | - | RP-JM/INT/ | - | 5 | 1 | 1 | standard |
| 603 | Repairs Warehouse - (RP-JM) Sequence out | - | RP-JM/OUT/ | - | 5 | 1 | 1 | standard |
| 605 | Repairs Warehouse - (RP-JM) Sequence packing | - | RP-JM/PACK/ | - | 5 | 1 | 1 | standard |
| 604 | Repairs Warehouse - (RP-JM) Sequence picking | - | RP-JM/PICK/ | - | 5 | 1 | 1 | standard |
| 1002 | Repairs Warehouse - (RP-JM) Sequence repair | - | RP-JM/RO/ | - | 5 | 1 | 1 | standard |
| 613 | Repairs warehouse - JAM Ekala Picking POS | - | RP-JM/POS/ | - | 5 | 1 | 1 | standard |
| 612 | Repairs warehouse - JAM Ekala Sequence Resupply Subcontractor | - | RP-JM/RES/ | - | 5 | 1 | 1 | standard |
| 608 | Repairs warehouse - JAM Ekala Sequence picking before manufacturing | - | RP-JM/PC/ | - | 5 | 1 | 1 | standard |
| 610 | Repairs warehouse - JAM Ekala Sequence production | - | RP-JM/MO/ | - | 5 | 1 | 1 | standard |
| 607 | Repairs warehouse - JAM Ekala Sequence return | - | RP-JM/RET/ | - | 5 | 1 | 1 | standard |
| 609 | Repairs warehouse - JAM Ekala Sequence stock after manufacturing | - | RP-JM/SFP/ | - | 5 | 1 | 1 | standard |
| 611 | Repairs warehouse - JAM Ekala Sequence subcontracting | - | RP-JM/SBC/ | - | 5 | 1 | 1 | standard |
| 307 | Repairs warehouse - RP-CM Picking POS | - | RP-CM/POS/ | - | 5 | 1 | 1 | standard |
| 403 | Repairs warehouse - RP-CM Sequence Resupply Subcontractor | - | RP-CM/RES/ | - | 5 | 1 | 1 | standard |
| 546 | Repairs warehouse - RP-CM Sequence Resupply Subcontractor | - | RP-CM/RES/ | - | 5 | 1 | 1 | standard |
| 298 | Repairs warehouse - RP-CM Sequence in | - | RP-CM/IN/ | - | 5 | 1 | 1 | standard |
| 302 | Repairs warehouse - RP-CM Sequence internal | - | RP-CM/INT/ | - | 5 | 1 | 1 | standard |
| 299 | Repairs warehouse - RP-CM Sequence out | - | RP-CM/OUT/ | - | 5 | 1 | 1 | standard |
| 301 | Repairs warehouse - RP-CM Sequence packing | - | RP-CM/PACK/ | - | 5 | 1 | 1 | standard |
| 300 | Repairs warehouse - RP-CM Sequence picking | - | RP-CM/PICK/ | - | 5 | 1 | 1 | standard |
| 304 | Repairs warehouse - RP-CM Sequence picking before manufacturing | - | RP-CM/PC/ | - | 5 | 1 | 1 | standard |
| 306 | Repairs warehouse - RP-CM Sequence production | - | RP-CM/MO/ | - | 5 | 1 | 1 | standard |
| 995 | Repairs warehouse - RP-CM Sequence repair | - | RP-CM/RO/ | - | 5 | 1 | 1 | standard |
| 303 | Repairs warehouse - RP-CM Sequence return | - | RP-CM/RET/ | - | 5 | 1 | 1 | standard |
| 305 | Repairs warehouse - RP-CM Sequence stock after manufacturing | - | RP-CM/SFP/ | - | 5 | 1 | 1 | standard |
| 402 | Repairs warehouse - RP-CM Sequence subcontracting | - | RP-CM/SBC/ | - | 5 | 1 | 1 | standard |
| 545 | Repairs warehouse - RP-CM Sequence subcontracting | - | RP-CM/SBC/ | - | 5 | 1 | 1 | standard |
| 1203 | Research and Development JAM Factory Ekala Sequence repair | - | RD-JM/RO/ | - | 5 | 1 | 1 | standard |
| 1213 | Retail Counter - Waste Management Sequence repair | - | RC-WX/RO/ | - | 5 | 1 | 1 | standard |
| 1263 | Retail Counter - Waste Management Sequence repair | - | RC-WM/RO/ | - | 5 | 1 | 1 | standard |
| 1223 | Retail Counter for Products, Implements And Accessories - Thimbirigasya Sequence repair | - | RC-TM/RO/ | - | 5 | 1 | 1 | standard |
| 984 | Retail Sales Counter(Sp) - SP-RC Sequence repair | - | SP-RC/RO/ | - | 5 | 1 | 1 | standard |
| 1368 | Tender warehouse - Head Office Sequence repair | - | TD-HO/RO/ | - | 5 | 1 | 1 | standard |
| 1000 | Testing Sequence repair | - | Testi/RO/ | - | 5 | 1 | 1 | standard |
| 980 | jinasena Pvt Ltd Sequence repair | - | WH/RO/ | - | 5 | 1 | 1 | standard |
| 977 | Helpdesk Ticket | helpdesk.ticket | - | - | 2 | 1 | 1 | standard |
| 234 | Jinasena Agricultural Machinery (Pvt) Ltd. Sequence scrap | stock.scrap | SP/ | - | 5 | 1 | 1 | standard |
| 8 | jinasena Pvt Ltd Sequence scrap | stock.scrap | SP/ | - | 5 | 1 | 1 | standard |

### 3.1 All Repair Warehouse Sequences (complete list)

The following sequences follow warehouse repair order patterns (prefix ending in `/RO/`):

| ID | Name | Prefix | Implementation |
|----|------|--------|----------------|
| 989 | BR-AM - Warehouse for Ampara Sales Center Sequence repair | BR-AM/RO/ | standard |
| 990 | BR-AN - Warehouse for Anuradhapura Sales Center Sequence repair | BR-AN/RO/ | standard |
| 996 | BR-EK - Warehouse for Ekala Sales Center Sequence repair | BR-EK/RO/ | standard |
| 1003 | Branch Warehouse - Ekala(BR-EK) Sequence repair | BR-EK/RO/ | standard |
| 1033 | Branch warehouse - Ampara Sequence repair | BR-AM/RO/ | standard |
| 1043 | Branch warehouse - Anuradhapura Sequence repair | BR-AN/RO/ | standard |
| 1053 | Branch warehouse - Avissawella Sequence repair | BR-AV/RO/ | standard |
| 1063 | Branch warehouse - Bandarawela Sequence repair | BR-BA/RO/ | standard |
| 1073 | Branch warehouse - Beruwela Sequence repair | BR-BE/RO/ | standard |
| 1083 | Branch warehouse - Buttala Sequence repair | BR-BU/RO/ | standard |
| 1093 | Branch warehouse - Dambulla Sequence repair | BR-DA/RO/ | standard |
| 1017 | Branch warehouse - Ekala (BR-EK) Sequence repair | BR-EK/RO/ | standard |
| 1103 | Branch warehouse - Embilipitiya Sequence repair | BR-EM/RO/ | standard |
| 1113 | Branch warehouse - Galle Sequence repair | BR-GA/RO/ | standard |
| 1123 | Branch warehouse - Girandurukotte Sequence repair | BR-GK/RO/ | standard |
| 1133 | Branch warehouse - Jaffna Sequence repair | BR-JF/RO/ | standard |
| 1153 | Branch warehouse - Kaduruwela Sequence repair | BR-KD/RO/ | standard |
| 1143 | Branch warehouse - Kandy Sequence repair | BR-KA/RO/ | standard |
| 1163 | Branch warehouse - Kurunegala Sequence repair | BR-KU/RO/ | standard |
| 1173 | Branch warehouse - Nuwara-Eliya Sequence repair | BR-NE/RO/ | standard |
| 1183 | Branch warehouse - Thambuttegama Sequence repair | BR-TH/RO/ | standard |
| 994 | Casting Department - MW-JC Sequence repair | MW-JC/RO/ | standard |
| 1007 | Casting warehouse -  (CW-CM) Sequence repair | CW-CM/RO/ | standard |
| 981 | Casting warehouse - CW-CM Sequence repair | CW-CM/RO/ | standard |
| 998 | Electrical Installation Projects warehouse - PJ-EI Sequence repair | PJ-EI/RO/ | standard |
| 1253 | Intransit warehouse - Embilipitiya Sequence repair | IB-EM/RO/ | standard |
| 1243 | Intransit warehouse - JAM Sequence repair | IW-JM/RO/ | standard |
| 1233 | JAM Non Moving Warehouse Sequence repair | JM-NM/RO/ | standard |
| 1193 | JAM Scrap Warehouse Sequence repair | RP-SC/RO/ | standard |
| 1018 | JAM Warehouse Ekala- (JM-EK) Sequence repair | JM-EK/RO/ | standard |
| 993 | Jinasena Agricultural Machinery (Pvt) Ltd. Sequence repair | Jinas/RO/ | standard |
| 982 | Main warehouse - MW-CM Sequence repair | MW-CM/RO/ | standard |
| 1013 | Main warehouse - MW-EK Sequence repair | MW-EK/RO/ | standard |
| 992 | Main warehouse - MW-EK Sequence repair | MW-EK/RO/ | standard |
| 1014 | Main warehouse - Raw material for motors - (MW-JE) Sequence repair | MW-JE/RO/ | standard |
| 999 | Main warehouse - Raw material for motors - MW-JE Sequence repair | MW-JE/RO/ | standard |
| 1012 | Main warehouse(Primovers) - (MW-CM) Sequence repair | MW-CM/RO/ | standard |
| 1009 | Oils & lubricants warehouse - (OW-EK) Sequence repair | OW-EK/RO/ | standard |
| 983 | Oils & lubricants warehouse - OW-EK Sequence repair | OW-EK/RO/ | standard |
| 1020 | Plastic Warehouse - ( PL-EK ) Sequence repair | PL-EK/RO/ | standard |
| 1001 | Production Warehouse - (PW-JM) Sequence repair | PW-JM/RO/ | standard |
| 1010 | Production warehouse  JEM Department - (PW-MA) Sequence repair | PW-MA/RO/ | standard |
| 1006 | Production warehouse - Casting (MW-JC) Sequence repair | MW-JC/RO/ | standard |
| 1011 | Production warehouse - Motor winding & assembly - (PW-JE) Sequence repair | PW-JE/RO/ | standard |
| 987 | Production warehouse - PW-E1 Sequence repair | PW-E1/RO/ | standard |
| 985 | Production warehouse - PW-JE Sequence repair | PW-JE/RO/ | standard |
| 986 | Production warehouse - PW-MW Sequence repair | PW-MW/RO/ | standard |
| 1005 | Production warehouse - Plastic (PL-EK) Sequence repair | PL-EK/RO/ | standard |
| 1004 | Production warehouse - Pumps (PW-E1) Sequence repair | PW-E1/RO/ | standard |
| 1015 | Production warehouse Motor Winding - (PW-MW) Sequence repair | PW-MW/RO/ | standard |
| 1019 | Production warehouse for Machining and Assembly of JEM - ( PW-MA ) Sequence repair | PW-MA/RO/ | standard |
| 997 | Quick Repairs warehouse - RP-QU Sequence repair | RP-QU/RO/ | standard |
| 991 | RC-TM - Warehouse for Colombo Sales Center Sequence repair | RC-TM/RO/ | standard |
| 988 | Raw Material Main Warehouse - RP-EK Sequence repair | RP-EK/RO/ | standard |
| 1008 | Raw Material Warehouse - (RP-EK) Sequence repair | RP-EK/RO/ | standard |
| 1016 | Repair warehouse - Colombo (RP-CM) Sequence repair | RP-CM/RO/ | standard |
| 1002 | Repairs Warehouse - (RP-JM) Sequence repair | RP-JM/RO/ | standard |
| 995 | Repairs warehouse - RP-CM Sequence repair | RP-CM/RO/ | standard |
| 1203 | Research and Development JAM Factory Ekala Sequence repair | RD-JM/RO/ | standard |
| 1213 | Retail Counter - Waste Management Sequence repair | RC-WX/RO/ | standard |
| 1263 | Retail Counter - Waste Management Sequence repair | RC-WM/RO/ | standard |
| 1223 | Retail Counter for Products, Implements And Accessories - Thimbirigasya Sequence repair | RC-TM/RO/ | standard |
| 984 | Retail Sales Counter(Sp) - SP-RC Sequence repair | SP-RC/RO/ | standard |
| 1368 | Tender warehouse - Head Office Sequence repair | TD-HO/RO/ | standard |
| 1000 | Testing Sequence repair | Testi/RO/ | standard |
| 980 | jinasena Pvt Ltd Sequence repair | WH/RO/ | standard |

---

## 4. Master Data Records

### 4.1 helpdesk.stage (28 records)

| ID | Name | Sequence | Fold | Template | Company |
|----|------|----------|------|----------|---------|
| 1 | New | 0 | False | Ticket: Reception Acknowledgment (ID:39) | Jinasena (Pvt) Ltd. |
| 20 | New | 0 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 33 | New | 0 | False | Ticket: Reception Acknowledgment (ID:39) | JLTD |
| 5 | Sent to Factory | 1 | False | - | Jinasena (Pvt) Ltd. |
| 24 | Sent to Factory | 1 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 6 | Received at Factory | 2 | False | - | Jinasena (Pvt) Ltd. |
| 25 | Received at Factory | 2 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 35 | On Hold | 2 | False | - | - |
| 2 | Diagnosis | 3 | False | - | Jinasena (Pvt) Ltd. |
| 21 | Diagnosis | 3 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 10 | Estimation Sent to Customer | 4 | False | - | Jinasena (Pvt) Ltd. |
| 29 | Estimation Sent to Customer | 4 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 12 | Estimation Approval Received | 5 | False | - | Jinasena (Pvt) Ltd. |
| 31 | Estimation Approval Received | 5 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 3 | Advance Received | 6 | True | - | Jinasena (Pvt) Ltd. |
| 22 | Advance Received | 6 | True | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 11 | Repair Started | 7 | False | - | Jinasena (Pvt) Ltd. |
| 30 | Repair Started | 7 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 9 | Repair Completed | 8 | False | - | Jinasena (Pvt) Ltd. |
| 28 | Repair Completed | 8 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 7 | Sent to Sales Centre | 9 | False | - | Jinasena (Pvt) Ltd. |
| 26 | Sent to Sales Centre | 9 | False | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 8 | Received at Sales Centre | 10 | True | - | Jinasena (Pvt) Ltd. |
| 27 | Received at Sales Centre | 10 | True | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 13 | Handed Over to Customer | 11 | True | - | Jinasena (Pvt) Ltd. |
| 32 | Handed Over to Customer | 11 | True | - | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 4 | Cancelled | 12 | True | - | Jinasena (Pvt) Ltd. |
| 23 | Cancelled | 12 | True | - | Jinasena Agricultural Machinery (Pvt) Ltd. |

### 4.2 helpdesk.ticket.type (4 records)

| ID | Name | Sequence | x_studio_rug | x_studio_rug_confirmed | x_studio_with_serial_no | x_studio_without_serial_no |
|----|------|----------|--------------|----------------------|------------------------|---------------------------|
| 3 | Repair - Not Under Warranty (With Serial No) | 10 | False | False | True | False |
| 4 | Repair - Not Under Warranty (Without Serial No) | 10 | False | False | False | True |
| 2 | Repair - Under Warranty -  External not RUG | 10 | True | False | False | False |
| 1 | Repair - Under Warranty - RUG | 10 | True | True | False | False |

### 4.3 x_repair_stages

| ID | x_name | x_studio_sequence | x_studio_description | x_studio_company_id | x_active |
|----|--------|-------------------|---------------------|---------------------|----------|
| 1 | 1-REP-REC | 10 | Repair receipt | Jinasena (Pvt) Ltd. | True |
| 2 | 2-STARTED | 10 | Job started | Jinasena (Pvt) Ltd. | True |
| 3 | 3-WT-SP | 10 | Waiting for spareparts | Jinasena (Pvt) Ltd. | True |
| 4 | 4-FINISHED | 10 | Finished | Jinasena (Pvt) Ltd. | True |
| 5 | 5-READY | 10 | Ready for collection | Jinasena (Pvt) Ltd. | True |

### 4.4 x_repair_reason

| ID | x_name | x_studio_sequence | x_color | x_studio_company_id | x_active |
|----|--------|-------------------|---------|---------------------|----------|
| 1 | Internal | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 2 | External | 10 | 0 | Jinasena (Pvt) Ltd. | True |

### 4.5 x_repair_reason_custom

| ID | x_name | x_studio_sequence | x_color | x_studio_company_id | x_active |
|----|--------|-------------------|---------|---------------------|----------|
| 4 | Difficult to start the engine | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 5 | High current consumption | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 6 | Heavy smoke | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 7 | Maximum head not reached | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 8 | Low out put | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 9 | Low pressure | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 10 | Unit makes a mechanical noise or rattle | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 11 | Motor not getting started | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 12 | Motor getting tripped from TOC | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 13 | Pump stops after some time | 10 | 0 | Jinasena (Pvt) Ltd. | True |
| 14 | Fault | 10 | 0 | JLTD | True |
| 15 | Low Pressue | 10 | 0 | Jinasena Agricultural Machinery (Pvt) Ltd. | True |

### 4.6 x_repair_accounts

| ID | x_name | x_studio_company_id | x_studio_rug_account | x_studio_sequence | x_active |
|----|--------|---------------------|---------------------|-------------------|----------|
| 1 | Repair Accounts - JLD | Jinasena (Pvt) Ltd. | RG006 R.U.G. - REPAIRS | 10 | True |
| 2 | Repair Accounts - JAM | Jinasena Agricultural Machinery (Pvt) Ltd. | - | 10 | True |

### 4.7 x_repair_sub_reason

| ID | x_name | x_studio_sequence | x_studio_reason_code | x_studio_company_id | x_active |
|----|--------|-------------------|---------------------|---------------------|----------|
| 1 | Hi voltage | 10 | External | Jinasena (Pvt) Ltd. | True |
| 2 | Hi voltage - 02 | 10 | Internal | Jinasena (Pvt) Ltd. | True |

### 4.8 x_diagnosis_areas

| ID | x_name | x_studio_description | x_studio_sequence | x_studio_company_id | x_active |
|----|--------|---------------------|-------------------|---------------------|----------|
| 1 | Burnt part | Burnt part | 10 | Jinasena (Pvt) Ltd. | True |
| 2 | Part coroded | Part coroded | 10 | Jinasena (Pvt) Ltd. | True |
| 6 | Part need replacement | Part need replacement | 10 | Jinasena (Pvt) Ltd. | True |
| 7 | Part damaged | Part damaged | 10 | Jinasena (Pvt) Ltd. | True |
| 8 | Part worn out | Part worn out | 10 | Jinasena (Pvt) Ltd. | True |
| 9 | Motor burnt | Motor burnt | 10 | Jinasena (Pvt) Ltd. | True |

### 4.9 x_diagnosis_codes

| ID | x_name | x_studio_description | x_studio_diagnosis_area_1 | x_studio_sequence | x_studio_company_id | x_active |
|----|--------|---------------------|--------------------------|-------------------|---------------------|----------|
| 1 | Seal damaged | Seal damaged | - | 10 | Jinasena (Pvt) Ltd. | True |
| 2 | Shaft | Shaft | Part coroded | 10 | Jinasena (Pvt) Ltd. | True |
| 3 | Preasure booster tank | Preasure booster tank | - | 10 | Jinasena (Pvt) Ltd. | True |
| 7 | Circuit | Circuit | Burnt part | 10 | Jinasena (Pvt) Ltd. | True |
| 8 | Motor winding burnt | Motor winding burnt | Burnt part | 10 | Jinasena (Pvt) Ltd. | True |
| 9 | Condenser burnt | Condenser burnt | Burnt part | 10 | Jinasena (Pvt) Ltd. | True |
| 10 | Diodes | Diodes | Burnt part | 10 | Jinasena (Pvt) Ltd. | True |
| 11 | Fuse burnt | Fuse burnt | Burnt part | 10 | Jinasena (Pvt) Ltd. | True |
| 12 | Base plate | Base plate | Part coroded | 10 | Jinasena (Pvt) Ltd. | True |
| 13 | Motor housing | Motor housing | Part coroded | 10 | Jinasena (Pvt) Ltd. | True |
| 14 | Pump body | Pump body | Part coroded | 10 | Jinasena (Pvt) Ltd. | True |
| 15 | Base plate | Base plate | - | 10 | - | True |

### 4.10 x_symptom_areas

| ID | x_name | x_studio_description | x_studio_sequence | x_studio_company_id | x_active |
|----|--------|---------------------|-------------------|---------------------|----------|
| 1 | Faulty | Faulty | 10 | Jinasena (Pvt) Ltd. | True |

### 4.11 x_symptom_codes

| ID | x_name | x_studio_description | x_studio_symptom_area | x_studio_sequence | x_studio_company_id | x_active |
|----|--------|---------------------|----------------------|-------------------|---------------------|----------|
| 1 | Symptom 01 | Symptom 01 | Faulty | 10 | Jinasena (Pvt) Ltd. | True |

### 4.12 x_resolutions

| ID | x_name | x_studio_description | x_studio_sequence | x_studio_company_id | x_active |
|----|--------|---------------------|-------------------|---------------------|----------|
| 1 | REJECT | Repair rejected | 10 | Jinasena (Pvt) Ltd. | True |
| 2 | REP | Repaired | 10 | Jinasena (Pvt) Ltd. | True |

### 4.13 x_conditions

| ID | x_name | x_studio_description | x_studio_sequence | x_studio_company_id |
|----|--------|---------------------|-------------------|---------------------|
| 1 | When working for too long | When working for too long | 10 | Jinasena (Pvt) Ltd. |
| 2 | When switched on | When switched on | 10 | Jinasena (Pvt) Ltd. |
| 3 | Voltage spikes | Voltage spikes | 10 | Jinasena (Pvt) Ltd. |

---

## 5. Studio Field Deep Attributes

### 5.1 helpdesk.ticket — 107 Studio Fields

| Field Name | Label | Type | Relation | Selection Values | Domain | Store | Required | Readonly | Help |
|------------|-------|------|----------|-----------------|--------|-------|----------|----------|------|
| `x_studio_balance_due` | Balance Due | `float` | - | - | - | True | False | False | - |
| `x_studio_branch` | Branch | `selection` | - | [('Colombo', 'Colombo'), ('Gampah', 'Gampah')] | - | True | False | False | - |
| `x_studio_cancel_reason` | Cancel Reason | `text` | - | - | - | True | False | False | - |
| `x_studio_cancel_status` | Cancel Status | `selection` | - | [('None', 'None'), ('Cancelled', 'Cancelled')] | - | True | False | False | - |
| `x_studio_cancelled` | Cancelled | `boolean` | - | - | - | True | False | False | - |
| `x_studio_cancelled_2` | Cancelled-2 | `boolean` | - | - | - | True | False | False | - |
| `x_studio_cancelled_by` | Cancelled By | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_cancelled_date` | Cancelled Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_cancelled_stage_id` | Cancelled Stage Id | `many2one` | helpdesk.stage | - | - | True | False | False | - |
| `x_studio_cccc` | CCCC | `char` | - | - | - | True | False | True | - |
| `x_studio_cccc3` | CCCC3 | `many2one` | helpdesk.stage | - | - | True | False | True | - |
| `x_studio_city` | City | `selection` | - | [('Gampaha', 'Gampaha'), ('Colombo', 'Colombo'), ('Yakkala', 'Yakkala')] | - | True | False | False | - |
| `x_studio_created_by_1` | Created By 1 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_10` | Created By 10 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_2` | Created By 2 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_3` | Created By 3 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_4` | Created By 4 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_5` | Created By 5 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_6` | Created By 6 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_7` | Created By 7 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_8` | Created By 8 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_by_9` | Created By 9 | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_created_on_1` | Created On 1 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_10` | Created On 10 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_2` | Created On 2 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_3` | Created On 3 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_4` | Created On 4 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_5` | Created On 5 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_6` | Created On 6 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_7` | Created On 7 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_8` | Created On 8 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_created_on_9` | Created On 9 | `datetime` | - | - | - | True | False | False | - |
| `x_studio_driver_name` | Driver Name | `char` | - | - | - | True | False | False | - |
| `x_studio_estimation_approved_stage_updated` | Estimation Approved Stage Updated | `boolean` | - | - | - | True | False | False | - |
| `x_studio_estimation_sent_stage_updated` | Estimation Sent Stage Updated | `boolean` | - | - | - | True | False | False | - |
| `x_studio_f_received_by` | Received By | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_f_received_date` | Received Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_f_shipped_by` | Shipped By | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_f_shipped_date` | Shipped Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_fsm_task_done` | FSM Task Done | `boolean` | - | - | - | False | False | True | - |
| `x_studio_fully_paid_so` | Fully Paid SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_handed_over` | Handed Over | `boolean` | - | - | - | False | False | True | - |
| `x_studio_invoice_stage_updated` | Invoice Stage Updated | `boolean` | - | - | - | True | False | False | - |
| `x_studio_items` | Items | `many2many` | product.product | - | - | True | False | False | - |
| `x_studio_job_location` | Job Location | `selection` | - | [('Centre Repair', 'Centre Repair'), ('Factory Repair', 'Factory Repair')] | - | True | False | False | - |
| `x_studio_material_availability` | Material Availability | `selection` | - | [('Material Not Ready', 'Material Not Ready'), ('Material Ready', 'Material Ready')] | - | False | False | True | - |
| `x_studio_materials_used` | Materials Used  | `many2one` | product.product | - | - | True | False | True | - |
| `x_studio_normal_repair_with_serial_no` | Normal Repair (With Serial No) | `boolean` | - | - | - | True | False | True | - |
| `x_studio_normal_repair_without_serial_no` | Normal Repair (Without Serial No) | `boolean` | - | - | - | True | False | True | - |
| `x_studio_pick_id` | Pick Id | `integer` | - | - | - | True | False | False | - |
| `x_studio_picking_id` | Picking Id | `many2one` | stock.picking | - | - | True | False | False | - |
| `x_studio_qty` | Qty | `char` | - | - | - | True | False | False | - |
| `x_studio_quantity` | Quantity | `float` | - | - | - | True | False | True | - |
| `x_studio_quick_repair_status` | Tested OK | `selection` | - | [('None', 'None'), ('Quick Repair', 'Tested OK')] | - | True | False | True | - |
| `x_studio_re_estimate_count` | Re-estimate Count | `integer` | - | - | - | False | False | True | - |
| `x_studio_re_estimate_status` | Re-estimate Status | `selection` | - | [('None', 'None'), ('Re-estimated', 'Re-estimated')] | - | False | False | True | - |
| `x_studio_receive_at_centre` | Receive at Centre | `boolean` | - | - | - | True | False | False | - |
| `x_studio_receive_at_factory` | Receive at Factory | `boolean` | - | - | - | True | False | False | - |
| `x_studio_related_field_FNjnC` | New Related Field | `one2many` | project.task | - | - | False | False | True | - |
| `x_studio_related_field_QuqN1` | New Related Field | `integer` | - | - | - | True | False | True | - |
| `x_studio_related_information` | Related Information | `binary` | - | - | - | True | False | False | - |
| `x_studio_reopen_status` | Reopen Status | `selection` | - | [('None', 'None'), ('Reopened', 'Reopened')] | - | True | False | False | - |
| `x_studio_reopened` | Reopened | `boolean` | - | - | - | True | False | False | - |
| `x_studio_reopened_by` | Reopened By | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_reopened_date` | Reopened Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_repair_complete_stage_updated` | Repair Complete Stage Updated | `boolean` | - | - | - | True | False | False | - |
| `x_studio_repair_location` | Repair Location | `many2one` | stock.location | - | - | True | False | False | - |
| `x_studio_repair_reason` | Repair Reason | `many2many` | x_repair_reason_custom | - | - | True | False | False | - |
| `x_studio_repair_serial_created` | Repair Serial Created | `boolean` | - | - | - | True | False | False | - |
| `x_studio_repair_started_stage_updated` | Repair Started Stage Updated | `boolean` | - | - | - | True | False | False | - |
| `x_studio_return_receipt_location` | Return Receipt Location | `many2one` | stock.location | - | - | True | False | False | - |
| `x_studio_rug_approval_status` | RUG Approval Status | `selection` | - | [('Pending RUG Approval', 'Pending RUG Approval'), ('RUG Approved', 'RUG Approved'), ('RUG Rejected', 'RUG Rejected')] | - | False | False | True | - |
| `x_studio_rug_approved` | RUG Approved | `boolean` | - | - | - | True | False | False | - |
| `x_studio_rug_confirmed` | RUG Confirmed | `boolean` | - | - | - | True | False | True | - |
| `x_studio_rug_repair` | Repair Under Warranty | `boolean` | - | - | - | True | False | True | - |
| `x_studio_rug_request_sent` | RUG Request Sent | `boolean` | - | - | - | True | False | False | - |
| `x_studio_s_received_by` | Received By | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_s_received_date` | Received Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_s_shipped_by` | Shipped By | `many2one` | res.users | - | - | True | False | False | - |
| `x_studio_s_shipped_date` | Shipped Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_sale_order` | Sales Order | `many2one` | sale.order | - | - | False | False | True | - |
| `x_studio_sales_price` | Sales Price | `char` | - | - | - | True | False | False | - |
| `x_studio_send_to_centre` | Send to Centre | `boolean` | - | - | - | True | False | False | - |
| `x_studio_send_to_factory` | Send to Factory | `boolean` | - | - | - | True | False | False | - |
| `x_studio_serial_no` | Serial Number | `many2one` | stock.lot | - | - | True | False | False | - |
| `x_studio_serial_number` | Serial Number-11 | `many2one` | stock.lot | - | - | True | False | False | - |
| `x_studio_sn_updated` | SN Updated | `boolean` | - | - | - | True | False | False | - |
| `x_studio_source_location` | Source Location | `many2one` | stock.location | - | - | True | False | True | - |
| `x_studio_source_location_1` | Source Location | `many2one` | stock.location | - | - | True | False | True | - |
| `x_studio_stage_date` | Stage Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_stage_name` | Stage Name | `char` | - | - | - | True | False | True | - |
| `x_studio_task_status` | Task Status | `boolean` | - | - | - | False | False | True | - |
| `x_studio_tracking` | Tracking | `selection` | - | [('serial', 'By Unique Serial Number'), ('lot', 'By Lots'), ('none', 'No Tracking')] | - | False | False | True | - |
| `x_studio_unit_price` | Unit Price | `char` | - | - | - | False | False | True | - |
| `x_studio_user_location_validation` | User Location Validation | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_confirm_return` | Valid Confirm Return | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_confirmed2_so` | Valid Confirmed2 SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_confirmed_so` | Valid Confirmed SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_delivered_so` | Valid Delivered SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_invoiced_so` | Valid Invoiced SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_return` | Valid Return | `boolean` | - | - | - | False | False | True | - |
| `x_studio_vehicle_details` | Vehicle Details | `char` | - | - | - | True | False | False | - |
| `x_studio_virtual_location` | Virtual Location | `many2one` | stock.location | - | - | True | False | True | - |
| `x_studio_virtual_location_1` | Virtual Location | `many2one` | stock.location | - | - | True | False | True | - |
| `x_studio_virtual_location_id` | Virtual Location Id | `integer` | - | - | - | True | False | True | - |
| `x_studio_warranty_card` | Warranty Card | `binary` | - | - | - | True | False | False | - |
| `x_x_studio_created_from_help_ticket_stock_picking_count` | Created from Help Ticket count | `integer` | - | - | - | False | False | False | - |

### 5.2 repair.order — Studio Fields

| Field Name | Label | Type | Relation | Selection Values | Domain | Store | Required | Readonly | Help |
|------------|-------|------|----------|-----------------|--------|-------|----------|----------|------|
| `x_studio_confirm_draft_quotation` | Confirm Draft Quotation | `boolean` | - | - | - | True | False | False | - |

### 5.3 project.task — Studio Fields

| Field Name | Label | Type | Relation | Selection Values | Domain | Store | Required | Readonly | Help |
|------------|-------|------|----------|-----------------|--------|-------|----------|----------|------|
| `x_studio_cancelled` | Cancelled | `boolean` | - | - | - | True | False | True | - |
| `x_studio_created_date` | Created Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_diagnosis_ids` | Diagnosis Ids | `one2many` | x_task_diagnosis | - | - | True | False | False | - |
| `x_studio_end_quick_repair` | End Quick Repair | `boolean` | - | - | - | True | False | False | - |
| `x_studio_fully_invoiced_so` | Fully Invoiced SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_incomplete_delivery_available` | Incomplete Delivery Available | `boolean` | - | - | - | False | False | True | - |
| `x_studio_material_availability` | Material Availability | `selection` | - | [('Material Not Ready', 'Material Not Ready'), ('Material Ready', 'Material Ready')] | - | False | False | True | - |
| `x_studio_payment_type` | Payment Type | `selection` | - | [('Cash', 'Cash'), ('Credit', 'Credit')] | - | True | False | True | - |
| `x_studio_priority` | Priority | `selection` | - | [('Highest', 'Highest'), ('High', 'High'), ('Normal', 'Normal'), ('Low', 'Low'), ('Lowest', 'Lowest')] | - | True | False | False | - |
| `x_studio_quick_repair_status_1` | Quick Repair Status | `selection` | - | [('None', 'None'), ('Quick Repair', 'Quick Repair')] | - | True | False | False | - |
| `x_studio_quotation_type` | Quotation Type | `selection` | - | [('Sales', 'Sales'), ('Project', 'Project'), ('Repair', 'Repair')] | - | True | False | True | - |
| `x_studio_related_information` | Related Information | `binary` | - | - | - | True | False | True | - |
| `x_studio_repair_completed_stage_updated` | Repair Completed Stage Updated | `boolean` | - | - | - | True | False | True | - |
| `x_studio_repair_image_01` | Repair Image 01 | `binary` | - | - | - | True | False | False | - |
| `x_studio_repair_image_02` | Repair Image 02 | `binary` | - | - | - | True | False | False | - |
| `x_studio_repair_reason` | Repair Reason | `many2many` | x_repair_reason | - | - | True | False | False | - |
| `x_studio_starting_date` | Starting Date | `datetime` | - | - | - | True | False | False | - |
| `x_studio_valid_confirm2_so` | Valid Confirm2 SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_confirm_so` | Valid Confirm SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_delivered_so` | Valid Delivered SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_delivered_so2` | Valid Delivered SO2 | `boolean` | - | - | - | True | False | False | - |
| `x_studio_valid_diagnosis` | Valid Diagnosis | `boolean` | - | - | - | False | False | True | - |
| `x_studio_valid_invoiced_so` | Valid Invoiced SO | `boolean` | - | - | - | False | False | True | - |
| `x_studio_warranty_card` | Warranty Card | `binary` | - | - | - | True | False | True | - |

### 5.4 x_model Custom Fields (fields_get summary)

These are the non-standard (x\_studio\_) fields defined on custom Studio models, used as relation targets.

**`x_repair_stages`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_description` | Description | `char` | - | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_repair_reason`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_color` | Color | `integer` | - | True | False | False |
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_repair_reason_custom`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_color` | Color | `integer` | - | True | False | False |
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_repair_accounts`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_rug_account` | RUG Account | `many2one` | account.account | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_repair_sub_reason`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_reason_code` | Reason Code | `many2one` | x_repair_reason | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_diagnosis_areas`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_description` | Description | `char` | - | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_diagnosis_codes`** (4 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_description` | Description | `char` | - | True | False | False |
| `x_studio_diagnosis_area_1` | Diagnosis Area | `many2one` | x_diagnosis_areas | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_symptom_areas`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_description` | Description | `char` | - | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_symptom_codes`** (4 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_description` | Description | `char` | - | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |
| `x_studio_symptom_area` | Symptom Area | `many2one` | x_symptom_areas | True | False | False |

**`x_resolutions`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_description` | Description | `char` | - | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

**`x_conditions`** (3 custom fields)

| Field Name | Label | Type | Relation | Store | Required | Readonly |
|------------|-------|------|----------|-------|----------|----------|
| `x_studio_company_id` | Company | `many2one` | res.company | True | False | False |
| `x_studio_description` | Description | `char` | - | True | False | False |
| `x_studio_sequence` | Sequence | `integer` | - | True | False | False |

---

## 6. SQL Constraints

Total constraints: 88 (unique/check: 3, foreign key: 85)

### 6.1 Unique / Check Constraints

| ID | Name | Model | Type | Definition | Message |
|----|------|-------|------|------------|---------|
| 628 | `project_task_planned_dates_check` | Task | unique | `check((planned_date_begin <= date_deadline))` | The planned start date must be before the planned end date. |
| 4497 | `project_task_recurring_task_has_no_parent` | Task | unique | `check(not(recurring_task is true and parent_id is not null))` | A subtask cannot be recurrent. |
| 4498 | `project_task_private_task_has_no_parent` | Task | unique | `check(not(project_id is null and parent_id is not null))` | A private task cannot have a parent. |

### 6.2 Foreign Key Constraints (reference only)

| ID | Name | Model |
|----|------|-------|
| 2547 | `helpdesk_sla_status_sla_id_fkey` | Helpdesk Ticket |
| 2549 | `helpdesk_ticket_campaign_id_fkey` | Helpdesk Ticket |
| 2550 | `helpdesk_ticket_source_id_fkey` | Helpdesk Ticket |
| 2551 | `helpdesk_ticket_medium_id_fkey` | Helpdesk Ticket |
| 2552 | `helpdesk_ticket_message_main_attachment_id_fkey` | Helpdesk Ticket |
| 2553 | `helpdesk_ticket_team_id_fkey` | Helpdesk Ticket |
| 2554 | `helpdesk_ticket_ticket_type_id_fkey` | Helpdesk Ticket |
| 2555 | `helpdesk_tag_helpdesk_ticket_rel_helpdesk_ticket_id_fkey` | Helpdesk Ticket |
| 2556 | `helpdesk_tag_helpdesk_ticket_rel_helpdesk_tag_id_fkey` | Helpdesk Ticket |
| 2557 | `helpdesk_ticket_company_id_fkey` | Helpdesk Ticket |
| 2558 | `helpdesk_ticket_user_id_fkey` | Helpdesk Ticket |
| 2559 | `helpdesk_ticket_partner_id_fkey` | Helpdesk Ticket |
| 2560 | `helpdesk_ticket_stage_id_fkey` | Helpdesk Ticket |
| 2584 | `helpdesk_ticket_sale_order_id_fkey` | Helpdesk Ticket |
| 2585 | `helpdesk_ticket_product_id_fkey` | Helpdesk Ticket |
| 2586 | `helpdesk_ticket_lot_id_fkey` | Helpdesk Ticket |
| 2587 | `helpdesk_ticket_stock_picking_rel_helpdesk_ticket_id_fkey` | Helpdesk Ticket |
| 2588 | `helpdesk_ticket_stock_picking_rel_stock_picking_id_fkey` | Helpdesk Ticket |
| 2591 | `account_move_helpdesk_ticket_rel_helpdesk_ticket_id_fkey` | Helpdesk Ticket |
| 2592 | `account_move_helpdesk_ticket_rel_account_move_id_fkey` | Helpdesk Ticket |
| ... | *(plus 65 more foreign key constraints)* | |

---

## 7. User Groups

Total custom groups: 4

| ID | Name | Full Name | Category | Description | Users Count |
|----|------|-----------|----------|-------------|-------------|
| 226 | Jin - Repair - Full Rights | Helpdesk / Jin - Repair - Full Rights | Helpdesk (ID:53) | - | 7 |
| 225 | Jin - Repair - Minimum Rights | Helpdesk / Jin - Repair - Minimum Rights | Helpdesk (ID:53) | - | 7 |
| 234 | Jin - Repair - Ticket Creater | Helpdesk / Jin - Repair - Ticket Creater | Helpdesk (ID:53) | - | 7 |
| 178 | Repair Sales Unlock | Sale / Repair Sales Unlock | Sale (ID:66) | - | 3 |

> **Note:** XML IDs for these groups are not available in the database export. Use the group names to reference them.
> Recommended XML IDs to define in the module:
> - `jinasena_helpdesk_repair.group_repair_full_rights`
> - `jinasena_helpdesk_repair.group_repair_minimum_rights`
> - `jinasena_helpdesk_repair.group_repair_ticket_creater`
> - `jinasena_helpdesk_repair.group_repair_sales_unlock`

---

## 8. View Inheritance Chain

### 8.1 helpdesk.ticket — Full View Chain (44 views)

#### View ID:3971 — `helpdesk.ticket.kanban`
- **Type**: `kanban` | **Mode**: `primary` | **Priority**: 10
- **Primary view (no parent)**
- **Active**: True

```xml
<kanban default_group_by="stage_id" class="o_kanban_small_column" sample="1" js_class="helpdesk_ticket_kanban">
                <field name="stage_id" options="{&quot;group_by_tooltip&quot;: {&quot;description&quot;: &quot;Stage Description&quot;}}"/>
                <field name="user_id"/>
                <field name="color"/>
                <field name="priority"/>
                <field name="sla_fail"/>
                <field name="tag_ids"/>
                <field name="active"/>
                <field name="activity_ids"/>
                <field name="activity_state"/>
                <field name="team_id"/>
                <field name="legend_blocked"/>
                <field name="legend_normal"/>
                <field name="legend_done"/>
                <field name="use_rating"/>
                <field name="rating_count"/>
                <field name="rating_avg"/>
                <field name="fold"/>
                <progressbar field="kanban_state" colors="{&quot;done&quot;: &quot;success&quot;, &quot;blocked&quot;: &quot;danger&quot;, &quot;normal&quot;: &quot;200&quot;}"/>
                <templates>
                    <t t-name="kanban-menu">
                        <t t-if="widget.editable"><a type="edit" class="dropdown-item" role="menuitem">Edit</a></t>
                        <t t-if="widget.deletable"><a type="delete" class="dropdown-item" role="menuitem">Delete</a></t>
                        <a name="toggle_active" type="object" class="dropdown-item" role="menuitem" t-if="! record.active.value">Restore</a>
                        <ul class="oe_kanban_colorpicker" data-field="color"/>
                    </t>
                    <t t-name="kanban-box">
                        <div t-attf-class="#{!selection_mode ? kanban_color(record.color.raw_value) : ''} oe_kanban_global_click">
                            <span class="oe_kanban_color_help" t-attf-title="In #{kanban_getcolorname(record.color.raw_value)}" role="img" t-attf-aria-label="In #{kanban_getcolorname(record.color.raw_value)}"/>
                            <div class="oe_kanban_content text-break">
                                <div>
                                    <strong class="o_kanban_record_title"><field name="name"/> (#<field name="ticket_ref"/>)</strong>
                                </div>
                                <div class="o_kanban_record_body">
                                    <field name="commercial_partner_id"/>
                                    <div>
                                        <field name="ticket_type_id"/>
                                    </div>
                                    <field name="tag_ids" widget="many2many_tags" options="{'color_field': 'color'}" invisible="not tag_ids"/>
                                    <field name="use_sla" invisible="1"/>
                                    <div t-if="record.sla_deadline.raw_value &amp;&amp; record.use_sla.raw_value &amp;&amp; !record.fold.raw_value">
                                        <t t-if="luxon.DateTime.fromISO(record.sla_deadline.raw_value) &lt; luxon.DateTime.local()" t-set="red" t-value="'oe_kanban_text_red'"/>
                                        <span t-attf-class="{{red}}">
                                            <field name="sla_deadline" widget="remaining_days"/>
                                        </span>
                                    </div>
                                    <field name="properties" widget="properties"/>
                                </div>
                                <div class="o_kanban_record_bottom">
                                    <div class="oe_kanban_bottom_left">
                                        <field name="priority" widget="priority"/>
                                        <field name="activity_ids" widget="kanban_activity"/>
                                        <b t-if="record.use_rating.raw_value and record.rating_count.raw_value &gt; 0" groups="helpdesk.group_use_rating">
                                            <strong class="fa fa-fw fa-smile-o fa-lg text-success fw-bolder" t-if="record.rating_avg.raw_value &gt;= 3.66" title="Average Rating: Satisfied" role="img" aria-label="Happy face"/>
                                            <strong class="fa fa-fw fa-meh-o fa-lg text-warning fw-bolder" t-elif="record.rating_avg.raw_value &gt;= 2.33" title="Average Rating: Okay" role="img" aria-label="Neutral face"/>
                                            <strong class="fa fa-fw fa-frown-o fa-lg text-danger fw-bolder" t-else="" title="Average Rating: Dissatisfied" role="img" aria-label="Sad face"/>
                                        </b>
                                    </div>
                                    <div class="oe_kanban_bottom_right">
                                        <field name="kanban_state" widget="state_selection" groups="base.group_user"/>
                                        <field t-if="record.user_id.raw_value" name="user_id" widget="many2one_avatar_user"/>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"/>
                        </div>
                    </t>
                </templates>
            </kanban>
```

#### View ID:3967 — `helpdesk.ticket.search`
- **Type**: `search` | **Mode**: `primary` | **Priority**: 15
- **Inherits: ID:6960 `helpdesk.ticket.search.base`**
- **Active**: True

```xml
<data><field name="description" position="after">
                <field name="properties"/>
            </field>
            <filter name="sla_deadline" position="after">
                <separator/>
                <filter string="Properties" name="group_by_properties" context="{'group_by': 'properties'}"/>
            </filter>
            <filter name="archive" position="before">
                <filter string="Unread Messages" name="message_needaction" domain="[('message_needaction', '=', True)]" groups="mail.group_mail_notification_type_inbox"/>
                <separator/>
            </filter>
            <filter name="archive" position="after">
                <separator invisible="1"/>
                <filter invisible="1" string="Late Activities" name="activities_overdue" domain="[('my_activity_date_deadline', '&lt;', context_today().strftime('%Y-%m-%d'))]" help="Show all records which has next action date is before today"/>
                <filter invisible="1" string="Today Activities" name="activities_today" domain="[('my_activity_date_deadline', '=', context_today().strftime('%Y-%m-%d'))]"/>
                <filter invisible="1" string="Future Activities" name="activities_upcoming_all" domain="[('my_activity_date_deadline', '&gt;', context_today().strftime('%Y-%m-%d'))]"/>
            </filter>
        </data>
```

#### View ID:3961 — `helpdesk.ticket.activity`
- **Type**: `activity` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<activity string="Ticket">
                <field name="legend_normal" invisible="1"/>
                <field name="legend_blocked" invisible="1"/>
                <field name="legend_done" invisible="1"/>
                <field name="user_id"/>
                <templates>
                    <div t-name="activity-box">
                        <field t-if="record.user_id.value" name="user_id" widget="many2one_avatar_user" class="m-0"/>
                        <img t-else="" t-att-src="activity_image('res.users', 'image_128', record.user_id.raw_value)" role="img" t-att-title="record.user_id.value" t-att-alt="record.user_id.value" class="me-2"/>
                        <div class="w-100">
                            <div class="d-flex justify-content-between">
                                <span class="o_helpdesk_activity_box_title">
                                    <field name="name" display="full" class="o_text_block"/>
                                </span>
                                <span class="flex-shrink-0">
                                    <field name="kanban_state" nolabel="1" widget="state_selection"/>
                                    <span class="m-1"/>#<field name="ticket_ref"/>
                                </span>
                            </div>
                            <field name="partner_id" muted="1" display="full" class="o_text_block"/>
                        </div>
                    </div>
                </templates>
            </activity>
```

#### View ID:3972 — `helpdesk.ticket.form`
- **Type**: `form` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<form string="Helpdesk Ticket">
                <header>
                    <field name="stage_id" widget="statusbar_duration" options="{'clickable': '1', 'fold_field': 'fold'}"/>
                </header>
                <sheet>
                    <field name="legend_blocked" invisible="1"/>
                    <field name="legend_normal" invisible="1"/>
                    <field name="legend_done" invisible="1"/>
                    <field name="rating_count" invisible="1"/>
                    <field name="use_rating" invisible="1"/>
                    <field name="rating_avg" invisible="1"/>
                    <field name="company_id" invisible="1"/>
                    <field name="team_privacy_visibility" invisible="1"/>
                    <div class="oe_button_box" name="button_box">
                        <button name="action_open_ratings" type="object" class="oe_stat_button" icon="" invisible="not use_rating or rating_count == 0" groups="helpdesk.group_use_rating">
                            <i class="fa fa-fw o_button_icon fa-smile-o text-success" invisible="rating_avg &lt; 3.66" title="Satisfied"/>
                            <i class="fa fa-fw o_button_icon fa-meh-o text-warning" invisible="rating_avg &lt; 2.33 or rating_avg &gt;= 3.66" title="Okay"/>
                            <i class="fa fa-fw o_button_icon fa-frown-o text-danger" invisible="rating_avg &gt;= 2.33" title="Dissatisfied"/>
                            <div class="o_field_widget o_stat_info">
                                <span class="o_stat_value"><field name="rating_avg_text" nolabel="1"/></span>
                                <span class="o_stat_text">Rating</span>
                            </div>
                        </button>
                        <button class="oe_stat_button" type="object" name="action_open_helpdesk_ticket" icon="fa-life-ring" invisible="not partner_id or partner_ticket_count == 0">
                            <div class="o_field_widget o_stat_info">
                                <div class="d-flex align-items-baseline gap-1">
                                    <span class="o_stat_value order-1">
                                        <field name="partner_ticket_count" nolabel="1"/>
                                    </span>
                                    <span class="o_stat_text order-2">Tickets</span>
                                </div>
                                <div class="d-flex align-items-baseline gap-1">
                                    <span class="o_stat_value">
                                        <field name="partner_open_ticket_count" nolabel="1"/>
                                    </span>
                                    <span class="o_stat_text order-2">Open</span>
                                </div>
                            </div>
                        </button>
                    </div>
                    <widget name="web_ribbon" title="Archived" bg_color="text-bg-danger" invisible="active"/>
                    <field name="kanban_state" widget="state_selection"/>
                    <field name="use_sla" invisible="1"/>
                    <field name="fold" invisible="1"/>
                    <div class="oe_title">
                        <h1><field name="name" options="{'line_breaks': False}" widget="text" class="field_name" placeholder="e.g. Product arrived damaged"/></h1>
                    </div>
                    <div class="d-flex mb-4" invisible="not sla_status_ids" groups="helpdesk.group_use_sla">
                        <field name="sla_status_ids" widget="helpdesk_sla_many2many_tags" invisible="not use_sla" options="{'color_field': 'color', 'no_edit_color': True}" class="mb-0" readonly="1" groups="helpdesk.group_use_sla"/>
                        <div invisible="not sla_deadline or not use_sla" groups="helpdesk.group_use_sla" class="mx-2 text-muted d-inline-flex align-items-center h-100">
                            <i class="fa fa-lg fa-clock-o me-2 mt-1" aria-label="Sla Deadline" title="Sla Deadline"/>
                            <field name="sla_deadline" class="mb-0" widget="remaining_days"/>
                        </div>
                    </div>
                    <group class="mb-0 mt-4">
                        <group>
                            <field name="active" invisible="1"/>
                            <field name="team_id" required="1" context="{'kanban_view_ref': 'helpdesk.helpdesk_team_view_kanban_mobile', 'default_use_sla': True}"/>
                            <field name="user_id" class="field_user_id" domain="['&amp;', ('id', 'in', domain_user_ids), ('share', '=', False)]" widget="many2one_avatar_user"/>
                            <field name="domain_user_ids" invisible="1"/>
                            <field name="priority" widget="priority"/>
                            <field name="ticket_type_id" options="{'no_open': True}"/>
                            <field name="tag_ids" widget="many2many_tags" options="{'color_field': 'color', 'no_create_edit': True}"/>
                        </group>
                        <group>
                            <field name="partner_id" class="field_partner_id" domain="['|', ('company_id', '=', False), ('company_id', '=', company_id)]" widget="res_partner_many2one" context="{'default_phone': partner_phone}"/>
                            <field name="is_partner_phone_update" invisible="1"/>
                            <label for="partner_phone" string="Phone"/>
                            <div class="o_row o_row_readonly">
                                <field name="partner_phone" widget="phone" string="Phone"/>
                                <span class="fa fa-exclamation-triangle text-warning oe_edit_only" title="By saving this change, the customer phone number will also be updated." invisible="not is_partner_phone_update"/>
                            </div>
                            <field name="email_cc" groups="base.group_no_one"/>
                        </group>
                    </group>
                    <div class="d-flex">
                        <field name="properties" nolabel="1" columns="2" hideKanbanOption="1"/>
                    </div>
                    <notebook>
                        <field name="display_extra_info" invisible="1"/>
                        <page string="Description" name="description">
                            <field name="description"/>
                        </page>
                        <page string="Extra Info" name="extra_info" invisible="not display_extra_info">
                            <group>
                                <field name="company_id" groups="base.group_multi_company" context="{'create': False}"/>
                            </group>
                        </page>
                    </notebook>
                </sheet>
                <div class="oe_chatter">
                    <field name="message_follower_ids"/>
                    <field name="activity_ids"/>
                    <field name="message_ids" options="{'post_refresh': 'recipients'}"/>
                </div>
            </form>
```

#### View ID:9540 — `helpdesk.ticket.form.assign.to.me`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 16
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<data><!-- Declare computed field so Odoo's view validator accepts it in invisible modifiers -->
            <xpath expr="//field[@name='name']" position="before">
                <field name="repair_stage_state" invisible="1"/>
            </xpath>

            <!-- All workflow buttons appear in the control panel alongside Save/Discard -->
            <xpath expr="//header" position="inside">

                <!-- Visible in New stage only -->
                <button name="action_send_to_factory" type="object" string="Send to Factory" class="btn-primary" invisible="repair_stage_state != 'new'"/>

                <!-- Visible in Sent to Factory stage only -->
                <button name="action_received_at_factory" type="object" string="Received at Factory" class="btn-primary" invisible="repair_stage_state != 'sent_to_factory'"/>

                <!-- Always visible unless already assigned to current user -->
                <button name="action_assign_to_me" type="object" string="Assign to Me" class="btn-secondary" invisible="user_id == uid"/>

            </xpath>
        </data>
```

#### View ID:4005 — `helpdesk.ticket.form.inherit.helpdesk.repair`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 16
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<button name="action_open_helpdesk_ticket" position="before">
                <button class="oe_stat_button" name="action_view_repairs" icon="fa-wrench" type="object" invisible="repairs_count == 0">
                    <field name="repairs_count" string="Repairs" widget="statinfo"/>
                </button>
            </button>
```

#### View ID:3998 — `helpdesk.ticket.form.inherit.invoicing`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 16
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<data><field name="email_cc" position="after">
                <field name="commercial_partner_id" invisible="1"/>
                <field name="sale_order_id" groups="!sales_team.group_sale_salesman" options="{&quot;no_open&quot;: True}" readonly="1" invisible="1"/>
                <field name="sale_order_id" groups="sales_team.group_sale_salesman" options="{&quot;no_create&quot;: True}" readonly="0" invisible="1"/>
            </field>
            <xpath expr="//field[@name='partner_id']" position="attributes">
                <attribute name="context">{'res_partner_search_mode': 'customer',
                                            'default_phone': partner_phone}</attribute>
            </xpath>
        </data>
```

#### View ID:4445 — `helpdesk.ticket.form.inherit.sale`
- **Type**: `tree` | **Mode**: `extension` | **Priority**: 16
- **Inherits: ID:3969 `helpdesk.ticket.tree`**
- **Active**: True

```xml
<xpath expr="//field[@name='partner_id']" position="attributes">
                <attribute name="options">{'no_open': True}</attribute>
                <attribute name="context">{'res_partner_search_mode': 'customer'}</attribute>
            </xpath>
```

#### View ID:4792 — `helpdesk.ticket.form.inherit.sale.timesheet`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 16
- **Inherits: ID:4777 `helpdesk.ticket.form.inherit.timesheet`**
- **Active**: True

```xml
<data><xpath expr="//field[@name='timesheet_ids']" position="attributes">
                <attribute name="widget">so_line_one2many</attribute>
            </xpath>
            <xpath expr="//field[@name='timesheet_ids']/tree" position="inside">
                <field name="timesheet_invoice_id" column_invisible="True"/>
                <field name="is_so_line_edited" column_invisible="True"/>
                <field name="helpdesk_ticket_id" column_invisible="True"/>
            </xpath>
            <xpath expr="//field[@name='timesheet_ids']/tree/field[@name='unit_amount']" position="before">
                <field name="so_line" groups="!sales_team.group_sale_salesman" column_invisible="not parent.use_helpdesk_sale_timesheet or not parent.partner_id" readonly="readonly_timesheet" domain="[('is_service', '=', True), ('order_partner_id', 'child_of', parent.commercial_partner_id), ('is_expense', '=', False), ('state', '=', 'sale')]" optional="show" options="{'no_create': True, 'no_open': True}"/>
                <field name="so_line" groups="sales_team.group_sale_salesman" column_invisible="not parent.use_helpdesk_sale_timesheet or not parent.partner_id" readonly="readonly_timesheet" domain="[('is_service', '=', True), ('order_partner_id', 'child_of', parent.commercial_partner_id), ('is_expense', '=', False), ('state', '=', 'sale')]" context="{'with_remaining_hours': True, 'with_price_unit': True}" optional="hide" options="{'no_create': True, 'no_open': True}"/>
            </xpath>
            <xpath expr="//field[@name='project_id']" position="before">
                <field name="use_helpdesk_sale_timesheet" invisible="1"/>
                <field name="display_invoice_button" invisible="1"/>
            </xpath>
            <xpath expr="//button[@name='action_open_helpdesk_ticket']" position="before">
                <button class="oe_stat_button" type="object" name="action_view_so" icon="fa-dollar" invisible="not use_helpdesk_sale_timesheet or not sale_order_id and not sale_line_id" string="Sales Order" groups="sales_team.group_sale_salesman"/>
                <button class="oe_stat_button" type="object" name="action_view_invoices" icon="fa-pencil-square-o" invisible="not display_invoice_button" string="Invoices" groups="account.group_account_readonly,account.group_account_invoice,account.group_account_manager,sales_team.group_sale_salesman_all_leads">
                    <field name="invoice_count" widget="statinfo" string="Invoices"/>
                </button>
            </xpath>
            <xpath expr="//field[@name='project_id']" position="after">
                <field name="sale_line_id" groups="!sales_team.group_sale_salesman" invisible="not use_helpdesk_sale_timesheet or not partner_id" options="{'no_create': True, 'no_open': True}" context="{'create': False}"/>
                <field name="sale_line_id" groups="sales_team.group_sale_salesman" invisible="not use_helpdesk_sale_timesheet or not partner_id" placeholder="Non-billable" context="{                         'create': False, 'edit': False,                         'with_remaining_hours': True,                         'with_price_unit': True,                         'form_view_ref': 'sale_project.sale_order_line_view_form_editable',                         'default_partner_id': partner_id,                         'default_company_id': company_id,                     }"/>
            </xpath>
            <xpath expr="//field[@name='total_hours_spent']" position="after">
                <t groups="sales_team.group_sale_salesman">
                    <field name="remaining_hours_available" invisible="1"/>
                    <span id="remaining_hours_so_label" invisible="not sale_order_id or not use_helpdesk_sale_timesheet or not partner_id or not sale_line_id or not remaining_hours_available">
                        <label class="fw-bold" for="remaining_hours_so" string="Remaining Hours on SO" invisible="encode_uom_in_days or remaining_hours_so &lt; 0"/>
                        <label class="fw-bold" for="remaining_hours_so" string="Remaining Days on SO" invisible="not encode_uom_in_days or remaining_hours_so &lt; 0"/>
                        <label class="fw-bold text-danger" for="remaining_hours_so" string="Remaining Hours on SO" invisible="encode_uom_in_days or remaining_hours_so &gt;= 0"/>
                        <label class="fw-bold text-danger" for="remaining_hours_so" string="Remaining Days on SO" invisible="not encode_uom_in_days or remaining_hours_so &gt;= 0"/>
                    </span>
                    <field name="remaining_hours_so" nolabel="1" widget="timesheet_uom" invisible="not sale_order_id or not use_helpdesk_sale_timesheet or not partner_id or not sale_line_id or not remaining_hours_available" decoration-danger="remaining_hours_so &lt; 0"/>
                </t>
            </xpath>
        </data>
```

#### View ID:4002 — `helpdesk.ticket.form.inherit.stock`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 16
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<data><button name="action_open_helpdesk_ticket" position="before">
                <button class="oe_stat_button" name="action_view_pickings" icon="fa-truck" type="object" invisible="pickings_count == 0">
                    <field name="pickings_count" string="Returns" widget="statinfo"/>
                </button>
            </button>
            <xpath expr="//page[@name='extra_info']//field[@name='company_id']" position="after">
                <field name="use_credit_notes" invisible="1"/>
                <field name="use_product_returns" invisible="1"/>
                <field name="use_product_repairs" invisible="1"/>
                <field name="suitable_product_ids" invisible="1"/>
                <field name="tracking" invisible="1"/>
            </xpath>
        </data>
```

#### View ID:3999 — `helpdesk.ticket.form.quick_create`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 16
- **Inherits: ID:3970 `helpdesk.ticket.form.quick_create`**
- **Active**: True

```xml
<xpath expr="//field[@name='partner_id']" position="attributes">
                <attribute name="context">{'res_partner_search_mode': 'customer'}</attribute>
            </xpath>
```

#### View ID:3962 — `helpdesk.ticket.graph`
- **Type**: `graph` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<graph string="Helpdesk Tickets" type="bar" sample="1" js_class="helpdesk_ticket_graph">
                <field name="stage_id"/>
                <field name="rating_last_value" string="Rating (/5)"/>
                <field name="avg_response_hours" widget="float_time"/>
                <field name="close_hours" string="Hours to Close" widget="float_time"/>
                <field name="first_response_hours" widget="float_time"/>
                <field name="sla_deadline_hours" widget="float_time"/>
                <field name="assign_hours" string="Hours to Assign" widget="float_time"/>
                <field name="color" invisible="1"/>
                <field name="answered_customer_message_count" invisible="1"/>
                <field name="total_response_hours" invisible="1" widget="float_time"/>
            </graph>
```

#### View ID:3975 — `helpdesk.ticket.graph`
- **Type**: `graph` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<?xml version="1.0"?>
<graph string="Performance Analysis" sample="1">
                <field name="stage_id"/>
                <field name="team_id"/>
                <field name="close_hours" type="measure"/>
            </graph>
        
```

#### View ID:6962 — `helpdesk.ticket.graph.7days.inherit`
- **Type**: `graph` | **Mode**: `primary` | **Priority**: 16
- **Inherits: ID:3962 `helpdesk.ticket.graph`**
- **Active**: True

```xml
<data><xpath expr="//field[@name='stage_id']" position="replace">
                <field name="close_date" interval="day"/>
            </xpath>
            <field name="close_hours" position="replace"/>
            <field name="rating_last_value" position="replace"/>
            <field name="assign_hours" position="replace"/>
        </data>
```

#### View ID:3963 — `helpdesk.ticket.pivot`
- **Type**: `pivot` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<pivot string="Helpdesk Tickets" sample="1" js_class="helpdesk_ticket_pivot">
                <field name="stage_id" type="col"/>
                <field name="rating_last_value" string="Rating (/5)"/>
                <field name="close_hours" string="Hours to Close" widget="float_time"/>
                <field name="assign_hours" string="Hours to Assign" widget="float_time"/>
                <field name="color" invisible="1"/>
                <field name="answered_customer_message_count" invisible="1"/>
                <field name="total_response_hours" invisible="1"/>
            </pivot>
```

#### View ID:3974 — `helpdesk.ticket.pivot`
- **Type**: `pivot` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<?xml version="1.0"?>
<pivot string="Performance Analysis" sample="1">
                <field name="stage_id" type="col"/>
                <field name="name"/>
                <field name="close_hours" type="measure"/>
                <field name="color" invisible="1"/>
            </pivot>
        
```

#### View ID:6963 — `helpdesk.ticket.pivot.7days.inherit`
- **Type**: `pivot` | **Mode**: `primary` | **Priority**: 16
- **Inherits: ID:3963 `helpdesk.ticket.pivot`**
- **Active**: True

```xml
<data><xpath expr="//field[@name='stage_id']" position="replace">
                <field name="close_date" interval="day" type="row"/>
            </xpath>
            <field name="close_hours" position="replace"/>
        </data>
```

#### View ID:3968 — `helpdesk.ticket.search`
- **Type**: `search` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<search string="Tickets Search">
                <field name="name"/>
                <field name="ticket_type_id"/>
                <field name="team_id"/>
                <field name="user_id"/>
                <filter string="My Tickets" domain="[('user_id','=',uid)]" name="my_ticket"/>
                <filter string="Unassigned Tickets" domain="[('user_id','=',False)]" name="unassigned"/>
                <separator/>
                <filter string="Archived" domain="[('active','=',False)]" name="archive"/>
                <separator/>
                <filter name="filter_create_date" date="create_date"/>
                <filter name="filter_assign_date" date="assign_date"/>
                <filter name="filter_sla_deadline" date="sla_deadline"/>
                <filter invisible="1" string="Late Activities" name="activities_overdue" domain="[('my_activity_date_deadline', '&lt;', context_today().strftime('%Y-%m-%d'))]" help="Show all records which has next action date is before today"/>
                <filter invisible="1" string="Today Activities" name="activities_today" domain="[('my_activity_date_deadline', '=', context_today().strftime('%Y-%m-%d'))]"/>
                <filter invisible="1" string="Future Activities" name="activities_upcoming_all" domain="[('my_activity_date_deadline', '&gt;', context_today().strftime('%Y-%m-%d'))]"/>
                <separator/>
                <filter string="SLA Failed" name="sla_failed" domain="[('sla_fail','!=',False)]" groups="helpdesk.group_use_sla"/>
                <group expand="0" string="Group By">
                  <filter string="Assignee" name="assignee" context="{'group_by':'user_id'}"/>
                  <filter string="Helpdesk Team" name="team" context="{'group_by':'team_id'}"/>
                </group>
            </search>
```

#### View ID:3973 — `helpdesk.ticket.search`
- **Type**: `search` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<search string="Tickets Search">
                <field name="name"/>
                <field name="ticket_type_id"/>
                <field name="priority" invisible="1"/>
                <field name="team_id"/>
                <field name="user_id"/>

                <filter string="My Tickets" domain="[('user_id','=',uid)]" name="my_ticket"/>
                <filter string="Unassigned Tickets" domain="[('user_id','=',False)]" name="unassigned"/>
                <separator/>
                <filter string="Open Tickets" domain="[('stage_id.fold', '=', False)]" name="is_open"/>
                <filter string="Closed Tickets" domain="[('stage_id.fold', '=', True)]" name="is_close"/>
                <separator/>
                <filter name="filter_create_date" date="create_date"/>
                <filter name="filter_sla_deadline" date="sla_deadline"/>
                <separator/>
                <filter string="SLA Failed" domain="[('sla_fail','!=',False)]" name="sla_failed" groups="helpdesk.group_use_sla"/>
                <filter string="SLA in Progress" domain="[('sla_fail','=',False)]" name="not_sla_failed" groups="helpdesk.group_use_sla"/>
                <filter string="SLA Success" name="sla_successed" domain="[('sla_success', '=', True)]" groups="helpdesk.group_use_sla"/>
                <separator/>
                <filter string="Archived" domain="[('active','=',False)]" name="archive"/>
                <group expand="0" string="Group By">
                  <filter string="Assignee" name="assignee" context="{'group_by':'user_id'}"/>
                  <filter string="Helpdesk Team" name="team" context="{'group_by':'team_id'}"/>
                  <filter string="Ticket Type" name="ticket_type_id" context="{'group_by':'ticket_type_id'}"/>
                  <filter string="Creation Date" context="{'group_by':'create_date:week'}" name="group_by_create_date"/>
                  <filter string="First Assignment Date" context="{'group_by': 'assign_date:month'}" name="group_by_assign_date"/>
                </group>
            </search>
```

#### View ID:4444 — `helpdesk.ticket.search.inherit.sale`
- **Type**: `search` | **Mode**: `extension` | **Priority**: 16
- **Inherits: ID:6960 `helpdesk.ticket.search.base`**
- **Active**: True

```xml
<data><field name="stage_id" position="after">
                <field name="sale_order_id" string="Sales Order" filter_domain="['|', ('sale_line_id', 'ilike', self), ('sale_order_id', 'ilike', self)]" groups="helpdesk_sale.group_use_helpdesk_sale_timesheet"/>
            </field>
            <xpath expr="//filter[@name='unassigned']" position="after">
                <filter string="My Customers" domain="['|', ('partner_id.user_id', '=', uid), ('sale_order_id.user_id', '=', uid)]" name="my_customers"/>
            </xpath>
        </data>
```

#### View ID:3969 — `helpdesk.ticket.tree`
- **Type**: `tree` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<tree string="Tickets" multi_edit="1" sample="1" default_order="priority desc, sla_deadline, id" js_class="helpdesk_ticket_list">
                <field name="company_id" column_invisible="True"/>
                <field name="use_sla" column_invisible="True"/>
                <field name="fold" column_invisible="True"/>
                <field name="legend_normal" column_invisible="True"/>
                <field name="legend_blocked" column_invisible="True"/>
                <field name="legend_done" column_invisible="True"/>
                <field name="ticket_ref" string="ID" readonly="1" optional="show"/>
                <field name="priority" optional="show" widget="priority"/>
                <field name="name" string="Name"/>
                <field name="team_id" optional="show" readonly="1" column_invisible="context.get('default_team_id', False)"/>
                <field name="team_id" optional="hide" readonly="1" column_invisible="not context.get('default_team_id', False)"/>
                <field name="user_id" optional="show" widget="many2one_avatar_user" options="{'no_quick_create': True}"/>
                <field name="partner_id" domain="['|', ('company_id', '=', False), ('company_id', '=', company_id)]" optional="show" options="{'no_open': True}"/>
                <field name="company_id" groups="base.group_multi_company" optional="show" readonly="1" column_invisible="context.get('default_team_id', False)"/>
                <field name="company_id" groups="base.group_multi_company" optional="hide" readonly="1" column_invisible="not context.get('default_team_id', False)"/>
                <field name="activity_ids" widget="list_activity" optional="show"/>
                <field name="my_activity_date_deadline" string="My Deadline" widget="remaining_days" optional="hide"/>
                <field name="sla_status_ids" widget="helpdesk_sla_many2many_tags" options="{'color_field': 'color'}" string="SLAs" optional="hide" readonly="1" invisible="not use_sla"/>
                <field name="sla_deadline" invisible="not use_sla or fold" optional="show" widget="remaining_days"/>
                <field name="create_date" optional="hide" readonly="1" string="Creation Date"/>
                <field name="write_date" optional="hide" readonly="1"/>
                <field name="ticket_type_id" options="{'no_create_edit': True}" optional="hide"/>
                <field name="tag_ids" optional="hide" widget="many2many_tags" options="{'color_field': 'color'}"/>
                <field name="properties"/>
                <!-- To Do: remove me in master -->
                <field name="rating_last_text" string="Rating" decoration-danger="rating_last_text == 'ko'" decoration-warning="rating_last_text == 'ok'" decoration-success="rating_last_text == 'top'" column_invisible="1" class="fw-bold" widget="badge" optional="hide"/>
                <field name="rating_avg_text" string="Rating" decoration-danger="rating_avg_text == 'ko'" decoration-warning="rating_avg_text == 'ok'" decoration-success="rating_avg_text == 'top'" invisible="rating_avg_text == 'none'" class="fw-bold" widget="badge" optional="hide"/>
                <field name="kanban_state" nolabel="1" optional="show" widget="state_selection"/>
                <field name="stage_id" optional="show" readonly="not context.get('default_team_id', False)"/>
            </tree>
```

#### View ID:6961 — `helpdesk.ticket.tree.group.stage`
- **Type**: `tree` | **Mode**: `primary` | **Priority**: 16
- **Inherits: ID:3969 `helpdesk.ticket.tree`**
- **Active**: True

```xml
<tree position="attributes">
                    <attribute name="default_group_by">stage_id</attribute>
                </tree>
```

#### View ID:4151 — `helpdesk.ticket.view.cohort`
- **Type**: `cohort` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<cohort string="Tickets" date_start="create_date" date_stop="close_date" interval="day" sample="1">
                <field name="rating_last_value" string="Rating (/5)"/>
                <field name="close_hours" string="Hours to Close"/>
                <field name="assign_hours" string="Hours to Assign"/>
                <field name="color" invisible="1"/>
                <field name="answered_customer_message_count" invisible="1"/>
                <field name="total_response_hours" invisible="1"/>
            </cohort>
```

#### View ID:4777 — `helpdesk.ticket.form.inherit.timesheet`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 20
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<data><field name="stage_id" position="before">
                    <field name="display_timer" invisible="1"/>
                    <field name="display_timesheet_timer" invisible="1"/>
                    <field name="timer_pause" invisible="1"/>
                    <field name="display_timer_start_primary" invisible="1"/>
                    <field name="display_timer_start_secondary" invisible="1"/>
                    <field name="display_timer_stop" invisible="1"/>
                    <field name="display_timer_pause" invisible="1"/>
                    <field name="display_timer_resume" invisible="1"/>
                    <field name="encode_uom_in_days" invisible="1"/>
                    <button class="btn-primary" name="action_timer_start" type="object" string="Start" data-hotkey="z" invisible="not display_timer_start_primary or not display_timer"/>
                    <button class="btn-secondary" name="action_timer_start" type="object" string="Start" data-hotkey="z" invisible="not display_timer_start_secondary or not display_timer"/>
                    <button class="btn-primary o_fsm_stop" name="action_timer_stop" type="object" string="Stop" data-hotkey="z" invisible="not display_timer_stop or not display_timer"/>
                    <button class="btn-secondary" name="action_timer_pause" type="object" string="Pause" data-hotkey="w" invisible="not display_timer_pause or not display_timer"/>
                    <button class="btn-secondary" name="action_timer_resume" type="object" string="Resume" data-hotkey="w" invisible="not display_timer_resume or not display_timer"/>
                    <field name="timer_start" widget="timer_start_field" class="d-flex align-self-center me-auto ms-2 h2" invisible="not display_timer"/>
                </field>
                <xpath expr="//field[@name='stage_id']" position="attributes">
                    <attribute name="class">ms-2</attribute>
                </xpath>
            <xpath expr="//field[@name='email_cc']" position="after">
                <field name="use_helpdesk_timesheet" invisible="1"/>
                <field name="project_id" invisible="1"/>
            </xpath>
            <xpath expr="//page[@name='extra_info']//field[@name='company_id']" position="after">
                <field name="analytic_account_id" groups="analytic.group_analytic_accounting" invisible="not use_helpdesk_timesheet"/>
            </xpath>
            <xpath expr="//page[@name='description']" position="after">
                <page string="Timesheets" name="timesheets" invisible="not project_id or not use_helpdesk_timesheet" groups="hr_timesheet.group_hr_timesheet_user">
                    <field name="timesheet_ids" mode="tree,kanban" context="{'default_project_id': project_id}">
                        <tree editable="bottom" string="Timesheet Activities" default_order="date" decoration-muted="readonly_timesheet == True">
                            <field name="readonly_timesheet" column_invisible="True"/>
                            <field name="date" readonly="readonly_timesheet"/>
                            <field name="user_id" column_invisible="True"/>
                            <field name="employee_id" widget="many2one_avatar_employee" required="1" readonly="readonly_timesheet"/>
                            <field name="name" required="0" readonly="readonly_timesheet"/>
                            <field name="unit_amount" widget="timesheet_uom" decoration-danger="unit_amount &gt; 24" readonly="readonly_timesheet"/>
                            <field name="project_id" column_invisible="True"/>
                            <field name="task_id" column_invisible="True"/>
                            <field name="company_id" column_invisible="True"/>
                        </tree>
                        <kanban class="o_kanban_mobile">
                            <field name="date"/>
                            <field name="user_id"/>
                            <field name="employee_id"/>
                            <field name="name"/>
                            <field name="unit_amount"/>
                            <field name="project_id"/>
                            <templates>
                                <t t-name="kanban-box">
                                    <div t-attf-class="oe_kanban_card oe_kanban_global_click">
                                        <div class="row">
                                            <div class="col-6">
                                                <strong><span><t t-out="record.employee_id.value"/></span></strong>
                                            </div>
                                            <div class="col-6 float-end text-end">
                                                <strong><t t-out="record.date.value"/></strong>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6 text-muted">
                                                <span><t t-out="record.name.value"/></span>
                                            </div>
                                            <div class="col-6">
                                                <span class="float-end text-end">
                                                    <field name="unit_amount" widget="float_time" decoration-danger="unit_amount &gt; 24"/>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </t>
                            </templates>
                        </kanban>
                        <form string="Timesheet Activities">
                            <sheet>
                                <group>
                                    <field name="readonly_timesheet" invisible="1"/>
                                    <field name="date" readonly="readonly_timesheet"/>
                                    <field name="user_id" invisible="1"/>
                                    <field name="employee_id" required="1" readonly="readonly_timesheet"/>
                                    <field name="name" required="0" readonly="readonly_timesheet"/>
                                    <field name="unit_amount" string="Duration" widget="float_time" decoration-danger="unit_amount &gt; 24" readonly="readonly_timesheet"/>
                                    <field name="project_id" invisible="1"/>
                                    <field name="company_id" invisible="1"/>
                                </group>
                            </sheet>
                        </form>
                    </field>
                    <group>
                        <group class="oe_subtotal_footer" name="ticket_hours">
                            <span>
                                <label class="fw-bold" for="total_hours_spent" string="Hours Spent" invisible="encode_uom_in_days"/>
                                <label class="fw-bold" for="total_hours_spent" string="Days Spent" invisible="not encode_uom_in_days"/>
                            </span>
                            <field name="total_hours_spent" widget="timesheet_uom" nolabel="1"/>
                        </group>
                    </group>
                </page>
            </xpath>
        </data>
```

#### View ID:4010 — `helpdesk.ticket.form.inherit.invoicing`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 30
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<data><field name="stage_id" position="before">
                <field name="use_credit_notes" invisible="1"/>
                <button name="1812" type="action" string="Refund" groups="account.group_account_invoice" invisible="not use_credit_notes or not partner_id" context="{'default_helpdesk_ticket_id': id, 'default_company_id': company_id}" data-hotkey="x"/>
            </field>
            <button name="action_open_helpdesk_ticket" position="before">
                <!-- To do: remove in master -->
                <button class="oe_stat_button d-none" name="action_view_invoices" icon="fa-pencil-square-o" type="object" invisible="invoices_count == 0" groups="account.group_account_invoice">
                    <field name="invoices_count" string="Credit Notes" widget="statinfo"/>
                </button>
                <button class="oe_stat_button" name="action_view_credit_notes" icon="fa-pencil-square-o" type="object" invisible="invoices_count == 0" groups="account.group_account_invoice">
                    <field name="invoices_count" string="Credit Notes" widget="statinfo"/>
                </button>
            </button>
        </data>
```

#### View ID:4474 — `helpdesk.ticket.tree.inherit.stock`
- **Type**: `tree` | **Mode**: `extension` | **Priority**: 40
- **Inherits: ID:3969 `helpdesk.ticket.tree`**
- **Active**: True

```xml
<field name="partner_id" position="after">
                <field name="suitable_product_ids" column_invisible="True"/>
                <field name="product_id" optional="hide"/>
            </field>
```

#### View ID:4003 — `helpdesk.ticket.form.inherit.return.stock.user`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 45
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<field name="stage_id" position="before">
                <field name="has_partner_picking" invisible="1" groups="stock.group_stock_user"/>
                <field name="use_product_returns" invisible="1" groups="stock.group_stock_user"/>
                <button type="action" name="195" groups="stock.group_stock_user" string="Return" invisible="not has_partner_picking or not use_product_returns" context="{'default_ticket_id': id, 'default_company_id': company_id}" data-hotkey="q"/>
            </field>
```

#### View ID:4006 — `helpdesk.ticket.form.inherit.repair.stock.user`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 50
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<field name="stage_id" position="before">
                <field name="use_product_repairs" invisible="1" groups="stock.group_stock_user"/>
                <button name="action_repair_order_form" type="object" groups="stock.group_stock_user" string="Repair" invisible="not use_product_repairs" data-hotkey="t"/>
            </field>
```

#### View ID:6664 — `helpdesk.ticket.cohort.inherit.timesheet`
- **Type**: `cohort` | **Mode**: `extension` | **Priority**: 70
- **Inherits: ID:4151 `helpdesk.ticket.view.cohort`**
- **Active**: True

```xml
<field name="assign_hours" position="after">
                <field name="total_hours_spent" string="Hours Spent"/>
            </field>
```

#### View ID:6663 — `helpdesk.ticket.graph.inherit.timesheet`
- **Type**: `graph` | **Mode**: `extension` | **Priority**: 70
- **Inherits: ID:3962 `helpdesk.ticket.graph`**
- **Active**: True

```xml
<field name="assign_hours" position="after">
                <field name="total_hours_spent" string="Hours Spent" widget="timesheet_uom"/>
            </field>
```

#### View ID:6662 — `helpdesk.ticket.pivot.inherit.timesheet`
- **Type**: `pivot` | **Mode**: `extension` | **Priority**: 70
- **Inherits: ID:3963 `helpdesk.ticket.pivot`**
- **Active**: True

```xml
<field name="assign_hours" position="after">
                <field name="total_hours_spent" string="Hours Spent" widget="timesheet_uom"/>
            </field>
```

#### View ID:4779 — `helpdesk.ticket.tree.inherit.timesheet`
- **Type**: `tree` | **Mode**: `extension` | **Priority**: 70
- **Inherits: ID:3969 `helpdesk.ticket.tree`**
- **Active**: True

```xml
<field name="partner_id" position="after">
                <field name="total_hours_spent" widget="timesheet_uom" optional="hide" invisible="total_hours_spent == 0" sum="Total"/>
                <field name="analytic_account_id" groups="analytic.group_analytic_accounting" options="{'no_quick_create': True}" optional="hide"/>
            </field>
```

#### View ID:6257 — `helpdesk.ticket.close.analysis.graph.inherit`
- **Type**: `graph` | **Mode**: `primary` | **Priority**: 80
- **Inherits: ID:3962 `helpdesk.ticket.graph`**
- **Active**: True

```xml
<field name="stage_id" position="replace">
                <field name="name"/>
            </field>
```

#### View ID:6256 — `helpdesk.ticket.close.analysis.pivot.inherit`
- **Type**: `pivot` | **Mode**: `primary` | **Priority**: 80
- **Inherits: ID:3963 `helpdesk.ticket.pivot`**
- **Active**: True

```xml
<field name="stage_id" position="replace">
                <field name="name" type="row"/>
            </field>
```

#### View ID:3994 — `helpdesk.ticket.form.inherit`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 80
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<data><xpath expr="header" position="inside">
                    <field name="use_fsm" invisible="1"/>
                    <button class="btn btn-secondary" name="action_generate_fsm_task" type="object" string="Plan Intervention" groups="industry_fsm.group_fsm_user" invisible="not use_fsm" data-hotkey="w"/>
                </xpath>
                <xpath expr="//button[@name='action_open_helpdesk_ticket']" position="before">
                    <button class="oe_stat_button" name="action_view_fsm_tasks" type="object" icon="fa-tasks" invisible="fsm_task_count == 0" groups="industry_fsm.group_fsm_user">
                        <field string="Tasks" name="fsm_task_count" widget="statinfo"/>
                    </button>
                </xpath>
            </data>
```

#### View ID:6254 — `helpdesk.ticket.graph.inherit.all.ticket`
- **Type**: `graph` | **Mode**: `primary` | **Priority**: 80
- **Inherits: ID:3962 `helpdesk.ticket.graph`**
- **Active**: True

```xml
<field name="stage_id" position="replace">
                <field name="team_id"/>
                <field name="answered_customer_message_count" invisible="1"/>
                <field name="total_response_hours" invisible="1" widget="float_time"/>
            </field>
```

#### View ID:6255 — `helpdesk.ticket.pivot.inherit.all.ticket`
- **Type**: `pivot` | **Mode**: `primary` | **Priority**: 81
- **Inherits: ID:3963 `helpdesk.ticket.pivot`**
- **Active**: True

```xml
<field name="stage_id" position="after">
                <field name="create_date" type="row" interval="day"/>
                <field name="answered_customer_message_count" invisible="1"/>
                <field name="total_response_hours" invisible="1"/>
            </field>
```

#### View ID:8164 — `Tickets: Website`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 90
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<data><xpath expr="//field[@name='tag_ids']" position="after">
                <field name="use_website_helpdesk_forum" invisible="1"/>
                <field name="can_share_forum" invisible="1"/>
            </xpath>
            <xpath expr="//header" position="inside">
                <button name="action_share_ticket_on_forum" invisible="not can_share_forum" type="object" string="Share on Forum" data-hotkey="f"/>
            </xpath>
            <xpath expr="//button[@name='action_open_helpdesk_ticket']" position="before">
                <button name="action_open_forum_posts" type="object" class="oe_stat_button" icon="fa-comments" invisible="not use_website_helpdesk_forum or forum_post_count == 0">
                    <field name="forum_post_count" string="Forum Posts" widget="statinfo"/>
                </button>
            </xpath>
        </data>
```

#### View ID:4795 — `helpdesk.ticket.tree.inherit.sale.timesheet`
- **Type**: `tree` | **Mode**: `extension` | **Priority**: 90
- **Inherits: ID:3969 `helpdesk.ticket.tree`**
- **Active**: True

```xml
<field name="partner_id" position="after">
                <field name="sale_line_id" readonly="1" optional="hide" groups="helpdesk_sale.group_use_helpdesk_sale_timesheet"/>
            </field>
```

#### View ID:4012 — `Odoo Studio: helpdesk.ticket.form customization`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 99
- **Inherits: ID:3972 `helpdesk.ticket.form`**
- **Active**: True

```xml
<data>
  <xpath expr="//button[@name='195']" position="attributes">
    <attribute name="invisible">False</attribute>
  </xpath>
  <xpath expr="//button[@name='action_repair_order_form']" position="attributes">
    <attribute name="invisible">False</attribute>
  </xpath>
  <xpath expr="//field[@name='team_id']" position="attributes">
    <attribute name="force_save">1</attribute>
    <attribute name="readonly">x_studio_rug_approved == True or x_studio_rug_request_sent == True or x_studio_stage_name != "New" or x_studio_valid_return == True or x_studio_cancelled == True</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='user_id']" position="attributes">
    <attribute name="force_save">1</attribute>
    <attribute name="readonly">x_studio_rug_approved == True or x_studio_rug_request_sent == True or x_studio_stage_name != "New" or x_studio_valid_return == True or x_studio_cancelled == True</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='user_id']" position="after">
    <xpath expr="//field[@name='ticket_type_id']" position="move"/>
  </xpath>
  <xpath expr="//field[@name='domain_user_ids']" position="after">
    <field name="x_studio_rug_repair" force_save="1" readonly="True" invisible="x_studio_rug_repair != True"/>
    <field name="x_studio_rug_confirmed" force_save="1" readonly="True" invisible="x_studio_rug_confirmed != True"/>
    <field name="x_studio_normal_repair_with_serial_no" force_save="1" readonly="True" invisible="x_studio_normal_repair_with_serial_no != True"/>
    <field name="x_studio_normal_repair_without_serial_no" force_save="1" readonly="True" invisible="x_studio_normal_repair_without_serial_no != True"/>
    <field name="x_studio_return_receipt_location" options="{'no_create': True}" required="user_id" force_save="1" readonly="x_studio_rug_approved == True or x_studio_rug_request_sent == True or x_studio_valid_confirm_return == True or x_studio_repair_serial_created == True or x_studio_cancelled == True or not user_id"/>
    <field name="x_studio_repair_location" invisible="False" force_save="1" readonly="True"/>
    <field name="x_studio_repair_reason" widget="many2many_tags" required="user_id" force_save="1" readonly="x_studio_cancelled == True or not user_id or x_studio_stage_name != &quot;New&quot;"/>
    <field name="x_studio_job_location" required="x_studio_valid_confirm_return == True" force_save="0" readonly="False"/>
  </xpath>
  <xpath expr="//field[@name='tag_ids']" position="attributes">
    <attribute name="invisible">True</attribute>
  </xpath>
  <xpath expr="//field[@name='tag_ids']" position="after">
    <field name="x_studio_re_estimate_status" force_save="1" readonly="True"/>
    <field name="x_studio_re_estimate_count" widget="many2one_reference" options="{'enable_formatting': false}" force_save="1" readonly="True"/>
  </xpath>
  <xpath expr="//field[@name='partner_id']" position="attributes">
    <attribute name="force_save">0</attribute>
    <attribute name="readonly">False</attribute>
    <attribute name="required">user_id</attribute>
  </xpath>
  <xpath expr="//field[@name='partner_id']" position="after">
    <field name="partner_name" invisible="partner_id" force_save="1" readonly="x_studio_cancelled == True or not user_id"/>
    <field name="partner_email" string="Email" force_save="1" readonly="x_studio_cancelled == True or not user_id or x_studio_stage_name == &quot;Handed Over to Customer&quot; or x_studio_stage_name == &quot;Cancelled&quot;"/>
  </xpath>
  <xpath expr="//field[@name='partner_phone']" position="attributes">
    <attribute name="force_save">1</attribute>
    <attribute name="readonly">x_studio_cancelled == True or not user_id</attribute>
  </xpath>
  <xpath expr="//field[@name='email_cc']" position="attributes">
    <attribute name="force_save">1</attribute>
    <attribute name="readonly">x_studio_cancelled == True or not user_id</attribute>
  </xpath>
  <xpath expr="//field[@name='email_cc']" position="after">
    <field name="x_studio_serial_no" invisible="product_id and x_studio_tracking != &quot;serial&quot;" required="x_studio_rug_repair == True or x_studio_normal_repair_with_serial_no == True" force_save="1" readonly="x_studio_rug_approved == True or x_studio_rug_request_sent == True or x_studio_normal_repair_without_serial_no == True or not ticket_type_id or x_studio_stage_name != &quot;New&quot; or x_studio_valid_return == True or x_studio_cancelled == True or not user_id"/>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[2]/field[@name='sale_line_id']" position="after">
    <field name="product_id" invisible="not use_credit_notes and not use_product_returns and not use_product_repairs" required="x_studio_normal_repair_with_serial_no == True" force_save="0" readonly="False"/>
    <xpath expr="//field[@name='commercial_partner_id']" position="move"/>
    <field name="x_studio_send_to_factory" invisible="True"/>
    <field name="x_studio_receive_at_factory" invisible="True"/>
    <field name="x_studio_send_to_centre" invisible="True"/>
    <field name="x_studio_receive_at_centre" invisible="True"/>
    <field name="x_studio_valid_confirm_return" invisible="True"/>
    <field name="x_studio_handed_over" invisible="True"/>
    <field name="x_studio_tracking" force_save="1" readonly="True"/>
    <field name="x_studio_repair_serial_created" invisible="True"/>
    <field name="x_studio_rug_approval_status" invisible="True"/>
    <field name="x_studio_source_location" force_save="1" readonly="True" invisible="company_id != 1"/>
    <field name="x_studio_source_location_1" force_save="1" readonly="True" invisible="company_id != 2"/>
    <field name="x_studio_cancel_reason" invisible="not product_id or ( x_studio_normal_repair_without_serial_no == True and x_studio_repair_serial_created != True )" force_save="1" readonly="x_studio_cancelled == True or x_studio_stage_name == &quot;Estimation Approval Received&quot; or x_studio_stage_name == &quot;Advance Received&quot; or x_studio_stage_name == &quot;Repair Started&quot; or x_studio_stage_name == &quot;Repair Completed&quot; or x_studio_stage_name == &quot;Sent to Sales Centre&quot; or x_studio_stage_name == &quot;Received at Sales Centre&quot; or x_studio_stage_name == &quot;Handed Over to Customer&quot; or x_studio_stage_name == &quot;Cancelled&quot;"/>
    <field name="x_studio_fsm_task_done" invisible="True"/>
    <field name="x_studio_cancelled_2" invisible="True"/>
    <field name="x_studio_qty" invisible="True"/>
    <field name="x_studio_sales_price" invisible="True"/>
    <field name="x_studio_items" widget="many2many_tags"/>
    <field name="x_studio_quick_repair_status" force_save="1" readonly="True"/>
    <field name="x_studio_user_location_validation" invisible="True"/>
    <field name="x_studio_stage_name" invisible="True"/>
    <field name="x_studio_sn_updated" invisible="True"/>
    <field name="x_studio_sale_order" invisible="True"/>
    <field name="x_studio_fully_paid_so" invisible="True"/>
    <field name="x_studio_balance_due" invisible="True"/>
    <field name="x_studio_reopen_status" invisible="True"/>
    <field name="x_studio_cancel_status" invisible="True"/>
    <field name="x_studio_cancelled_stage_id" invisible="True"/>
    <field name="x_studio_reopened" invisible="True"/>
    <field name="x_studio_cancelled" invisible="True"/>
    <field name="x_studio_virtual_location" invisible="True"/>
    <field name="x_studio_virtual_location_1" invisible="True"/>
    <field name="x_studio_virtual_location_id" invisible="True"/>
    <field name="x_studio_valid_return" invisible="x_studio_rug_repair == True or x_studio_serial_no or x_studio_normal_repair_with_serial_no == True or x_studio_normal_repair_without_serial_no == True or ( not use_credit_notes and not use_product_returns and not use_product_repairs )" force_save="1" readonly="x_studio_rug_repair == True"/>
    <field name="x_studio_stage_date" invisible="True"/>
    <field name="x_studio_pick_id" invisible="True"/>
    <field name="x_studio_picking_id" invisible="True"/>
    <xpath expr="//form[1]/sheet[1]/group[1]/group[2]/field[@name='sale_order_id'][2]" position="move"/>
    <xpath expr="//form[1]/sheet[1]/group[1]/group[2]/field[@name='sale_order_id'][2]" position="move"/>
    <xpath expr="//field[@name='display_invoice_button']" position="move"/>
    <field name="x_studio_rug_request_sent" invisible="True"/>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[2]/field[@name='sale_line_id'][2]" position="after">
    <field name="x_studio_rug_approved" invisible="True"/>
    <field name="lot_id" invisible="x_studio_rug_repair == True or x_studio_serial_no or x_studio_normal_repair_with_serial_no == True or x_studio_normal_repair_without_serial_no == True or ( not use_credit_notes and not use_product_returns and not use_product_repairs )" force_save="1" readonly="x_studio_rug_repair == True"/>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]" position="after">
    <notebook name="studio_notebook_2qc_1j0bd1828">
      <page string="Factory Repair Details" name="studio_page_2qc" invisible="x_studio_job_location != &quot;Factory Repair&quot;">
        <group name="studio_group_81h_1j0bd4it8">
          <group name="studio_group_81h_left" string="Repair Transfer Details (Sales Centre)">
            <field name="x_studio_s_shipped_date" force_save="1" readonly="True"/>
            <field name="x_studio_s_shipped_by" force_save="1" readonly="True"/>
            <field name="x_studio_s_received_date" force_save="1" readonly="True"/>
            <field name="x_studio_s_received_by" force_save="1" readonly="True"/>
          </group>
          <group name="studio_group_81h_right" string="Repair Transfer Details (Factory)">
            <field name="x_studio_f_shipped_date" force_save="1" readonly="True"/>
            <field name="x_studio_f_shipped_by" force_save="1" readonly="True"/>
            <field name="x_studio_f_received_date" force_save="1" readonly="True"/>
            <field name="x_studio_f_received_by" force_save="1" readonly="True"/>
          </group>
        </group>
        <group name="studio_group_jm_1j0bd7u5v">
          <group name="studio_group_jm_left" string="Delivery Details">
            <field name="x_studio_driver_name" force_save="1" readonly="True"/>
            <field name="x_studio_vehicle_details" force_save="1" readonly="True"/>
          </group>
          <group name="studio_group_jm_right"/>
        </group>
      </page>
      <page string="Repair Status" name="studio_page_7uo_1j0bd3be1" invisible="True">
        <group name="studio_group_7uo">
          <group name="studio_group_7uo_left" string="Status Log">
            <field name="create_uid"/>
            <field name="create_date"/>
            <field name="x_studio_created_by_1" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_1" force_save="1" readonly="True"/>
            <field name="x_studio_created_by_2" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_2" force_save="1" readonly="True"/>
            <field name="x_studio_created_by_3" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_3" force_save="1" readonly="True"/>
            <field name="x_studio_created_by_4" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_4" force_save="1" readonly="True"/>
          </group>
          <group name="studio_group_7uo_right" string="Status Log">
            <field name="x_studio_created_by_5" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_5" force_save="1" readonly="True"/>
            <field name="x_studio_created_by_6" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_6" force_save="1" readonly="True"/>
            <field name="x_studio_created_by_7" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_7" force_save="1" readonly="True"/>
            <field name="x_studio_created_by_8" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_8" force_save="1" readonly="True"/>
            <field name="x_studio_created_by_9" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_9" force_save="1" readonly="True"/>
            <field name="x_studio_created_by_10" force_save="1" readonly="True"/>
            <field name="x_studio_created_on_10" force_save="1" readonly="True"/>
          </group>
        </group>
      </page>
    </notebook>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/notebook[not(@name)][1]" position="inside">
    <page string="Warranty Details" name="studio_page_2rr_1igln0ot0" invisible="x_studio_normal_repair_without_serial_no == True">
      <group name="studio_group_2rr">
        <group name="studio_group_2rr_left">
          <field name="x_studio_warranty_card" widget="tablet_image" required="x_studio_rug_confirmed == True"/>
        </group>
        <group name="studio_group_2rr_right">
          <field name="x_studio_related_information" widget="tablet_image"/>
        </group>
      </group>
    </page>
    <page string="Cancel/ Reopen Log" name="studio_page_5b5_1igln4fa1">
      <group name="studio_group_5b5">
        <group name="studio_group_5b5_left">
          <field name="x_studio_cancelled_by" force_save="1" readonly="True"/>
          <field name="x_studio_cancelled_date" force_save="1" readonly="True"/>
          <field name="x_studio_reopened_by" force_save="1" readonly="True"/>
          <field name="x_studio_reopened_date" force_save="1" readonly="True"/>
        </group>
      </group>
    </page>
  </xpath>
  <xpath expr="//field[@name='ticket_type_id']" position="attributes">
    <attribute name="force_save">1</attribute>
    <attribute name="readonly">x_studio_rug_approved == True or x_studio_rug_request_sent == True or x_studio_repair_serial_created == True or x_studio_valid_return == True or x_studio_cancelled == True or not user_id or x_studio_stage_name != "New"</attribute>
    <attribute name="required">user_id</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[2]/field[@name='sale_order_id'][2]" position="attributes">
    <attribute name="groups">!sales_team.group_sale_salesman</attribute>
    <attribute name="invisible">False</attribute>
    <attribute name="options">{"no_open": True}</attribute>
    <attribute name="readonly">1</attribute>
  </xpath>
</data>
```

#### View ID:4735 — `Odoo Studio: helpdesk.ticket.kanban customization`
- **Type**: `kanban` | **Mode**: `extension` | **Priority**: 99
- **Inherits: ID:3971 `helpdesk.ticket.kanban`**
- **Active**: True

```xml
<data>
  <xpath expr="//field[@name='ticket_type_id']" position="after">
    <field name="x_studio_quick_repair_status" display="full" invisible="x_studio_quick_repair_status != 'Quick Repair'"/>
    <field name="x_studio_rug_confirmed" display="full" invisible="1"/>
    <field name="x_studio_rug_approval_status" display="full" invisible="x_studio_rug_confirmed != True"/>
    <field name="x_studio_material_availability" display="full"/>
  </xpath>
  <xpath expr="//div[@class='o_kanban_record_body']/field[@name='tag_ids']" position="after">
    <field name="create_date" display="full"/>
    <field name="x_studio_cancel_status" display="full" invisible="x_studio_cancel_status == 'None'"/>
    <field name="x_studio_cancelled_date" display="full" invisible="x_studio_cancel_status == 'None'"/>
    <field name="x_studio_reopen_status" display="full" invisible="x_studio_reopen_status == 'None'"/>
    <field name="x_studio_reopened_date" display="full" invisible="x_studio_reopen_status == 'None'"/>
    <field name="x_studio_stage_date" display="full"/>
  </xpath>
</data>
```

#### View ID:5027 — `Odoo Studio: helpdesk.ticket.tree customization`
- **Type**: `tree` | **Mode**: `extension` | **Priority**: 900
- **Inherits: ID:3969 `helpdesk.ticket.tree`**
- **Active**: True

```xml
<data>
  <xpath expr="//field[@name='partner_id']" position="replace"/>
  <xpath expr="//tree[1]/field[@name='team_id']" position="replace">
    <field name="partner_name" optional="show"/>
    <field name="create_date" optional="show" widget="date"/>
    <field optional="show" name="x_studio_materials_used" string="Materials Used"/>
    <field optional="show" name="x_studio_quantity" string="Quantity"/>
    <field optional="show" name="x_studio_unit_price" string="Unit Price"/>
    <field name="x_studio_items" optional="show" widget="many2many_tags"/>
    <field name="x_studio_qty" optional="show"/>
    <field name="x_studio_sales_price" optional="show"/>
    <field name="close_date" optional="show"/>
  </xpath>
  <xpath expr="//field[@name='legend_done']" position="after">
    <field name="x_studio_sale_order" optional="show"/>
  </xpath>
  <xpath expr="//field[@name='sla_deadline']" position="after">
    <field name="x_studio_repair_reason" optional="show" widget="many2many_tags"/>
  </xpath>
</data>
```

#### View ID:6960 — `helpdesk.ticket.search.base`
- **Type**: `search` | **Mode**: `primary` | **Priority**: 999
- **Primary view (no parent)**
- **Active**: True

```xml
<search string="Tickets Search">
                <field name="name" string="Ticket" filter_domain="['|', ('name', 'ilike', self), ('ticket_ref', 'ilike', self)]"/>
                <field name="tag_ids"/>
                <field name="user_id"/>
                <field name="partner_id" filter_domain="['|', '|', '|', ('partner_id', 'ilike', self), ('partner_email', 'ilike', self), ('partner_phone', 'ilike', self), ('partner_name', 'ilike', self)]"/>
                <field name="team_id" invisible="context.get('default_team_id', False)"/>
                <field name="ticket_type_id"/>
                <field name="stage_id"/>
                <field name="sla_ids" groups="helpdesk.group_use_sla"/>
                <field name="priority" invisible="1"/>
                <field name="company_id" groups="base.group_multi_company" invisible="context.get('default_team_id', False)"/>
                <field name="description"/>

                <filter string="My Tickets" domain="[('user_id','=',uid)]" name="my_ticket"/>
                <filter string="Followed" domain="[('message_is_follower', '=', True)]" name="my_follow_ticket"/>
                <filter string="Unassigned" domain="[('user_id','=',False)]" name="unassigned"/>
                <separator/>
                <filter string="Urgent" domain="[('priority', '=', 3)]" name="urgent_priority"/>
                <filter string="High Priority" domain="[('priority', '=', 2)]" name="high_priority"/>
                <filter string="Medium Priority" domain="[('priority', '=', 1)]" name="medium_priority"/>
                <filter string="Low Priority" domain="[('priority', '=', 0)]" name="low_priority"/>
                <separator groups="helpdesk.group_use_sla"/>
                <filter string="SLA Success" domain="[('sla_success', '=', True)]" name="sla_success" groups="helpdesk.group_use_sla"/>
                <filter string="SLA in Progress" domain="[('sla_status_ids.status', '=', 'ongoing')]" name="sla_inprogress" groups="helpdesk.group_use_sla"/>
                <filter string="SLA Failed" domain="[('sla_fail', '=', True)]" name="sla_failed" groups="helpdesk.group_use_sla"/>
                <separator/>
                <filter string="Open" domain="[('stage_id.fold', '=', False)]" name="is_open"/>
                <filter string="Closed" domain="[('stage_id.fold', '=', True)]" name="is_close"/>
                <filter string="Closed in Last 7 days" name="closed_last_7days" domain="[('close_date','&gt;', (context_today() - datetime.timedelta(days=7)).strftime('%Y-%m-%d'))]"/>
                <filter string="Closed in Last 30 days" name="closed_last_30days" domain="[('close_date', '&gt;', (context_today() - datetime.timedelta(days=30)).strftime('%Y-%m-%d'))]"/>
                <separator/>
                <filter name="rating_satisfied" string="Satisfied" domain="[('rating_avg', '&gt;', 3.66)]" groups="helpdesk.group_use_rating"/>
                <filter name="rating_okay" string="Okay" domain="[('rating_avg', '&lt;', 3.66), ('rating_avg', '&gt;=', 2.33)]" groups="helpdesk.group_use_rating"/>
                <filter name="dissatisfied" string="Dissatisfied" domain="[('rating_avg', '&lt;', 2.33), ('rating_last_value', '!=', 0.0)]" groups="helpdesk.group_use_rating"/>
                <separator/>
                <filter string="Creation Date" date="create_date" name="creation_date"/>
                <separator/>
                <filter string="Archived" domain="[('active', '=', False)]" name="archive"/>
                <group expand="0" string="Group By">
                    <filter string="Assigned to" name="assignee" context="{'group_by':'user_id'}"/>
                    <filter string="Helpdesk Team" name="team" context="{'group_by':'team_id'}" invisible="context.get('default_team_id', False)"/>
                    <filter string="Stage" name="stage" context="{'group_by':'stage_id'}"/>
                    <filter string="Status" name="state" context="{'group_by': 'kanban_state'}"/>
                    <filter string="SLA" name="sla_ids" context="{'group_by': 'sla_ids'}" groups="helpdesk.group_use_sla"/>
                    <filter string="Type" name="ticket_type_id" context="{'group_by':'ticket_type_id'}"/>
                    <filter string="Tags" name="tag" context="{'group_by': 'tag_ids'}"/>
                    <filter string="Priority" name="priority" context="{'group_by': 'priority'}"/>
                    <filter string="Customer" name="partner" context="{'group_by': 'partner_id'}"/>
                    <filter string="Company" name="company" context="{'group_by': 'company_id'}" groups="base.group_multi_company"/>
                    <filter string="Create Date" name="created_by" context="{'group_by': 'create_date'}"/>
                    <filter string="SLA Deadline" name="sla_deadline" context="{'group_by': 'sla_deadline'}" groups="helpdesk.group_use_sla"/>
                </group>
            </search>
```

#### View ID:3970 — `helpdesk.ticket.form.quick_create`
- **Type**: `form` | **Mode**: `primary` | **Priority**: 1000
- **Primary view (no parent)**
- **Active**: True

```xml
<form>
                <group>
                    <field name="stage_id" invisible="1"/>
                    <field name="team_id" invisible="1"/>
                    <field name="legend_normal" invisible="1"/>
                    <field name="legend_blocked" invisible="1"/>
                    <field name="legend_done" invisible="1"/>
                    <field name="name" string="Ticket Title" placeholder="e.g. Product arrived damaged"/>
                    <field name="domain_user_ids" invisible="1"/>
                    <field name="team_id" required="1" invisible="context.get('default_team_id')" options="{'no_open': True}"/>
                    <field name="user_id" domain="[('id', 'in', domain_user_ids)]" options="{'no_open': True}"/>
                    <field name="partner_id" options="{'no_open': True}" widget="res_partner_many2one"/>
                </group>
            </form>
```

### 8.2 repair.order — Full View Chain (9 views)

#### View ID:2096 — `repair.form`
- **Type**: `form` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<form string="Repair Order">
                <field name="unreserve_visible" invisible="1"/>
                <field name="reserve_visible" invisible="1"/>
               <header>
                   <button name="action_validate" invisible="state != 'draft'" type="object" string="Confirm Repair" class="oe_highlight" data-hotkey="v"/>
                   <button name="action_repair_start" invisible="state != 'confirmed'" type="object" string="Start Repair" class="oe_highlight" data-hotkey="q"/>
                   <button name="action_repair_end" invisible="state != 'under_repair'" type="object" string="End Repair" class="oe_highlight" data-hotkey="x"/>
                   <button name="action_assign" invisible="state in ('draft', 'done', 'cancel') or not reserve_visible" string="Check availability" type="object"/>
                   <button name="action_unreserve" type="object" string="Unreserve" invisible="not unreserve_visible" data-hotkey="w"/>
                   <button name="action_create_sale_order" type="object" string="Create Quotation" invisible="state == 'cancel' or sale_order_id"/>
                   <button name="action_repair_cancel" string="Cancel Repair" type="object" invisible="state in ('done', 'cancel')" data-hotkey="l"/>
                   <button name="action_repair_cancel_draft" invisible="state != 'cancel'" string="Set to Draft" type="object" data-hotkey="z"/>
                   <field name="state" widget="statusbar" statusbar_visible="draft,confirmed,under_repair,done"/>
               </header>
               <sheet string="Repairs order">
                    <div class="oe_button_box" name="button_box">
                        <!-- No groups attribute on the next button as "stock.group_stock_user" is needed for Repair, and as this group is granted 'sale.order' read/write accesses in sale_stock module (forcefully loaded as transitive dependency) -->
                        <button name="action_view_sale_order" type="object" string="Sale Order" icon="fa-dollar" class="oe_stat_button" invisible="not sale_order_id">
                            <div class="o_field_widget o_stat_info">
                                <span class="o_stat_value">
                                    <field name="sale_order_id" widget="statinfo" nolabel="1" class="mr4"/>
                                </span>
                                <span class="o_stat_text">Sale Order</span>
                            </div>
                        </button>
                        <button name="1953" type="action" string="Product Moves" class="oe_stat_button" icon="fa-exchange" invisible="state not in ['done', 'cancel']"/>
                    </div>
                    <div class="oe_title">
                        <label class="o_form_label" for="name"/>
                        <h1 class="d-flex">
                            <field name="priority" widget="priority" class="me-3"/>
                            <field name="name"/>
                        </h1>
                    </div>
                    <group>
                        <group>
                            <field name="picking_product_ids" invisible="1"/>
                            <field name="picking_product_id" invisible="1"/>
                            <field name="tracking" invisible="1" readonly="True"/>
                            <field name="company_id" invisible="1"/>
                            <field name="sale_order_id" invisible="1"/>
                            <field name="sale_order_line_id" invisible="1"/>
                            <field name="repair_request" invisible="not sale_order_line_id"/>
                            <field name="partner_id" widget="res_partner_many2one" context="{'res_partner_search_mode': 'customer', 'show_vat': True}" readonly="sale_order_id"/>
                            <field name="product_id" readonly="state in ['cancel', 'done']"/>
                            <field name="lot_id" context="{'default_product_id': product_id, 'default_company_id': company_id}" groups="stock.group_production_lot" options="{'no_create': True, 'no_create_edit': True}" invisible="tracking not in ['serial', 'lot']" readonly="state == 'done'" required="tracking in ['serial', 'lot']"/>
                            <field name="product_uom_category_id" invisible="1"/>
                            <label for="product_qty" invisible="not product_id"/>
                            <div class="o_row" invisible="not product_id">
                                <field name="product_qty" readonly="tracking == 'serial' or state in ('done', 'cancel')"/>
                                <field name="product_uom" groups="uom.group_uom" readonly="state != 'draft'"/>
                            </div>
                            <field name="picking_id" options="{'no_create': True}"/>
                            <field name="under_warranty" readonly="state in ['cancel', 'done']"/>
                        </group>
                        <group>
                            <field name="schedule_date" readonly="state in ['done', 'cancel']"/>
                            <field name="user_id" domain="[('share', '=', False)]"/>
                            <field name="company_id" groups="base.group_multi_company" options="{'no_create': True}"/>
                            <field name="tag_ids" widget="many2many_tags" options="{'color_field': 'color', 'no_create_edit': True}"/>
                            <field name="parts_availability_state" invisible="True"/>
                            <field name="parts_availability" invisible="state not in ['confirmed', 'under_repair']" decoration-success="parts_availability_state == 'available'" decoration-warning="parts_availability_state == 'expected'" decoration-danger="parts_availability_state == 'late'"/>
                        </group>
                    </group>
                <notebook>
                    <page string="Parts" name="parts">
                        <field name="move_ids" readonly="state == 'cancel' or state == 'done'" context="{'default_repair_id': id, 'default_product_uom_qty': 1, 'default_company_id': company_id, 'default_date': schedule_date, 'default_repair_line_type': 'add'}">
                            <tree string="Operations" editable="bottom">
                                <field name="company_id" column_invisible="True"/>
                                <field name="name" column_invisible="True"/>
                                <field name="state" column_invisible="True"/>
                                <field name="repair_line_type" required="1"/>
                                <field name="picking_type_id" column_invisible="True"/>
                                <field name="location_id" column_invisible="True"/>
                                <field name="location_dest_id" column_invisible="True"/>
                                <field name="partner_id" column_invisible="True" readonly="state == 'done'"/>
                                <field name="scrapped" column_invisible="True"/>
                                <field name="picking_code" column_invisible="True"/>
                                <field name="product_type" column_invisible="True"/>
                                <field name="show_details_visible" column_invisible="True"/>
                                <field name="additional" column_invisible="True"/>
                                <field name="move_lines_count" column_invisible="True"/>
                                <field name="is_locked" column_invisible="True"/>
                                <field name="product_uom_category_id" column_invisible="True"/>
                                <field name="has_tracking" column_invisible="True"/>
                                <field name="display_assign_serial" column_invisible="True"/>
                                <field name="product_id" context="{'default_detailed_type': 'product'}" required="1" readonly="(state != 'draft' and not additional) or move_lines_count &gt; 0"/>
                                <field name="description_picking" string="Description" optional="hide"/>
                                <field name="date" optional="hide"/>
                                <field name="date_deadline" optional="hide"/>
                                <field name="product_packaging_id" groups="product.group_stock_packaging"/>
                                <field name="product_uom_qty" string="Demand" readonly="state in ('done', 'cancel')"/>
                                <field name="forecast_expected_date" column_invisible="True"/>
                                <field name="forecast_availability" string="Forecasted" column_invisible="parent.state in ('draft', 'done')" widget="forecast_widget"/>
                                <field name="product_qty" readonly="1" column_invisible="True"/>
                                <field name="quantity" string="Done" readonly="not product_id"/>
                                <field name="product_uom" readonly="state != 'draft' and not additional" options="{'no_open': True, 'no_create': True}" string="Unit of Measure" groups="uom.group_uom"/>
                                <field name="picked" string="Used"/>
                                <field name="lot_ids" widget="many2many_tags" groups="stock.group_production_lot" invisible="not show_details_visible or has_tracking != 'serial'" optional="hide" context="{'default_company_id': company_id, 'default_product_id': product_id}" domain="[('product_id','=',product_id)]"/>
                                <button type="object" name="action_product_forecast_report" title="Forecast Report" icon="fa-area-chart" column_invisible="parent.state != 'draft'" invisible="forecast_availability &lt; 0 and repair_line_type == 'add'"/>
                                <button type="object" name="action_product_forecast_report" title="Forecast Report" icon="fa-area-chart text-danger" column_invisible="parent.state != 'draft'" invisible="forecast_availability &gt;= 0 or repair_line_type != 'add'"/>
                                <button name="action_show_details" type="object" icon="fa-list" width="0.1" title="Details" invisible="not show_details_visible" options="{&quot;warn&quot;: true}" context="{'default_location_dest_id': location_dest_id}"/>
                            </tree>
                        </field>
                        <div class="clearfix"/>
                    </page>
                    <page string="Repair Notes" name="repair_notes">
                        <field name="internal_notes" placeholder="Add internal notes."/>
                    </page>
                    <page string="Miscellaneous" name="page_miscellaneous">
                        <group>
                            <field name="picking_type_id" options="{'no_create': True}" readonly="state != 'draft'"/>
                        </group>
                        <group string="Locations" groups="stock.group_stock_multi_locations" name="locations">
                            <field name="location_id" readonly="state != 'draft'" options="{'no_create': True}"/>
                            <field name="recycle_location_id" readonly="state != 'draft'" options="{'no_create': True}"/>
                        </group>
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

#### View ID:2099 — `repair.graph`
- **Type**: `graph` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<?xml version="1.0"?>
<graph string="Repair Orders" sample="1">
                <field name="create_date"/>
                <field name="product_id"/>
            </graph>
        
```

#### View ID:2097 — `repair.kanban`
- **Type**: `kanban` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<kanban class="o_kanban_mobile" sample="1" quick_create="false">
                <field name="company_id" invisible="1"/>
                <field name="name"/>
                <field name="product_id"/>
                <field name="partner_id"/>
                <field name="state"/>
                <field name="activity_state"/>
                <progressbar field="activity_state" colors="{&quot;planned&quot;: &quot;success&quot;, &quot;today&quot;: &quot;warning&quot;, &quot;overdue&quot;: &quot;danger&quot;}"/>
                <templates>
                    <t t-name="kanban-box">
                        <div t-attf-class="oe_kanban_card oe_kanban_global_click">
                            <div class="row mb4">
                                <div class="col-6">
                                    <strong><span><t t-esc="record.name.value"/></span></strong>
                                </div>
                                <div class="col-6 text-end">
                                    <field name="state" widget="label_selection" options="{'classes': {'draft': 'info', 'cancel': 'danger', 'done': 'success', 'under_repair': 'secondary'}}"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6 text-muted">
                                    <span><t t-esc="record.product_id.value"/></span>
                                    <field name="tag_ids" widget="many2many_tags" options="{'color_field': 'color'}"/>
                                </div>
                                <div class="col-6">
                                    <span class="float-end">
                                        <field name="partner_id"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </t>
                </templates>
            </kanban>
```

#### View ID:7836 — `repair.order.view.activity`
- **Type**: `activity` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<activity string="Activity view">
                <templates>
                    <div t-name="activity-box">
                        <field name="user_id" widget="many2one_avatar_user" domain="[('share', '=', False)]"/>
                        <div>
                            <field name="name" display="full" class="o_text_block o_text_bold"/>
                            <field name="product_id" class="o_text_block"/>
                            <field name="schedule_date" widget="date" class="d-block"/>
                        </div>
                    </div>
                </templates>
            </activity>
```

#### View ID:2100 — `repair.pivot`
- **Type**: `pivot` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<?xml version="1.0"?>
<pivot string="Repair Orders" sample="1">
                <field name="create_date" type="row"/>
                <field name="product_id" type="col"/>
            </pivot>
        
```

#### View ID:2098 — `repair.select`
- **Type**: `search` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<search string="Search Repair Orders">
                <field name="name" string="Repair Order" filter_domain="['|', ('name', 'ilike', self), ('product_id', 'ilike', self)]"/>
                <field name="product_id"/>
                <field name="partner_id" filter_domain="[('partner_id', 'child_of', self)]"/>
                <field name="sale_order_id"/>
                <filter string="New" domain="[('state', '=', 'draft')]" name="filter_draft"/>
                <filter string="Confirmed" domain="[('state', '=', 'confirmed')]" name="filter_confirmed"/>
                <filter string="Under Repair" name="filter_under_repair" domain="[('state', '=', 'under_repair')]"/>
                <filter string="Repaired" name="filter_done" domain="[('state', '=', 'done')]"/>
                <filter string="Cancelled" name="filter_cancel" domain="[('state', '=', 'cancel')]"/>
                <filter string="Returned" name="returned" domain="[('picking_id', '!=', False), ('picking_id.state', '=', 'done')]"/>
                <separator/>
                <filter string="Ready" name="ready" domain="[('state', 'in', ('confirmed', 'under_repair')),('is_parts_available', '=', True)]" invisible="True"/>
                <filter string="Late" name="filter_late" domain="[('state', 'in', ('confirmed', 'under_repair')), '|', ('schedule_date', '&lt;', context_today().strftime('%Y-%m-%d')), ('is_parts_late', '=', True)]"/>
                <filter name="filter_create_date" date="create_date"/>
                <separator/>
                <filter invisible="1" string="Late Activities" name="activities_overdue" domain="[('my_activity_date_deadline', '&lt;', context_today().strftime('%Y-%m-%d'))]" help="Show all records which has next action date is before today"/>
                <filter invisible="1" string="Today Activities" name="activities_today" domain="[('my_activity_date_deadline', '=', context_today().strftime('%Y-%m-%d'))]"/>
                <filter invisible="1" string="Future Activities" name="activities_upcoming_all" domain="[('my_activity_date_deadline', '&gt;', context_today().strftime('%Y-%m-%d'))]"/>
                <group expand="0" string="Group By">
                    <filter string="Customer" name="partner" domain="[]" context="{'group_by': 'partner_id'}"/>
                    <filter string="Product" name="product" domain="[]" context="{'group_by': 'product_id'}"/>
                    <filter string="Status" name="status" domain="[]" context="{'group_by': 'state'}"/>
                    <filter string="Company" name="company" domain="[]" context="{'group_by': 'company_id'}" groups="base.group_multi_company"/>
                </group>
            </search>
```

#### View ID:2095 — `repair.tree`
- **Type**: `tree` | **Mode**: `primary` | **Priority**: 16
- **Primary view (no parent)**
- **Active**: True

```xml
<tree string="Repairs order" multi_edit="1" sample="1" decoration-info="state == 'draft'">
                <field name="company_id" column_invisible="True"/>
                <field name="priority" optional="show" widget="priority" nolabel="1"/>
                <field name="name"/>
                <field name="schedule_date" optional="show" widget="remaining_days"/>
                <field name="product_id" readonly="1" optional="show"/>
                <field name="parts_availability_state" column_invisible="True"/>
                <field name="parts_availability" invisible="state not in ['confirmed', 'under_repair']" optional="show" decoration-success="parts_availability_state == 'available'" decoration-warning="parts_availability_state == 'expected'" decoration-danger="parts_availability_state == 'late'"/>
                <field name="product_qty" optional="hide" string="Quantity" readonly="state != 'draft'"/>
                <field name="product_uom" string="Unit of Measure" readonly="1" groups="uom.group_uom" optional="hide"/>
                <field name="user_id" optional="hide" widget="many2one_avatar_user"/>
                <field name="partner_id" readonly="1" optional="show"/>
                <field name="picking_id" optional="hide"/>
                <field name="is_returned" optional="hide"/>
                <field name="sale_order_id" optional="show"/>
                <field name="location_id" optional="hide"/>
                <field name="company_id" groups="base.group_multi_company" readonly="1" optional="show"/>
                <field name="state" optional="show" widget="badge" decoration-success="state == 'done'" decoration-info="state not in ('done', 'cancel')"/>
                <field name="activity_exception_decoration" widget="activity_exception"/>
            </tree>
```

#### View ID:4014 — `Odoo Studio: repair.form customization`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 99
- **Inherits: ID:2096 `repair.form`**
- **Active**: True

```xml
<data>
  <xpath expr="//field[@name='tag_ids']" position="after">
    <field name="x_studio_confirm_draft_quotation" string="Confirm Draft Quotation" force_save="True" readonly="1"/>
  </xpath>
  <xpath expr="//field[@name='product_packaging_id']" position="after">
    <field name="price_unit" optional="show"/>
  </xpath>
</data>
```

#### View ID:4015 — `Odoo Studio: repair.form customization_button`
- **Type**: `form` | **Mode**: `extension` | **Priority**: 99
- **Inherits: ID:2096 `repair.form`**
- **Active**: True

```xml
<data>
    <xpath expr="//header/button[@name='action_validate']" position="before"> x_studio_confirm_draft_quotation
      <button type="action" name="1814" string="Confirm Draft Quotation" class="btn-primary" invisible="x_studio_confirm_draft_quotation == True"/>
    </xpath>
    
    <xpath expr="//header/button[@name='action_validate']" position="attributes">
      <attribute name="invisible">state != 'draft'</attribute></xpath>
    
    </data>
```

---

## 9. Server Actions with Button Bindings

Total bound server actions: 11 (of 43 total)

### Convert to Task (ID:3027)
- **Model**: `helpdesk.ticket` (binds to: Helpdesk Ticket)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: [31]

```python
action = records.action_convert_to_task()
```

### Customer Preview (ID:3086)
- **Model**: `helpdesk.ticket` (binds to: Helpdesk Ticket)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

```python
action = records.action_customer_preview()
```

### Send Final Notice (ID:2308)
- **Model**: `helpdesk.ticket` (binds to: Helpdesk Ticket)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 66)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
```

### Send Final Notice - Estimated (ID:2309)
- **Model**: `helpdesk.ticket` (binds to: Helpdesk Ticket)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 67)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
```

### Send Final Notice - Scrappage (ID:2310)
- **Model**: `helpdesk.ticket` (binds to: Helpdesk Ticket)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 69)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
```

### Send Reminding Letter (ID:2311)
- **Model**: `helpdesk.ticket` (binds to: Helpdesk Ticket)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 70)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
```

### Send Repair Customer Letter (ID:2269)
- **Model**: `helpdesk.ticket` (binds to: Helpdesk Ticket)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

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

### Share (ID:1784)
- **Model**: `helpdesk.ticket` (binds to: Helpdesk Ticket)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

```python
action = records.action_share()
```

### Convert to Task/Sub-Task (ID:3096)
- **Model**: `project.task` (binds to: Task)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

```python
action = record.action_convert_to_subtask()
```

### Convert to Ticket (ID:3028)
- **Model**: `project.task` (binds to: Task)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: [146]

```python
action = records.action_convert_to_ticket()
```

### Send Report (ID:2010)
- **Model**: `project.task` (binds to: Task)
- **State**: `code`
- **Binding Type**: `action`
- **Groups**: None (all users)

```python
if records:
                action = records.action_send_report()
```

---

## 10. Saved Filters

Total saved filters: 1

| ID | Name | Model | Domain | Context | Sort | Default | User |
|----|------|-------|--------|---------|------|---------|------|
| 112 | Project Plan | `project.task` | `[["parent_id", "ilike", ""]]` | `{'group_by': ['user_ids']}` | `[]` | False | Global |

---

## 11. Configuration

### 11.1 Installed Module Versions


See Section 1 for the full module list with versions.

### 11.2 System Parameters


No `ir.config_parameter` keys found specifically for helpdesk/repair.

### 11.3 Config Settings Note

No repair/helpdesk specific config settings fields found

---

## 12. Developer Notes — Module Structure Recommendation

Based on all data above, the following module structure is recommended:

```
jinasena_helpdesk_repair/
├── __init__.py
├── __manifest__.py
├── models/
│   ├── __init__.py
│   ├── helpdesk_ticket.py          # _inherit helpdesk.ticket, all x_studio_ fields
│   ├── repair_order.py             # _inherit repair.order, x_studio_confirm_draft_quotation
│   ├── project_task.py             # _inherit project.task, x_studio_ fields
│   ├── repair_stages.py            # x_repair_stages model
│   ├── repair_reason.py            # x_repair_reason model
│   ├── repair_reason_custom.py     # x_repair_reason_custom model
│   ├── repair_accounts.py          # x_repair_accounts model
│   ├── repair_sub_reason.py        # x_repair_sub_reason model
│   ├── diagnosis_areas.py          # x_diagnosis_areas model
│   ├── diagnosis_codes.py          # x_diagnosis_codes model
│   ├── symptom_areas.py            # x_symptom_areas model
│   ├── symptom_codes.py            # x_symptom_codes model
│   ├── resolutions.py              # x_resolutions model
│   └── conditions.py              # x_conditions model
├── views/
│   ├── helpdesk_ticket_views.xml   # form/tree/kanban/search view overrides
│   ├── repair_order_views.xml      # repair.order form view overrides
│   ├── repair_stages_views.xml
│   ├── repair_reason_views.xml
│   ├── repair_reason_custom_views.xml
│   ├── repair_accounts_views.xml
│   ├── repair_sub_reason_views.xml
│   ├── diagnosis_areas_views.xml
│   ├── diagnosis_codes_views.xml
│   ├── symptom_areas_views.xml
│   ├── symptom_codes_views.xml
│   ├── resolutions_views.xml
│   └── conditions_views.xml
├── security/
│   ├── ir.model.access.csv         # ACL for all 11 custom models × 4 groups
│   └── security.xml                # 4 group definitions (see Section 7)
├── data/
│   ├── helpdesk_stage_data.xml     # 28 stage records (see Section 4.1)
│   ├── helpdesk_ticket_type_data.xml  # 4 ticket types (see Section 4.2)
│   ├── repair_stages_data.xml      # 5 records
│   ├── repair_reason_data.xml      # 2 records
│   ├── repair_reason_custom_data.xml  # 12 records
│   ├── repair_accounts_data.xml    # 2 records
│   ├── repair_sub_reason_data.xml  # 2 records
│   ├── diagnosis_areas_data.xml    # 6 records
│   ├── diagnosis_codes_data.xml    # 12 records
│   ├── symptom_areas_data.xml      # 1 record
│   ├── symptom_codes_data.xml      # 1 record
│   ├── resolutions_data.xml        # 2 records
│   ├── conditions_data.xml         # 3 records
│   ├── mail_template_data.xml      # 17 email templates
│   ├── sequences_data.xml          # repair.seq and repair.serial.seq + warehouse RO sequences
│   └── server_actions_data.xml     # 11 bound server actions
└── wizard/  (none required)
```

### 12.1 Key Python Classes and _inherit Declarations


```python
# models/helpdesk_ticket.py
class HelpdeskTicket(models.Model):
    _inherit = "helpdesk.ticket"
    # 107 x_studio_ fields (see Section 5.1)
    # Key fields include:
    # - x_studio_balance_due (Float)
    # - x_studio_stage_name (Char, computed from stage)
    # - x_studio_rug_repair (Boolean - Repair Under Warranty)
    # - x_studio_rug_approved (Boolean)
    # - x_studio_serial_no (Many2one -> stock.lot)
    # - x_studio_repair_location (Many2one -> stock.location)
    # - x_studio_sale_order (Many2one -> sale.order)
    # - x_studio_job_location (Selection: Centre Repair / Factory Repair)
    # - x_studio_send_to_factory / x_studio_receive_at_factory (Boolean)
    # - x_studio_send_to_centre / x_studio_receive_at_centre (Boolean)
    # - x_studio_cancelled / x_studio_cancelled_by / x_studio_cancelled_date
    # - x_studio_reopened / x_studio_reopened_by / x_studio_reopened_date
    # - x_studio_repair_reason (Many2many -> x_repair_reason_custom)
    # - x_studio_warranty_card (Binary)
    # - x_studio_related_field_FNjnC (One2many -> project.task)

# models/repair_order.py
class RepairOrder(models.Model):
    _inherit = "repair.order"
    # x_studio_confirm_draft_quotation (Boolean)

# models/project_task.py
class ProjectTask(models.Model):
    _inherit = "project.task"
    # 24 x_studio_ fields (see Section 5.3)
    # Key fields:
    # - x_studio_diagnosis_ids (One2many -> x_task_diagnosis)
    # - x_studio_repair_reason (Many2many -> x_repair_reason)
    # - x_studio_material_availability (Selection, computed)
    # - x_studio_quotation_type (Selection, computed)
    # - x_studio_valid_confirm_so / _delivered_so / _invoiced_so (Boolean, computed)

# models/repair_stages.py
class RepairStages(models.Model):
    _name = "x_repair_stages"
    _description = "Repair Stages"
    x_name = fields.Char("Name", required=True)
    x_studio_description = fields.Char("Description")
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/repair_reason.py
class RepairReason(models.Model):
    _name = "x_repair_reason"
    x_name = fields.Char("Name", required=True)
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_color = fields.Integer("Color")
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/repair_reason_custom.py
class RepairReasonCustom(models.Model):
    _name = "x_repair_reason_custom"
    x_name = fields.Char("Name", required=True)
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_color = fields.Integer("Color")
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/repair_accounts.py
class RepairAccounts(models.Model):
    _name = "x_repair_accounts"
    x_name = fields.Char("Name", required=True)
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_studio_rug_account = fields.Many2one("account.account", "RUG Account")
    x_active = fields.Boolean("Active", default=True)

# models/repair_sub_reason.py
class RepairSubReason(models.Model):
    _name = "x_repair_sub_reason"
    x_name = fields.Char("Name", required=True)
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_reason_code = fields.Many2one("x_repair_reason", "Reason Code")
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/diagnosis_areas.py
class DiagnosisAreas(models.Model):
    _name = "x_diagnosis_areas"
    x_name = fields.Char("Name", required=True)
    x_studio_description = fields.Char("Description")
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/diagnosis_codes.py
class DiagnosisCodes(models.Model):
    _name = "x_diagnosis_codes"
    x_name = fields.Char("Name", required=True)
    x_studio_description = fields.Char("Description")
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_diagnosis_area_1 = fields.Many2one("x_diagnosis_areas", "Diagnosis Area")
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/symptom_areas.py
class SymptomAreas(models.Model):
    _name = "x_symptom_areas"
    x_name = fields.Char("Name", required=True)
    x_studio_description = fields.Char("Description")
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/symptom_codes.py
class SymptomCodes(models.Model):
    _name = "x_symptom_codes"
    x_name = fields.Char("Name", required=True)
    x_studio_description = fields.Char("Description")
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_symptom_area = fields.Many2one("x_symptom_areas", "Symptom Area")
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/resolutions.py
class Resolutions(models.Model):
    _name = "x_resolutions"
    x_name = fields.Char("Name", required=True)
    x_studio_description = fields.Char("Description")
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_company_id = fields.Many2one("res.company", "Company")
    x_active = fields.Boolean("Active", default=True)

# models/conditions.py
class Conditions(models.Model):
    _name = "x_conditions"
    x_name = fields.Char("Name", required=True)
    x_studio_description = fields.Char("Description")
    x_studio_sequence = fields.Integer("Sequence", default=10)
    x_studio_company_id = fields.Many2one("res.company", "Company")
```

### 12.2 Key Data XML Files


Each data XML file should use `<odoo><data noupdate="1">` for master data.
Server actions should use `noupdate="0"` so they update on module upgrade.

**helpdesk_stage_data.xml** — 28 records, each with:
- `helpdesk.stage` records
- Fields: `name`, `sequence`, `fold`, `template_id`, `x_studio_company_id`

**mail_template_data.xml** — 17 templates covering:
- Repair Customer Letter (ID:56)
- Repair Customer Letter-2 (ID:59)
- Repair Final Notice (ID:66)
- Repair Final Notice - Estimated (ID:67)
- Repair Final Notice - Scrappage (ID:69)
- Repair Reminding Letter (ID:70)
- RR- Customer Repair Letter Test variants (IDs: 60, 63, 64, 71)
- Standard helpdesk/task templates (IDs: 8, 9, 39, 40, 41, 45, 47)

**server_actions_data.xml** — 11 actions bound to models:
- helpdesk.ticket (8): Convert to Task, Customer Preview, Send Final Notice variants, Send Repair Customer Letter, Share
- project.task (3): Convert to Task/Sub-Task, Convert to Ticket, Send Report

**sequences_data.xml** — Custom sequences to define:
- `repair.seq` (ID:278): `REPAIR/%(year)s/` prefix, padding=5
- `repair.serial.seq` (ID:279): `REP-SERIAL/%(year)s/` prefix, padding=5
- Helpdesk Ticket sequence (ID:977): code=`helpdesk.ticket`, padding=2
- All warehouse RO sequences (see Section 3.1)

### 12.3 Critical Implementation Notes


1. **Stage Name Computed Field**: `x_studio_stage_name` (Char) is used extensively in form view `invisible` and `readonly` conditions. It should be a stored computed field that syncs with `stage_id.name`.

2. **RUG Flow**: "Repair Under Warranty" (RUG) uses `x_studio_rug_repair`, `x_studio_rug_approved`, `x_studio_rug_request_sent`, `x_studio_rug_confirmed`. These control a multi-step approval workflow.

3. **Job Location**: `x_studio_job_location` (Centre Repair / Factory Repair) controls which transfer details are shown (Section 8.1, view ID:4012). Factory Repair shows factory transfer details tab.

4. **Company-aware Stages**: Both `helpdesk.stage` and all x_model records have `x_studio_company_id`. Stages are duplicated per company (JLD, JAM, JLTD).

5. **Serial Number Tracking**: `x_studio_tracking` mirrors the product's tracking type. `x_studio_serial_no` (Many2one -> stock.lot) is required for RUG and "With Serial No" repair types.

6. **Balance Due**: `x_studio_balance_due` (Float) is referenced in email templates for collection letters.

7. **Ticket Type to Flow Mapping**:
   - ID:1 "Repair - Under Warranty - RUG" → `x_studio_rug=True, x_studio_rug_confirmed=True`
   - ID:2 "Repair - Under Warranty - External not RUG" → `x_studio_rug=True`
   - ID:3 "Repair - Not Under Warranty (With Serial No)" → `x_studio_with_serial_no=True`
   - ID:4 "Repair - Not Under Warranty (Without Serial No)" → `x_studio_without_serial_no=True`

8. **Sequence Code Usage**: The module defines `repair.seq` (for repair orders) and `repair.serial.seq` (for serial number tracking). Reference these codes in `ir.sequence` data files.

9. **Kanban Customization**: View ID:4735 shows `x_studio_quick_repair_status` as "Tested OK" on kanban cards when status = "Quick Repair".

10. **ir.model.access.csv**: Must cover all 11 custom models for the 4 custom groups defined in Section 7.