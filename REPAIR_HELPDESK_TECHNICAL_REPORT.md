# Repair & Helpdesk — Full Technical Report

> **Odoo 17 — Studio Customization Export**
> Generated from `/tmp/repair_technical_dump.json`

## 1. Custom Models (x_ models)

### 1.1 Model: `x_repair_stages` — Repair Stages

- **Technical name:** `x_repair_stages`
- **Label:** Repair Stages

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Repair Stage | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_description` | Description | char |  |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Repair Stages
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Stages group_user | User types / Internal User | Y |  |  |  |
| Repair Stages group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_repair_stages` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Repair Stages">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_ec9e3c">
      <group name="studio_group_ec9e3c_left"/>
      <group name="studio_group_ec9e3c_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_repair_stages` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_repair_stages` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_stages" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_repair_stages customization` — type: `tree` (inherits: Default list view for x_repair_stages)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Repair Stage</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.2 Model: `x_repair_reason` — Repair Reason

- **Technical name:** `x_repair_reason`
- **Label:** Repair Reason

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_color` | Color | integer |  |  |  |  |
| `x_name` | Repair Reason | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Repair Reason
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Reason group_user | User types / Internal User | Y |  |  |  |
| Repair Reason group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_repair_reason` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Repair Reason">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_594a5d">
      <group name="studio_group_594a5d_left"/>
      <group name="studio_group_594a5d_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_repair_reason` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_repair_reason` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_reason" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_repair_reason customization` — type: `tree` (inherits: Default list view for x_repair_reason)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Repair Reason</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.3 Model: `x_repair_reason_custom` — Repair Reason - Customer

- **Technical name:** `x_repair_reason_custom`
- **Label:** Repair Reason - Customer

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_color` | Color | integer |  |  |  |  |
| `x_name` | Repair Reason | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Repair Reason - Customer
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Reason - Customer group_user | User types / Internal User | Y |  |  |  |
| Repair Reason - Customer group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_repair_reason_custom` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Repair Reason - Customer">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_3e77b9">
      <group name="studio_group_3e77b9_left"/>
      <group name="studio_group_3e77b9_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_repair_reason_custom` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_repair_reason_custom` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_reason_custom" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_repair_reason_custom customization` — type: `tree` (inherits: Default list view for x_repair_reason_custom)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Repair Reason</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.4 Model: `x_repair_accounts` — Repair Accounts

- **Technical name:** `x_repair_accounts`
- **Label:** Repair Accounts

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Name | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_rug_account` | RUG Account | many2one | account.account |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Repair Accounts
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Accounts group_user | User types / Internal User | Y |  |  |  |
| Repair Accounts group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_repair_accounts` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Repair Accounts">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_bf46f3">
      <group name="studio_group_bf46f3_left"/>
      <group name="studio_group_bf46f3_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_repair_accounts` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_repair_accounts` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_accounts" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default form view for x_repair_accounts customization` — type: `form` (inherits: Default form view for x_repair_accounts)

```xml
<data>
  <xpath expr="//form[1]" position="attributes">
    <attribute name="create">true</attribute>
  </xpath>
  <xpath expr="//group[@name='studio_group_bf46f3_left']" position="attributes">
    <attribute name="string">RUG Repair Accounts in Invoicing</attribute>
  </xpath>
  <xpath expr="//group[@name='studio_group_bf46f3_left']" position="inside">
    <field name="x_studio_rug_account" string="RUG Account" required="1"/>
  </xpath>
  <xpath expr="//group[@name='studio_group_bf46f3_right']" position="inside">
    <field name="x_studio_company_id" string="Company" force_save="True" readonly="1"/>
  </xpath>
</data>
```

##### View: `Odoo Studio: Default list view for x_repair_accounts customization` — type: `tree` (inherits: Default list view for x_repair_accounts)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="create">true</attribute>
    <attribute name="delete">true</attribute>
    <attribute name="edit">true</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field name="id" optional="show"/>
  </xpath>
</data>
```

### 1.5 Model: `x_repair_sub_reason` — Repair Sub Reason

- **Technical name:** `x_repair_sub_reason`
- **Label:** Repair Sub Reason

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Sub Reason Code | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_reason_code` | Reason Code | many2one | x_repair_reason |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Repair Sub Reason
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Sub Reason group_user | User types / Internal User | Y |  |  |  |
| Repair Sub Reason group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_repair_sub_reason` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Repair Sub Reason">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_88fc7c">
      <group name="studio_group_88fc7c_left"/>
      <group name="studio_group_88fc7c_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_repair_sub_reason` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_repair_sub_reason` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_sub_reason" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_repair_sub_reason customization` — type: `tree` (inherits: Default list view for x_repair_sub_reason)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Sub Reason Code</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_reason_code" string="Reason Code" options="{&quot;no_create&quot;:true}"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.6 Model: `x_diagnosis_areas` — Diagnosis Areas

- **Technical name:** `x_diagnosis_areas`
- **Label:** Diagnosis Areas

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Diagnosis Area | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_description` | Description | char |  |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Diagnosis Areas
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Diagnosis Areas group_user | User types / Internal User | Y |  |  |  |
| Diagnosis Areas group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_diagnosis_areas` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Diagnosis Areas">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_36cd75">
      <group name="studio_group_36cd75_left"/>
      <group name="studio_group_36cd75_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_diagnosis_areas` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_diagnosis_areas` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_diagnosis_areas" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_diagnosis_areas customization` — type: `tree` (inherits: Default list view for x_diagnosis_areas)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Diagnosis Area</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.7 Model: `x_diagnosis_codes` — Diagnosis Codes

- **Technical name:** `x_diagnosis_codes`
- **Label:** Diagnosis Codes

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Diagnosis Code | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_description` | Description | char |  |  |  |  |
| `x_studio_diagnosis_area_1` | Diagnosis Area | many2one | x_diagnosis_areas |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Diagnosis Codes
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Diagnosis Codes group_user | User types / Internal User | Y |  |  |  |
| Diagnosis Codes group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_diagnosis_codes` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Diagnosis Codes">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_484e69">
      <group name="studio_group_484e69_left"/>
      <group name="studio_group_484e69_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_diagnosis_codes` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_diagnosis_codes` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_diagnosis_codes" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_diagnosis_codes customization` — type: `tree` (inherits: Default list view for x_diagnosis_codes)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Diagnosis Code</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_diagnosis_area_1" string="Diagnosis Area" options="{&quot;no_create&quot;:true}"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.8 Model: `x_symptom_areas` — Symptom Areas

- **Technical name:** `x_symptom_areas`
- **Label:** Symptom Areas

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Symptom Area | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_description` | Description | char |  |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Symptom Areas
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Symptom Areas group_user | User types / Internal User | Y |  |  |  |
| Symptom Areas group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_symptom_areas` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Symptom Areas">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_eb0399">
      <group name="studio_group_eb0399_left"/>
      <group name="studio_group_eb0399_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_symptom_areas` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_symptom_areas` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_symptom_areas" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_symptom_areas customization` — type: `tree` (inherits: Default list view for x_symptom_areas)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Symptom Area</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.9 Model: `x_symptom_codes` — Symptom Codes

- **Technical name:** `x_symptom_codes`
- **Label:** Symptom Codes

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Symptom Code | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_description` | Description | char |  |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |
| `x_studio_symptom_area` | Symptom Area | many2one | x_symptom_areas |  |  |  |

#### Window Actions

- **Name:** Symptom Codes
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Symptom Codes group_user | User types / Internal User | Y |  |  |  |
| Symptom Codes group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_symptom_codes` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Symptom Codes">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_4d111b">
      <group name="studio_group_4d111b_left"/>
      <group name="studio_group_4d111b_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_symptom_codes` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_symptom_codes` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_symptom_codes" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_symptom_codes customization` — type: `tree` (inherits: Default list view for x_symptom_codes)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Symptom Code</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_symptom_area" string="Symptom Area" options="{&quot;no_create&quot;:true}"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.10 Model: `x_resolutions` — Resolutions

- **Technical name:** `x_resolutions`
- **Label:** Resolutions

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Resolution | char |  |  |  |  |
| `x_studio_company_id` | Company | many2one | res.company |  |  |  |
| `x_studio_description` | Description | char |  |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |

#### Window Actions

- **Name:** Resolutions
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Resolutions group_user | User types / Internal User | Y |  |  |  |
| Resolutions group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_resolutions` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Resolutions">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_6a461b">
      <group name="studio_group_6a461b_left"/>
      <group name="studio_group_6a461b_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_resolutions` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_resolutions` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_resolutions" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_resolutions customization` — type: `tree` (inherits: Default list view for x_resolutions)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Resolution</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

### 1.11 Model: `x_task_diagnosis` — Task Diagnosis

- **Technical name:** `x_task_diagnosis`
- **Label:** Task Diagnosis

#### Fields

| Field Name | Label | Type | Relation | Selection | Required | Readonly |
|---|---|---|---|---|---|---|
| `x_active` | Active | boolean |  |  |  |  |
| `x_name` | Name | char |  |  |  |  |
| `x_studio_condition` | Condition | many2one | x_conditions |  |  |  |
| `x_studio_description` | Description | char |  |  |  |  |
| `x_studio_diagnosis_area` | Diagnosis Area | many2one | x_diagnosis_areas |  |  |  |
| `x_studio_diagnosis_code` | Diagnosis Code | many2one | x_diagnosis_codes |  |  |  |
| `x_studio_reason` | Reason | many2one | x_repair_reason |  |  |  |
| `x_studio_repair_stage` | Repair Stage | many2one | x_repair_stages |  |  |  |
| `x_studio_resolution` | Resolution | many2one | x_resolutions |  |  |  |
| `x_studio_sequence` | Sequence | integer |  |  |  |  |
| `x_studio_sub_reason` | Sub Reason | many2one | x_repair_sub_reason |  |  |  |
| `x_studio_symptom_area` | Symptom Area | many2one | x_symptom_areas |  |  |  |
| `x_studio_symptom_code` | Symptom Code | many2one | x_symptom_codes |  |  |  |
| `x_studio_task_id` | Task Id | many2one | project.task |  |  |  |

#### Window Actions

- **Name:** Task Diagnosis
  - view_mode: `tree,form`
  - target: `current`

#### Access Rights

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Task Diagnosis group_user | User types / Internal User | Y |  |  |  |
| Task Diagnosis group_system | Administration / Settings | Y | Y | Y | Y |

#### Views

##### View: `Default form view for x_task_diagnosis` — type: `form`

```xml
<form>
  <header/>
  <sheet string="Task Diagnosis">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_39d2e1">
      <group name="studio_group_39d2e1_left"/>
      <group name="studio_group_39d2e1_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

##### View: `Default list view for x_task_diagnosis` — type: `tree`

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

##### View: `Default search view for x_task_diagnosis` — type: `search`

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_task_diagnosis" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

##### View: `Odoo Studio: Default list view for x_task_diagnosis customization` — type: `tree` (inherits: Default list view for x_task_diagnosis)

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_task_id" string="Task Id" column_invisible="1"/>
  </xpath>
</data>
```


## 2. Studio Fields on Standard Models

### 2a. `helpdesk.ticket` — Studio Fields (107 total)

#### Repair Type Flags (Related)

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_rug_repair` | Repair Under Warranty | boolean |  |  | Yes | ticket_type_id.x_studio_rug |
| `x_studio_rug_confirmed` | RUG Confirmed | boolean |  |  | Yes | ticket_type_id.x_studio_rug_confirmed |
| `x_studio_normal_repair_with_serial_no` | Normal Repair (With Serial No) | boolean |  |  | Yes | ticket_type_id.x_studio_with_serial_no |
| `x_studio_normal_repair_without_serial_no` | Normal Repair (Without Serial No) | boolean |  |  | Yes | ticket_type_id.x_studio_without_serial_no |

#### Repair Workflow Status Flags

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_rug_approved` | RUG Approved | boolean |  |  |  |  |
| `x_studio_rug_request_sent` | RUG Request Sent | boolean |  |  |  |  |
| `x_studio_repair_serial_created` | Repair Serial Created | boolean |  |  |  |  |
| `x_studio_valid_return` | Valid Return | boolean |  |  | Yes | computed |
| `x_studio_valid_confirm_return` | Valid Confirm Return | boolean |  |  | Yes | computed |
| `x_studio_send_to_factory` | Send to Factory | boolean |  |  |  |  |
| `x_studio_receive_at_factory` | Receive at Factory | boolean |  |  |  |  |
| `x_studio_send_to_centre` | Send to Centre | boolean |  |  |  |  |
| `x_studio_receive_at_centre` | Receive at Centre | boolean |  |  |  |  |
| `x_studio_handed_over` | Handed Over | boolean |  |  | Yes | computed |
| `x_studio_fsm_task_done` | FSM Task Done | boolean |  |  | Yes | computed |

#### Stage Tracking (Booleans)

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_estimation_sent_stage_updated` | Estimation Sent Stage Updated | boolean |  |  |  |  |
| `x_studio_estimation_approved_stage_updated` | Estimation Approved Stage Updated | boolean |  |  |  |  |
| `x_studio_invoice_stage_updated` | Invoice Stage Updated | boolean |  |  |  |  |
| `x_studio_repair_started_stage_updated` | Repair Started Stage Updated | boolean |  |  |  |  |
| `x_studio_repair_complete_stage_updated` | Repair Complete Stage Updated | boolean |  |  |  |  |

#### Stage Date & Author Log

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_stage_date` | Stage Date | datetime |  |  |  |  |
| `x_studio_stage_name` | Stage Name | char |  |  | Yes | stage_id.name |
| `x_studio_created_by_1` | Created By 1 | many2one | res.users |  |  |  |
| `x_studio_created_on_1` | Created On 1 | datetime |  |  |  |  |
| `x_studio_created_by_2` | Created By 2 | many2one | res.users |  |  |  |
| `x_studio_created_on_2` | Created On 2 | datetime |  |  |  |  |
| `x_studio_created_by_3` | Created By 3 | many2one | res.users |  |  |  |
| `x_studio_created_on_3` | Created On 3 | datetime |  |  |  |  |
| `x_studio_created_by_4` | Created By 4 | many2one | res.users |  |  |  |
| `x_studio_created_on_4` | Created On 4 | datetime |  |  |  |  |
| `x_studio_created_by_5` | Created By 5 | many2one | res.users |  |  |  |
| `x_studio_created_on_5` | Created On 5 | datetime |  |  |  |  |
| `x_studio_created_by_6` | Created By 6 | many2one | res.users |  |  |  |
| `x_studio_created_on_6` | Created On 6 | datetime |  |  |  |  |
| `x_studio_created_by_7` | Created By 7 | many2one | res.users |  |  |  |
| `x_studio_created_on_7` | Created On 7 | datetime |  |  |  |  |
| `x_studio_created_by_8` | Created By 8 | many2one | res.users |  |  |  |
| `x_studio_created_on_8` | Created On 8 | datetime |  |  |  |  |
| `x_studio_created_by_9` | Created By 9 | many2one | res.users |  |  |  |
| `x_studio_created_on_9` | Created On 9 | datetime |  |  |  |  |
| `x_studio_created_by_10` | Created By 10 | many2one | res.users |  |  |  |
| `x_studio_created_on_10` | Created On 10 | datetime |  |  |  |  |

#### Cancellation & Reopening

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_cancelled` | Cancelled | boolean |  |  |  |  |
| `x_studio_cancelled_2` | Cancelled-2 | boolean |  |  |  |  |
| `x_studio_cancel_reason` | Cancel Reason | text |  |  |  |  |
| `x_studio_cancel_status` | Cancel Status | selection | [('None', 'None'), ('Cancelled', 'Cancelled')] |  |  |  |
| `x_studio_cancelled_stage_id` | Cancelled Stage Id | many2one | helpdesk.stage |  |  |  |
| `x_studio_cancelled_by` | Cancelled By | many2one | res.users |  |  |  |
| `x_studio_cancelled_date` | Cancelled Date | datetime |  |  |  |  |
| `x_studio_reopened` | Reopened | boolean |  |  |  |  |
| `x_studio_reopened_by` | Reopened By | many2one | res.users |  |  |  |
| `x_studio_reopened_date` | Reopened Date | datetime |  |  |  |  |
| `x_studio_reopen_status` | Reopen Status | selection | [('None', 'None'), ('Reopened', 'Reopened')] |  |  |  |

#### Product / Serial / Location

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_serial_no` | Serial Number | many2one | stock.lot |  |  |  |
| `x_studio_serial_number` | Serial Number-11 | many2one | stock.lot |  |  |  |
| `x_studio_tracking` | Tracking | selection | [('serial', 'By Unique Serial Number'), ('lot', 'By Lots'), ('none', 'No Trac... |  | Yes | product_id.tracking |
| `x_studio_return_receipt_location` | Return Receipt Location | many2one | stock.location |  |  |  |
| `x_studio_repair_location` | Repair Location | many2one | stock.location |  |  |  |
| `x_studio_source_location` | Source Location | many2one | stock.location |  | Yes | user_id.x_studio_source_location |
| `x_studio_source_location_1` | Source Location | many2one | stock.location |  | Yes | user_id.x_studio_source_location_1 |
| `x_studio_virtual_location` | Virtual Location | many2one | stock.location |  | Yes | user_id.x_studio_virtual_location |
| `x_studio_virtual_location_1` | Virtual Location | many2one | stock.location |  | Yes | user_id.x_studio_virtual_location_1 |
| `x_studio_virtual_location_id` | Virtual Location Id | integer |  |  | Yes | user_id.x_studio_virtual_location.id |
| `x_studio_picking_id` | Picking Id | many2one | stock.picking |  |  |  |
| `x_studio_pick_id` | Pick Id | integer |  |  |  |  |
| `x_studio_repair_reason` | Repair Reason | many2many | x_repair_reason_custom |  |  |  |
| `x_studio_job_location` | Job Location | selection | [('Centre Repair', 'Centre Repair'), ('Factory Repair', 'Factory Repair')] |  |  |  |

#### Factory Transfer Dates

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_s_shipped_date` | Shipped Date | datetime |  |  |  |  |
| `x_studio_s_shipped_by` | Shipped By | many2one | res.users |  |  |  |
| `x_studio_s_received_date` | Received Date | datetime |  |  |  |  |
| `x_studio_s_received_by` | Received By | many2one | res.users |  |  |  |
| `x_studio_f_shipped_date` | Shipped Date | datetime |  |  |  |  |
| `x_studio_f_shipped_by` | Shipped By | many2one | res.users |  |  |  |
| `x_studio_f_received_date` | Received Date | datetime |  |  |  |  |
| `x_studio_f_received_by` | Received By | many2one | res.users |  |  |  |
| `x_studio_driver_name` | Driver Name | char |  |  |  |  |
| `x_studio_vehicle_details` | Vehicle Details | char |  |  |  |  |

#### Computed / Rollup from Tasks

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_task_status` | Task Status | boolean |  |  | Yes | computed |
| `x_studio_valid_confirmed_so` | Valid Confirmed SO | boolean |  |  | Yes | computed |
| `x_studio_valid_confirmed2_so` | Valid Confirmed2 SO | boolean |  |  | Yes | computed |
| `x_studio_valid_delivered_so` | Valid Delivered SO | boolean |  |  | Yes | computed |
| `x_studio_valid_invoiced_so` | Valid Invoiced SO | boolean |  |  | Yes | computed |
| `x_studio_fully_paid_so` | Fully Paid SO | boolean |  |  | Yes | computed |
| `x_studio_rug_approval_status` | RUG Approval Status | selection | [('Pending RUG Approval', 'Pending RUG Approval'), ('RUG Approved', 'RUG Appr... |  | Yes | computed |
| `x_studio_material_availability` | Material Availability | selection | [('Material Not Ready', 'Material Not Ready'), ('Material Ready', 'Material R... |  | Yes | computed |
| `x_studio_re_estimate_count` | Re-estimate Count | integer |  |  | Yes | computed |
| `x_studio_re_estimate_status` | Re-estimate Status | selection | [('None', 'None'), ('Re-estimated', 'Re-estimated')] |  | Yes | computed |
| `x_studio_sale_order` | Sales Order | many2one | sale.order |  | Yes | computed |

#### Customer-Facing / Miscellaneous

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_warranty_card` | Warranty Card | binary |  |  |  |  |
| `x_studio_related_information` | Related Information | binary |  |  |  |  |
| `x_studio_items` | Items | many2many | product.product |  |  |  |
| `x_studio_qty` | Qty | char |  |  |  |  |
| `x_studio_sales_price` | Sales Price | char |  |  |  |  |
| `x_studio_balance_due` | Balance Due | float |  |  |  |  |
| `x_studio_quantity` | Quantity | float |  |  | Yes | x_studio_sale_order.order_line.product_uom_qty |
| `x_studio_materials_used` | Materials Used  | many2one | product.product |  | Yes | x_studio_sale_order.order_line.product_id |
| `x_studio_unit_price` | Unit Price | char |  |  | Yes | x_studio_sale_order.pricelist_id.item_ids.price |
| `x_studio_quick_repair_status` | Tested OK | selection | [('None', 'None'), ('Quick Repair', 'Tested OK')] |  | Yes |  |
| `x_studio_sn_updated` | SN Updated | boolean |  |  |  |  |
| `x_studio_user_location_validation` | User Location Validation | boolean |  |  | Yes | computed |
| `x_studio_sale_order` | Sales Order | many2one | sale.order |  | Yes | computed |
| `x_studio_fully_paid_so` | Fully Paid SO | boolean |  |  | Yes | computed |
| `x_x_studio_created_from_help_ticket_stock_picking_count` | Created from Help Ticket count | integer |  |  |  | computed |

#### Temporary / Test Fields

| Field Name | Label | Type | Relation / Selection | Required | Readonly | Compute/Related |
|---|---|---|---|---|---|---|
| `x_studio_cccc` | CCCC | char |  |  | Yes | ticket_type_id.name |
| `x_studio_cccc3` | CCCC3 | many2one | helpdesk.stage |  | Yes | stage_id |
| `x_studio_related_field_FNjnC` | New Related Field | one2many | project.task |  | Yes | project_id.task_ids |
| `x_studio_related_field_QuqN1` | New Related Field | integer |  |  | Yes | project_id.task_ids.helpdesk_ticket_id.id |
| `x_studio_city` | City | selection | [('Gampaha', 'Gampaha'), ('Colombo', 'Colombo'), ('Yakkala', 'Yakkala')] |  |  |  |
| `x_studio_branch` | Branch | selection | [('Colombo', 'Colombo'), ('Gampah', 'Gampah')] |  |  |  |

#### Full Field Details (Computed Fields — Python Code)

**`x_studio_fsm_task_done`** — FSM Task Done (`boolean`)
- depends: `fsm_task_ids`

```python
for rec in self:
  task_status = False
  for line in rec.fsm_task_ids:
    if line.fsm_done == True:
      task_status = True
      
    if line.x_studio_end_quick_repair == True:
      task_status = True
      
  rec['x_studio_fsm_task_done'] = task_status
```

**`x_studio_fully_paid_so`** — Fully Paid SO (`boolean`)
- depends: `fsm_task_ids`

```python
for rec in self:
  valid = False
  for invoices in rec.fsm_task_ids:
    if invoices.x_studio_fully_invoiced_so == True:
      valid = True
      
    if invoices.x_studio_end_quick_repair == True:
      valid = True
 
  rec['x_studio_fully_paid_so'] = valid
```

**`x_studio_handed_over`** — Handed Over (`boolean`)
- depends: `picking_ids`

```python
for rec in self:
  company_ids = rec.env.context.get('allowed_company_ids', [rec.env.user.company_id.id])
  company = self.env['res.company'].browse(company_ids[0])
  valid = False
  c = 0
  for line in rec.picking_ids:
    if line.state == 'done':
      c += 1
      
  if c > 1:
    valid = True
    
  if valid == True:
    if rec.x_studio_handed_over == False:
      rec['x_studio_handed_over'] = True
      if company.id == 1:
        rec['stage_id'] = 13
      else:
        rec['stage_id'] = 32
      rec['x_studio_stage_date'] = datetime.datetime.now()
      
  rec['x_studio_handed_over'] = valid
```

**`x_studio_material_availability`** — Material Availability (`selection`)
- depends: `fsm_task_ids`

```python
for rec in self:
  val = 'Material Not Ready'
  for invoices in rec.fsm_task_ids:
      val = invoices.x_studio_material_availability
  rec['x_studio_material_availability'] = val
```

**`x_studio_re_estimate_count`** — Re-estimate Count (`integer`)
- depends: `fsm_task_ids`

```python
for rec in self:
  val = 0
  for invoices in rec.fsm_task_ids:
    val = invoices.sale_order_id.x_studio_re_estimate_count
  rec['x_studio_re_estimate_count'] = val
```

**`x_studio_re_estimate_status`** — Re-estimate Status (`selection`)
- depends: `fsm_task_ids`

```python
for rec in self:
  val = 'None'
  for invoices in rec.fsm_task_ids:
    if invoices.sale_order_id.x_studio_re_estimate_count > 0:
      val = 'Re-estimated'
  rec['x_studio_re_estimate_status'] = val
```

**`x_studio_rug_approval_status`** — RUG Approval Status (`selection`)
- depends: `fsm_task_ids`

```python
for rec in self:
  val = 'Pending RUG Approval'
  for invoices in rec.fsm_task_ids:
      so = self.env['sale.order'].search([('task_id', '=', invoices.id)],limit=1)
      if so:
        if so.x_studio_rug_approved == True:
          val = 'RUG Approved'
        elif so.x_studio_rug_rejected == True:
          val = 'RUG Rejected'
  rec['x_studio_rug_approval_status'] = val
```

**`x_studio_sale_order`** — Sales Order (`many2one`)
- depends: `fsm_task_ids`

```python
for rec in self:
  so = False
  for invoices in rec.fsm_task_ids:
      if invoices.sale_order_id != False:
        so = invoices.sale_order_id.id    
  rec['x_studio_sale_order'] = so
```

**`x_studio_task_status`** — Task Status (`boolean`)
- depends: `fsm_task_ids`

```python
for rec in self:
  company_ids = rec.env.context.get('allowed_company_ids', [rec.env.user.company_id.id])
  company = self.env['res.company'].browse(company_ids[0])
  task_status = False
  for line in rec.fsm_task_ids:
    if line.fsm_done == True:
      task_status = True
      
    if line.x_studio_end_quick_repair == True:
      task_status = True
      
  if task_status == False:
    if rec.x_studio_sale_order == True:
      
      if rec.x_studio_sale_order.state == 'cancel':
        task_status = True  
      else:
        delivery1 = self.env['stock.picking'].search([('sale_id', '=', rec.x_studio_sale_order.id)],limit=1)
        if delivery1:
          delivery = self.env['stock.picking'].search([('sale_id', '=', rec.x_studio_sale_order.id),('state', 'not in', ['done', 'cancel'])],limit=1)    
          if delivery:
            task_status = False
          else:
            task_status = True
        else:
          task_status = False
    
  if task_status == True:
    if rec.x_studio_repair_complete_stage_updated == False:
      if company.id == 1:
        rec['stage_id'] = 9
      else:
        rec['stage_id'] = 28
      rec['x_studio_stage_date'] = datetime.datetime.now()
      rec['x_studio_created_by_8'] = self._uid
      rec['x_studio_created_on_8'] = datetime.datetime.now()
      rec['x_studio_repair_complete_stage_updated'] = True
        
      so_items = self.env['sale.order.line'].search([('order_id', '=', rec.x_studio_sale_order.id)])
      if so_items:
        tot_item_ids = []
        qty = []
        prices = []
        for items in so_items:
          if items.product_uom_qty > 0:
            tot_item_ids.append(items.product_id.id)
            qty.append(items.product_uom_qty)
            prices.append(items.price_unit)
            
        rec['x_studio_items'] = [(6, 0, tot_item_ids)]
        rec['x_studio_qty'] = qty
        rec['x_studio_sales_price'] = prices  
      
  rec['x_studio_task_status'] = task_status
```

**`x_studio_user_location_validation`** — User Location Validation (`boolean`)
- depends: `x_studio_return_receipt_location`

```python
for rec in self:
  valid = False
  if rec.x_studio_return_receipt_location:
    loc = self.env['stock.location'].search([('id', '=', rec.x_studio_return_receipt_location.id),('x_studio_users_stock_location', 'ilike', self._uid),('active', '=', True)],limit=1)
    if loc:
      valid = False
    else:
      valid = True
  
  rec['x_studio_user_location_validation'] = valid
```

**`x_studio_valid_confirm_return`** — Valid Confirm Return (`boolean`)
- depends: `picking_ids`

```python
for rec in self:
  valid = False
  for line in rec.picking_ids:
    if line.state == 'done':
      valid = True
    
  rec['x_studio_valid_confirm_return'] = valid
```

**`x_studio_valid_confirmed2_so`** — Valid Confirmed2 SO (`boolean`)
- depends: `fsm_task_ids`

```python
for rec in self:
  company_ids = rec.env.context.get('allowed_company_ids', [rec.env.user.company_id.id])
  company = self.env['res.company'].browse(company_ids[0])
  valid = False
  for invoices in rec.fsm_task_ids:
      if invoices.x_studio_valid_confirm2_so == True:
        valid = True
  if valid == True:
    if rec.x_studio_estimation_approved_stage_updated == False:
      rec['x_studio_estimation_approved_stage_updated'] = True
      if company.id == 1:
        rec['stage_id'] = 12
      else:
        rec['stage_id'] = 31
      rec['x_studio_stage_date'] = datetime.datetime.now()
      rec['x_studio_created_by_5'] = self._uid
      rec['x_studio_created_on_5'] = datetime.datetime.now()
  rec['x_studio_valid_confirmed2_so'] = valid
```

**`x_studio_valid_confirmed_so`** — Valid Confirmed SO (`boolean`)
- depends: `fsm_task_ids`

```python
for rec in self:
  company_ids = rec.env.context.get('allowed_company_ids', [rec.env.user.company_id.id])
  company = self.env['res.company'].browse(company_ids[0])
  valid = False
  for invoices in rec.fsm_task_ids:
      if invoices.x_studio_valid_confirm_so == True:
        valid = True
  if valid == True:
    if rec.x_studio_estimation_sent_stage_updated == False:
      rec['x_studio_estimation_sent_stage_updated'] = True
      if company.id == 1:
        rec['stage_id'] = 10
      else:
        rec['stage_id'] = 29
      rec['x_studio_stage_date'] = datetime.datetime.now()
      rec['x_studio_created_by_4'] = self._uid
      rec['x_studio_created_on_4'] = datetime.datetime.now()
  rec['x_studio_valid_confirmed_so'] = valid
```

**`x_studio_valid_delivered_so`** — Valid Delivered SO (`boolean`)
- depends: `fsm_task_ids`

```python
for rec in self:
  company_ids = rec.env.context.get('allowed_company_ids', [rec.env.user.company_id.id])
  company = self.env['res.company'].browse(company_ids[0])
  valid = False
  valid2 = False
  for invoices in rec.fsm_task_ids:
    if invoices.x_studio_valid_delivered_so == True:
      valid = True
      
    if invoices.x_studio_valid_delivered_so2 == True:
        valid2 = True
  if valid2 == True:
    if rec.x_studio_repair_complete_stage_updated == False:
      if company.id == 1:
        rec['stage_id'] = 9
      else:
        rec['stage_id'] = 28 
      rec['x_studio_stage_date'] = datetime.datetime.now()
      rec['x_studio_created_by_8'] = self._uid
      rec['x_studio_created_on_8'] = datetime.datetime.now()
      rec['x_studio_repair_complete_stage_updated'] = True
        
      so_items = self.env['sale.order.line'].search([('order_id', '=', rec.x_studio_sale_order.id)])
      if so_items:
        tot_item_ids = []
        qty = []
        prices = []
        for items in so_items:
          if items.product_uom_qty > 0:
            tot_item_ids.append(items.product_id.id)
            qty.append(items.product_uom_qty)
            prices.append(items.price_unit)
            
        rec['x_studio_items'] = [(6, 0, tot_item_ids)]
        rec['x_studio_qty'] = qty
        rec['x_studio_sales_price'] = prices
  else:
    if valid == True:
      if rec.x_studio_repair_started_stage_updated == False:
        if company.id == 1:
          rec['stage_id'] = 11
        else:
          rec['stage_id'] = 30
        rec['x_studio_stage_date'] = datetime.datetime.now()
        rec['x_studio_created_by_7'] = self._uid
        rec['x_studio_created_on_7'] = datetime.datetime.now()
        rec['x_studio_repair_started_stage_updated'] = True
  rec['x_studio_valid_delivered_so'] = valid
```

**`x_studio_valid_invoiced_so`** — Valid Invoiced SO (`boolean`)
- depends: `fsm_task_ids`

```python
for rec in self:
  company_ids = rec.env.context.get('allowed_company_ids', [rec.env.user.company_id.id])
  company = self.env['res.company'].browse(company_ids[0])
  valid = False
  for invoices in rec.fsm_task_ids:
    if invoices.sale_order_id.x_studio_order_payment_method == 'Credit':
      valid = False
    else:
      if invoices.x_studio_valid_invoiced_so == True:
        valid = True
  if valid == True:
    if rec.x_studio_repair_complete_stage_updated == False:
      if rec.x_studio_invoice_stage_updated == False:
        if company.id == 1:
          rec['stage_id'] = 3
        else:
          rec['stage_id'] = 22
        rec['x_studio_stage_date'] = datetime.datetime.now()
        rec['x_studio_created_by_6'] = self._uid
        rec['x_studio_created_on_6'] = datetime.datetime.now()
        rec['x_studio_invoice_stage_updated'] = True
  rec['x_studio_valid_invoiced_so'] = valid
```

**`x_studio_valid_return`** — Valid Return (`boolean`)
- depends: `picking_ids`

```python
for rec in self:
  valid = False
  for line in rec.picking_ids:
    if line.state != 'cancel':
      valid = True
    
  rec['x_studio_valid_return'] = valid
```

**`x_x_studio_created_from_help_ticket_stock_picking_count`** — Created from Help Ticket count (`integer`)
- depends: `none`

```python
for record in self: record['x_x_studio_created_from_help_ticket_stock_picking_count'] = self.env['stock.picking'].search_count([('x_studio_created_from_help_ticket', '=', record.id)])
```

### 2b. `repair.order` — Studio Field

| Field Name | Label | Type | Required | Readonly | Store |
|---|---|---|---|---|---|
| `x_studio_confirm_draft_quotation` | Confirm Draft Quotation | boolean |  |  | Yes |

### 2c. `project.task` — Studio Fields

The following `x_studio_*` fields on `project.task` are referenced in Studio views and server actions. They were not exported individually but are inferred from view arch XML and server action code.

| Field Name | Inferred Purpose | Referenced In |
|---|---|---|
| `x_studio_cancelled` | Boolean — task cancelled | project.task form view |
| `x_studio_created_date` | Date | project.task form view |
| `x_studio_diagnosis_ids` | One2many → x_task_diagnosis | project.task Repair Diagnosis tab |
| `x_studio_end_quick_repair` | Boolean — quick repair ended | project.task/server action |
| `x_studio_fully_invoiced_so` | Boolean | helpdesk computed field |
| `x_studio_incomplete_delivery_available` | Boolean — partial delivery | project.task form view |
| `x_studio_material_availability` | Selection — Material Not Ready/Ready | project.task form views |
| `x_studio_payment_type` | Selection — payment type | project.task form view |
| `x_studio_priority` | Selection — priority level | project.task form view |
| `x_studio_quick_repair_status_1` | Selection | RR - End Quick Repair server action |
| `x_studio_quotation_type` | Selection — quotation type | project.task form views |
| `x_studio_related_information` | Binary image | project.task form view |
| `x_studio_repair_complete_stage_updated` | Boolean | RR - End Quick Repair server action |
| `x_studio_repair_image_01` | Binary image | project.task form view |
| `x_studio_repair_image_02` | Binary image | project.task form view |
| `x_studio_repair_reason` | Many2one (x_repair_reason?) | project.task form view |
| `x_studio_starting_date` | Date/Datetime | project.task tree view |
| `x_studio_valid_confirm2_so` | Boolean | helpdesk computed field |
| `x_studio_valid_confirm_so` | Boolean | helpdesk computed field |
| `x_studio_valid_delivered_so` | Boolean | helpdesk computed field |
| `x_studio_valid_delivered_so2` | Boolean | helpdesk computed field |
| `x_studio_valid_diagnosis` | Boolean — diagnosis complete | project.task form view |
| `x_studio_valid_invoiced_so` | Boolean — SO invoiced | project.task form view |
| `x_studio_warranty_card` | Binary image | project.task form view |

## 3. Automated Actions (base.automation)

### AA-149: RR - Notify Customer in RO End - Final

- **Model:** `repair.order`
- **Trigger:** `on_create_or_write`
- **Active:** True
- **Linked Server Action IDs:** [1817]

#### Linked Server Action: `RR - Notify Customer in RO End - Final` (id=1817) — state=`next_activity`

_(No active code — only boilerplate comments)_

### AA-171: JIN-Helpdesk(Repair) Seq.No

- **Model:** `helpdesk.ticket`
- **Trigger:** `on_create_or_write`
- **Active:** True
- **Linked Server Action IDs:** [1976]

#### Linked Server Action: `RR - Repair Seq.No` (id=1976) — state=`code`

```python
#record['x_name'] = env['ir.sequence'].next_by_code('purchase.request.seq')

if record.name == 'New':
 seq = env['ir.sequence'].next_by_code('repair.seq')
 record.write({'name': seq})
```

### AA-172: RR - Auto Select Product for RUG Repairs

- **Model:** `helpdesk.ticket`
- **Trigger:** `on_change`
- **Active:** True
- **Linked Server Action IDs:** [1989]

#### Linked Server Action: `RR - Auto Select Product for RUG Repairs` (id=1989) — state=`code`

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

### AA-178: RR - Auto Populate Repair Location

- **Model:** `helpdesk.ticket`
- **Trigger:** `on_change`
- **Active:** True
- **Linked Server Action IDs:** [2000]

#### Linked Server Action: `RR - Auto Populate Repair Location` (id=2000) — state=`code`

```python
if record.x_studio_return_receipt_location != False:
  record['x_studio_repair_location'] = record.x_studio_return_receipt_location
else:
  record['x_studio_repair_location'] = ''
```

### AA-179: RR - Auto Update Helpdesk Pipeline Status - 1

- **Model:** `project.task`
- **Trigger:** `on_create_or_write`
- **Active:** True
- **Linked Server Action IDs:** [2003]

#### Linked Server Action: `RR - Auto Update Helpdesk Pipeline Status - 1` (id=2003) — state=`code`

```python
if record.helpdesk_ticket_id != False:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  ticket = env['helpdesk.ticket'].search([('id', '=', record.helpdesk_ticket_id.id)],limit=1)
  if ticket:
    if company.id == 1:
      if ticket.stage_id.id == 1 or ticket.stage_id.id == 6:
        if ticket.fsm_task_count > 0:
          ticket.write({'stage_id':2, 'x_studio_stage_date':datetime.datetime.now(), 'x_studio_created_by_3':uid, 'x_studio_created_on_3':datetime.datetime.now()})
    else:
      if ticket.stage_id.id == 20 or ticket.stage_id.id == 25:
        if ticket.fsm_task_count > 0:
          ticket.write({'stage_id':21, 'x_studio_stage_date':datetime.datetime.now(), 'x_studio_created_by_3':uid, 'x_studio_created_on_3':datetime.datetime.now()})
```

### AA-201: RR - Validate Cancelled Tickets

- **Model:** `helpdesk.ticket`
- **Trigger:** `on_unlink`
- **Filter domain:** `[["x_studio_cancelled","=",True]]`
- **Active:** True
- **Linked Server Action IDs:** [2222]

#### Linked Server Action: `RR - Validate Cancelled Tickets` (id=2222) — state=`code`

```python
if record.x_studio_cancelled == True:
  raise UserError('Cancelled tickets can not be deleted.')
```

### AA-243: RR - Auto Select Product for RUG Repairs-33

- **Model:** `helpdesk.ticket`
- **Trigger:** `on_change`
- **Active:** True
- **Linked Server Action IDs:** [2451]

#### Linked Server Action: `RR - Auto Select Product for RUG Repairs-33` (id=2451) — state=`code`

```python
record['sale_order_id'] = False
record['x_studio_picking_id'] = False
record['x_studio_pick_id'] = False
record['product_id'] = False
record['lot_id'] = False
record['x_studio_sn_updated'] = False
```

## 4. Server Actions (ir.actions.server)

### Server Actions on `helpdesk.ticket` (29 total)

#### SA-3027: Convert to Task — state=`code` | bound to: Helpdesk Ticket

```python
action = records.action_convert_to_task()
```

#### SA-3086: Customer Preview — state=`code` | bound to: Helpdesk Ticket

```python
action = records.action_customer_preview()
```

#### SA-1993: RR - Auto Create Repair Route — state=`code`

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

#### SA-1994: RR - Auto Create Repair Serial Nos — state=`code`

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

#### SA-2000: RR - Auto Populate Repair Location — state=`code`

```python
if record.x_studio_return_receipt_location != False:
  record['x_studio_repair_location'] = record.x_studio_return_receipt_location
else:
  record['x_studio_repair_location'] = ''
```

#### SA-1989: RR - Auto Select Product for RUG Repairs — state=`code`

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

#### SA-1990: RR - Auto Select Product for RUG Repairs-2 — state=`code`

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

#### SA-2451: RR - Auto Select Product for RUG Repairs-33 — state=`code`

```python
record['sale_order_id'] = False
record['x_studio_picking_id'] = False
record['x_studio_pick_id'] = False
record['product_id'] = False
record['lot_id'] = False
record['x_studio_sn_updated'] = False
```

#### SA-1992: RR - Auto Select Product for RUG Repairs-4 — state=`code`

```python
if record.ticket_type_id:
  record['sale_order_id'] = False
  record['x_studio_picking_id'] = False
  record['x_studio_pick_id'] = False
  record['product_id'] = False
  record['lot_id'] = False
  record['x_studio_serial_no'] = False
```

#### SA-2220: RR - Cancel Repair — state=`code`

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

#### SA-2343: RR - Cancel Repair-2 — state=`code`

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

#### SA-2159: RR - Change Repair Type to RUG — state=`code`

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

#### SA-2450: RR - RR - Auto Select Product for RUG Repairs-22 — state=`code`

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

#### SA-2002: RR - Receive at Factory — state=`code`

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

#### SA-2006: RR - Receive at Sales Centre — state=`code`

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

#### SA-2221: RR - Reopen Repair — state=`code`

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

#### SA-1976: RR - Repair Seq.No — state=`code`

```python
#record['x_name'] = env['ir.sequence'].next_by_code('purchase.request.seq')

if record.name == 'New':
 seq = env['ir.sequence'].next_by_code('repair.seq')
 record.write({'name': seq})
```

#### SA-2001: RR - Send to Factory — state=`code`

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

#### SA-2007: RR - Send to Sales Centre — state=`code`

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

#### SA-1998: RR - Update RUG Approval in Pipeline — state=`object_write`

_(state=object_write — no active code captured)_

#### SA-2222: RR - Validate Cancelled Tickets — state=`code`

```python
if record.x_studio_cancelled == True:
  raise UserError('Cancelled tickets can not be deleted.')
```

#### SA-2308: Send Final Notice — state=`code` | bound to: Helpdesk Ticket

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 66)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
```

#### SA-2309: Send Final Notice - Estimated — state=`code` | bound to: Helpdesk Ticket

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 67)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
```

#### SA-2310: Send Final Notice - Scrappage — state=`code` | bound to: Helpdesk Ticket

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 69)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
```

#### SA-2311: Send Reminding Letter — state=`code` | bound to: Helpdesk Ticket

```python
if record.stage_id.id != 13:
  raise UserError('The repaired item should be handed over to customer to send the report.')

template = env['mail.template'].search([('id', '=', 70)],limit=1)
if template:
  template.send_mail(record.id, force_send=True, email_values={'recipient_ids': [record.partner_id.id]})
  records.message_post(body="Repair Customer Letter has been sent to customer: " + str(record.partner_id.name))
```

#### SA-2269: Send Repair Customer Letter — state=`code` | bound to: Helpdesk Ticket

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

#### SA-1784: Share — state=`code` | bound to: Helpdesk Ticket

```python
action = records.action_share()
```

#### SA-2426: Slowness - Test — state=`code`

```python
#if not (record._name == 'sale.order.line'):
#  raise UserError('Trigered123')
raise UserError(str(record._name))
```

#### SA-2558: User Location Validation - Helpdesk — state=`code`

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

### Server Actions on `repair.order` (4 total)

#### SA-1814: RR - Add Draft Quotation Confirm Button — state=`code`

```python
if record.id:
  record['x_studio_confirm_draft_quotation'] = True
```

#### SA-1817: RR - Notify Customer in RO End - Final — state=`next_activity`

_(state=next_activity)_

#### SA-1820: RR - Notify Customer in RO End - Final - 2 — state=`code`

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

#### SA-1979: RR - Update SO in RO — state=`code`

```python
if record.ticket_id.id:
  record['sale_order_id'] = record.ticket_id.sale_order_id.id
```

### Server Actions on `project.task` (10 total)

#### SA-3096: Convert to Task/Sub-Task — state=`code` | bound to: Task

```python
action = record.action_convert_to_subtask()
```

#### SA-3028: Convert to Ticket — state=`code` | bound to: Task

```python
action = records.action_convert_to_ticket()
```

#### SA-2003: RR - Auto Update Helpdesk Pipeline Status - 1 — state=`code`

```python
if record.helpdesk_ticket_id != False:
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  ticket = env['helpdesk.ticket'].search([('id', '=', record.helpdesk_ticket_id.id)],limit=1)
  if ticket:
    if company.id == 1:
      if ticket.stage_id.id == 1 or ticket.stage_id.id == 6:
        if ticket.fsm_task_count > 0:
          ticket.write({'stage_id':2, 'x_studio_stage_date':datetime.datetime.now(), 'x_studio_created_by_3':uid, 'x_studio_created_on_3':datetime.datetime.now()})
    else:
      if ticket.stage_id.id == 20 or ticket.stage_id.id == 25:
        if ticket.fsm_task_count > 0:
          ticket.write({'stage_id':21, 'x_studio_stage_date':datetime.datetime.now(), 'x_studio_created_by_3':uid, 'x_studio_created_on_3':datetime.datetime.now()})
```

#### SA-2316: RR - End Quick Repair — state=`code`

```python
if record.id:
  stage = 0
  company_id = env.context.get('allowed_company_ids', [env.user.company_id.id])[0]
  company = env['res.company'].browse(company_id)
  
  if company.id == 1:
    stage = 9
  else:
    stage = 28
  
  record['x_studio_end_quick_repair'] = True
  record['x_studio_quick_repair_status_1'] = 'Quick Repair'
  
  ticket = env['helpdesk.ticket'].search([('id', '=', record.helpdesk_ticket_id.id)],limit=1)
  if ticket:
    ticket.write({'x_studio_repair_complete_stage_updated':True,'stage_id':stage,'x_studio_stage_date':datetime.datetime.now(),'x_studio_created_by_8':uid,'x_studio_created_on_8':datetime.datetime.now(),'x_studio_quick_repair_status':'Quick Repair'})
```

#### SA-2224: RR - Repair Diagnosis Validation — state=`code`

```python
if record.id:
  raise UserError('Atleast one repair diagnosis line must be specified for the selected task.')
```

#### SA-2242: RR - Repair Image Validation — state=`code`

```python
if record.id:
  raise UserError('Atleast one repair image should be uploaded for the selected task.')
```

#### SA-2219: RR - Validate Diagnosis Lines — state=`code`

```python
if record.helpdesk_ticket_id != False:
  if record.x_studio_valid_diagnosis == False:
    raise UserError('Repair diagnosis must be specified.')
```

#### SA-2010: Send Report — state=`code` | bound to: Task

```python
if records:
                action = records.action_send_report()
```

#### SA-3119: menu load To-dos — state=`code`

```python
model._ensure_onboarding_todo(); action = env["ir.actions.actions"]._for_xml_id("project_todo.project_task_action_todo")
```

#### SA-3095: menu view My Tasks — state=`code`

```python
model._ensure_personal_stages(); action = env["ir.actions.actions"]._for_xml_id("project.action_view_my_task")
```

## 5. Views (Studio-Modified)

### 5a. Studio-modified views on `helpdesk.ticket`

#### View id=3971: `helpdesk.ticket.kanban` — type=`kanban`
- priority: 10 | active: True

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

#### View id=4012: `Odoo Studio: helpdesk.ticket.form customization` — type=`form` (inherits id=3972: helpdesk.ticket.form)
- priority: 99 | active: True

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

### 5b. Studio-modified views on `repair.order`

#### View id=4015: `Odoo Studio: repair.form customization_button` — type=`form` (inherits id=2096: repair.form)
- priority: 99 | active: True

```xml
<data>
    <xpath expr="//header/button[@name='action_validate']" position="before"> x_studio_confirm_draft_quotation
      <button type="action" name="1814" string="Confirm Draft Quotation" class="btn-primary" invisible="x_studio_confirm_draft_quotation == True"/>
    </xpath>
    
    <xpath expr="//header/button[@name='action_validate']" position="attributes">
      <attribute name="invisible">state != 'draft'</attribute></xpath>
    
    </data>
```

#### View id=2096: `repair.form` — type=`form`
- priority: 16 | active: True

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

#### View id=2099: `repair.graph` — type=`graph`
- priority: 16 | active: True

```xml
<?xml version="1.0"?>
<graph string="Repair Orders" sample="1">
                <field name="create_date"/>
                <field name="product_id"/>
            </graph>
        
```

#### View id=2097: `repair.kanban` — type=`kanban`
- priority: 16 | active: True

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

#### View id=7836: `repair.order.view.activity` — type=`activity`
- priority: 16 | active: True

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

#### View id=2100: `repair.pivot` — type=`pivot`
- priority: 16 | active: True

```xml
<?xml version="1.0"?>
<pivot string="Repair Orders" sample="1">
                <field name="create_date" type="row"/>
                <field name="product_id" type="col"/>
            </pivot>
        
```

#### View id=2098: `repair.select` — type=`search`
- priority: 16 | active: True

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

#### View id=2095: `repair.tree` — type=`tree`
- priority: 16 | active: True

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

#### View id=4014: `Odoo Studio: repair.form customization` — type=`form` (inherits id=2096: repair.form)
- priority: 99 | active: True

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

### 5c. Studio-modified views on `project.task`

#### View id=4343: `project.task.view.form.inherit.project.enterprise` — type=`form` (inherits id=816: project.task.form)
- priority: 16 | active: True

```xml
<data><xpath expr="//sheet" position="before">
                <div role="alert" class="alert alert-warning d-flex flex-wrap gap-3" invisible="not planning_overlap">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-random me-2" role="img" title="Planning overlap"/>
                        <field name="planning_overlap" widget="html" nolabel="1" class="m-0"/>
                    </div>
                    <a name="action_fsm_view_overlapping_tasks" type="object" class="alert-link ms-auto" invisible="not planning_overlap">
                        Check it out <i class="oi oi-chevron-right ms-2"/>
                    </a>
                </div>
                <div role="alert" class="alert alert-warning d-flex align-items-center" invisible="not dependency_warning">
                        <i class="fa fa-exclamation-circle me-2" role="img" title="Dependency warning"/>
                        <field name="dependency_warning" widget="html" class="m-0"/>
                </div>
            </xpath>
            <xpath expr="//label[@for='date_deadline']" position="attributes">
                <attribute name="invisible">planned_date_begin</attribute>
            </xpath>
            <xpath expr="//label[@for='date_deadline']" position="after">
                <label for="date_deadline" string="Planned Date" invisible="not planned_date_begin"/>
            </xpath>
            <xpath expr="//field[@name='date_deadline']" position="attributes">
                <attribute name="widget">daterange</attribute>
                <attribute name="options">{'start_date_field': 'planned_date_begin'}</attribute>
            </xpath>
            <xpath expr="//field[@name='date_deadline']" position="after">
                <field name="planned_date_begin" invisible="1"/>
            </xpath>
            <xpath expr="//field[@name='child_ids']/tree//field[@name='date_deadline']" position="attributes">
                <attribute name="widget">daterange</attribute>
                <attribute name="options">{'start_date_field': 'planned_date_begin'}</attribute>
            </xpath>
            <xpath expr="//field[@name='child_ids']/tree//field[@name='date_deadline']" position="after">
                <field name="planned_date_begin" column_invisible="True"/>
            </xpath>
            <xpath expr="//field[@name='depend_on_ids']/tree//field[@name='date_deadline']" position="attributes">
                <attribute name="widget">daterange</attribute>
                <attribute name="options">{'start_date_field': 'planned_date_begin'}</attribute>
            </xpath>
            <xpath expr="//field[@name='depend_on_ids']/tree//field[@name='date_deadline']" position="after">
                <field name="planned_date_begin" column_invisible="True"/>
            </xpath>
        </data>
```

#### View id=3019: `Odoo Studio: project.task.form customization` — type=`form` (inherits id=816: project.task.form)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//button[@name='action_fsm_create_quotation']" position="attributes">
    <attribute name="invisible">not allow_quotations or not x_studio_quotation_type</attribute>
  </xpath>
  <xpath expr="//field[@name='personal_stage_type_id']" position="after">
    <button type="action" name="2224" string="View Repair Diagnosis Validation" class="btn-primary" invisible="x_studio_end_quick_repair == True or x_studio_cancelled == True or not helpdesk_ticket_id or ( helpdesk_ticket_id and x_studio_valid_diagnosis == True )"/>
    <button type="action" name="2242" string="View Repair Image Validation" class="btn-primary" invisible="x_studio_end_quick_repair == True or x_studio_cancelled == True or not helpdesk_ticket_id or ( helpdesk_ticket_id and x_studio_repair_image_01 )"/>
    <button type="action" name="2316" string="Tested OK" class="btn-primary" invisible="material_line_product_count &gt; 0 or x_studio_cancelled == True or not helpdesk_ticket_id or x_studio_end_quick_repair == True"/>
  </xpath>
  <xpath expr="//button[@name='action_fsm_view_material']" position="attributes">
    <attribute name="invisible">( not partner_id and not is_fsm ) or not allow_material or fsm_done == True or ( helpdesk_ticket_id and x_studio_valid_diagnosis != True ) or ( helpdesk_ticket_id and not x_studio_repair_image_01 )</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='user_ids']" position="attributes">
    <attribute name="string">Assignees</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[1]/field[@name='user_ids']" position="after">
    <field name="helpdesk_ticket_id" string="Help Desk Ticket"/>
    <field name="x_studio_created_date"/>
    <field name="x_studio_repair_reason" invisible="True"/>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[2]/field[@name='sale_order_id']" position="attributes">
    <attribute name="invisible">False</attribute>
    <attribute name="string">Sales Orderr</attribute>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/group[1]/group[2]/div[3]" position="after">
    <field name="x_studio_priority"/>
    <field name="x_studio_quotation_type"/>
    <field name="x_studio_material_availability"/>
  </xpath>
  <xpath expr="//form[1]/sheet[1]/notebook[1]" position="inside">
    <page string="Repair Image" name="studio_page_8ci_1ik1qk8tm">
      <group name="studio_group_8ci">
        <group name="studio_group_8ci_left">
          <field name="x_studio_repair_image_01" widget="tablet_image"/>
        </group>
        <group name="studio_group_8ci_right">
          <field name="x_studio_repair_image_02" widget="tablet_image"/>
        </group>
      </group>
    </page>
    <page string="Warranty Card" name="studio_page_8db_1ik1r0ore">
      <group name="studio_group_8db">
        <group name="studio_group_8db_left">
          <field name="x_studio_warranty_card" widget="image"/>
        </group>
        <group name="studio_group_8db_right">
          <field name="x_studio_related_information" widget="image"/>
        </group>
      </group>
    </page>
    <page string="Repair Diagnosis" name="studio_page_M5qFQ" invisible="helpdesk_ticket_id == False">
      <field name="x_studio_diagnosis_ids" force_save="True" required="helpdesk_ticket_id != False">
        <tree editable="bottom">
          <field name="x_studio_sequence" widget="handle"/>
          <field name="x_name" column_invisible="True"/>
          <field name="x_studio_condition" optional="show" column_invisible="True"/>
          <field name="x_studio_symptom_area" optional="show" column_invisible="True"/>
          <field name="x_studio_symptom_code" optional="show" column_invisible="True"/>
          <field name="x_studio_description" optional="show"/>
          <field name="x_studio_diagnosis_area" optional="show" required="1"/>
          <field name="x_studio_diagnosis_code" optional="show" required="1" domain="[[&quot;x_studio_diagnosis_area_1&quot;,&quot;=&quot;,x_studio_diagnosis_area]]"/>
          <field name="x_studio_reason" optional="show" required="1"/>
          <field name="x_studio_sub_reason" optional="show" required="1" domain="[[&quot;x_studio_reason_code&quot;,&quot;=&quot;,x_studio_reason]]"/>
          <field name="x_studio_resolution" optional="show" required="1"/>
          <field name="x_studio_repair_stage" optional="show" required="1"/>
          <field optional="show" name="x_studio_task_id" string="Task Id" invisible="1" column_invisible="True"/>
        </tree>
      </field>
    </page>
  </xpath>
</data>
```

#### View id=4775: `Odoo Studio: project.task.tree customization` — type=`tree` (inherits id=819: project.task.tree)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//field[@name='effective_hours']" position="after">
    <field name="x_studio_starting_date" optional="show"/>
    <field name="date_end" optional="show"/>
    <field name="planned_date_begin" optional="show"/>
    </xpath>
</data>
```

#### View id=4730: `Odoo Studio: task.form.inherit` — type=`form` (inherits id=4642: task.form.inherit)
- priority: 99 | active: True

```xml
<data>
    <xpath expr="//button[@name='action_preview_worksheet'][2]" position="attributes">
      <!--attribute name="attrs">{'invisible': True}</attribute> -->
      <!--attribute name="states" />-->
      <attribute name="invisible">1</attribute></xpath>
    
    <xpath expr="//button[@name='action_send_report'][2]" position="attributes">
      <attribute name="invisible">1</attribute></xpath>
  </data>
```

#### View id=4620: `Odoo Studio: view.task.form2.inherit` — type=`form` (inherits id=1630: view.task.form2.inherit)
- priority: 99 | active: True

```xml
<data>
    <xpath expr="//button[@name='action_timer_start']" position="attributes">
      <attribute name="invisible">1</attribute></xpath>
    
    <!--xpath expr="//button[@name='action_fsm_validate'][2]" position="attributes">
      <attribute name="attrs">{'invisible': ['|',('display_mark_as_done_secondary', '=', False),('x_studio_valid_confirm_so', '=', False)]}</attribute> 
    </xpath-->
    
    <xpath expr="//field[@name='fsm_done']" position="after">
                    <field name="x_studio_payment_type" invisible="1"/>
                    <field name="x_studio_quotation_type" invisible="1"/>
                    <field name="x_studio_valid_invoiced_so" invisible="1"/>
                    <field name="x_studio_incomplete_delivery_available" invisible="1"/>
                    <field name="x_studio_cancelled" invisible="1"/>
                    <field name="x_studio_end_quick_repair" invisible="1"/>
                    <field name="x_studio_valid_diagnosis" invisible="1"/>
                    <field name="x_studio_repair_image_01" invisible="1"/>
                    <field name="helpdesk_ticket_id" invisible="1"/>
                </xpath><xpath expr="//button[@name='action_fsm_validate'][2]" position="attributes">
      <attribute name="invisible">(not display_mark_as_done_secondary) or (((x_studio_incomplete_delivery_available == True) and ((x_studio_valid_invoiced_so == False) and ((x_studio_payment_type == 'Credit') and (x_studio_quotation_type == 'Repair')))) or (((x_studio_incomplete_delivery_available == True) and ((x_studio_valid_invoiced_so == True) and ((x_studio_payment_type == 'Credit') and (x_studio_quotation_type == 'Repair')))) or ((x_studio_incomplete_delivery_available == True) or ((x_studio_valid_invoiced_so == False) or (display_mark_as_done_secondary == False)))))</attribute></xpath>
  </data>
```

### 5d. Views for x_ custom models

#### View id=4965: `Default form view for x_diagnosis_areas` [model=`x_diagnosis_areas`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Diagnosis Areas">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_36cd75">
      <group name="studio_group_36cd75_left"/>
      <group name="studio_group_36cd75_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4969: `Default form view for x_diagnosis_codes` [model=`x_diagnosis_codes`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Diagnosis Codes">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_484e69">
      <group name="studio_group_484e69_left"/>
      <group name="studio_group_484e69_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4938: `Default form view for x_repair_accounts` [model=`x_repair_accounts`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Repair Accounts">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_bf46f3">
      <group name="studio_group_bf46f3_left"/>
      <group name="studio_group_bf46f3_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4613: `Default form view for x_repair_reason` [model=`x_repair_reason`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Repair Reason">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_594a5d">
      <group name="studio_group_594a5d_left"/>
      <group name="studio_group_594a5d_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4991: `Default form view for x_repair_reason_custom` [model=`x_repair_reason_custom`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Repair Reason - Customer">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_3e77b9">
      <group name="studio_group_3e77b9_left"/>
      <group name="studio_group_3e77b9_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4982: `Default form view for x_repair_stages` [model=`x_repair_stages`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Repair Stages">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_ec9e3c">
      <group name="studio_group_ec9e3c_left"/>
      <group name="studio_group_ec9e3c_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4973: `Default form view for x_repair_sub_reason` [model=`x_repair_sub_reason`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Repair Sub Reason">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_88fc7c">
      <group name="studio_group_88fc7c_left"/>
      <group name="studio_group_88fc7c_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4978: `Default form view for x_resolutions` [model=`x_resolutions`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Resolutions">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_6a461b">
      <group name="studio_group_6a461b_left"/>
      <group name="studio_group_6a461b_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4955: `Default form view for x_symptom_areas` [model=`x_symptom_areas`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Symptom Areas">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_eb0399">
      <group name="studio_group_eb0399_left"/>
      <group name="studio_group_eb0399_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4961: `Default form view for x_symptom_codes` [model=`x_symptom_codes`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Symptom Codes">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_4d111b">
      <group name="studio_group_4d111b_left"/>
      <group name="studio_group_4d111b_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4986: `Default form view for x_task_diagnosis` [model=`x_task_diagnosis`] — type=`form`
- priority: 16 | active: True

```xml
<form>
  <header/>
  <sheet string="Task Diagnosis">
    <widget name="web_ribbon" text="Archived" bg_color="bg-danger" invisible="x_active == True"/>
    <field name="x_active" invisible="1"/>
    <div class="oe_title">
                <h1>
                    <field name="x_name" required="1" placeholder="Name..."/>
                </h1>
            </div>
    <group name="studio_group_39d2e1">
      <group name="studio_group_39d2e1_left"/>
      <group name="studio_group_39d2e1_right"/>
    </group>
  </sheet>
  <div class="oe_chatter" name="oe_chatter">
    <field name="message_follower_ids"/>
    <field name="message_ids"/>
    <field name="activity_ids"/>
  </div>
</form>
```

#### View id=4964: `Default list view for x_diagnosis_areas` [model=`x_diagnosis_areas`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4968: `Default list view for x_diagnosis_codes` [model=`x_diagnosis_codes`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4937: `Default list view for x_repair_accounts` [model=`x_repair_accounts`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4612: `Default list view for x_repair_reason` [model=`x_repair_reason`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4990: `Default list view for x_repair_reason_custom` [model=`x_repair_reason_custom`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4981: `Default list view for x_repair_stages` [model=`x_repair_stages`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4972: `Default list view for x_repair_sub_reason` [model=`x_repair_sub_reason`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4977: `Default list view for x_resolutions` [model=`x_resolutions`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4954: `Default list view for x_symptom_areas` [model=`x_symptom_areas`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4960: `Default list view for x_symptom_codes` [model=`x_symptom_codes`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4985: `Default list view for x_task_diagnosis` [model=`x_task_diagnosis`] — type=`tree`
- priority: 16 | active: True

```xml
<tree>
  <field name="x_studio_sequence" widget="handle"/>
  <field name="x_name"/>
</tree>
```

#### View id=4966: `Default search view for x_diagnosis_areas` [model=`x_diagnosis_areas`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_diagnosis_areas" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4970: `Default search view for x_diagnosis_codes` [model=`x_diagnosis_codes`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_diagnosis_codes" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4939: `Default search view for x_repair_accounts` [model=`x_repair_accounts`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_accounts" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4614: `Default search view for x_repair_reason` [model=`x_repair_reason`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_reason" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4992: `Default search view for x_repair_reason_custom` [model=`x_repair_reason_custom`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_reason_custom" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4983: `Default search view for x_repair_stages` [model=`x_repair_stages`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_stages" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4974: `Default search view for x_repair_sub_reason` [model=`x_repair_sub_reason`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_repair_sub_reason" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4979: `Default search view for x_resolutions` [model=`x_resolutions`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_resolutions" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4956: `Default search view for x_symptom_areas` [model=`x_symptom_areas`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_symptom_areas" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4962: `Default search view for x_symptom_codes` [model=`x_symptom_codes`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_symptom_codes" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4987: `Default search view for x_task_diagnosis` [model=`x_task_diagnosis`] — type=`search`
- priority: 16 | active: True

```xml
<search>
  <field name="x_name"/>
  <separator/>
  <filter string="Archived" name="archived_x_task_diagnosis" domain="[['x_active', '=', False]]"/>
  <separator/>
</search>
```

#### View id=4941: `Odoo Studio: Default form view for x_repair_accounts customization` [model=`x_repair_accounts`] — type=`form` (inherits id=4938: Default form view for x_repair_accounts)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//form[1]" position="attributes">
    <attribute name="create">true</attribute>
  </xpath>
  <xpath expr="//group[@name='studio_group_bf46f3_left']" position="attributes">
    <attribute name="string">RUG Repair Accounts in Invoicing</attribute>
  </xpath>
  <xpath expr="//group[@name='studio_group_bf46f3_left']" position="inside">
    <field name="x_studio_rug_account" string="RUG Account" required="1"/>
  </xpath>
  <xpath expr="//group[@name='studio_group_bf46f3_right']" position="inside">
    <field name="x_studio_company_id" string="Company" force_save="True" readonly="1"/>
  </xpath>
</data>
```

#### View id=4967: `Odoo Studio: Default list view for x_diagnosis_areas customization` [model=`x_diagnosis_areas`] — type=`tree` (inherits id=4964: Default list view for x_diagnosis_areas)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Diagnosis Area</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4971: `Odoo Studio: Default list view for x_diagnosis_codes customization` [model=`x_diagnosis_codes`] — type=`tree` (inherits id=4968: Default list view for x_diagnosis_codes)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Diagnosis Code</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_diagnosis_area_1" string="Diagnosis Area" options="{&quot;no_create&quot;:true}"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4940: `Odoo Studio: Default list view for x_repair_accounts customization` [model=`x_repair_accounts`] — type=`tree` (inherits id=4937: Default list view for x_repair_accounts)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="create">true</attribute>
    <attribute name="delete">true</attribute>
    <attribute name="edit">true</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field name="id" optional="show"/>
  </xpath>
</data>
```

#### View id=4615: `Odoo Studio: Default list view for x_repair_reason customization` [model=`x_repair_reason`] — type=`tree` (inherits id=4612: Default list view for x_repair_reason)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Repair Reason</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4993: `Odoo Studio: Default list view for x_repair_reason_custom customization` [model=`x_repair_reason_custom`] — type=`tree` (inherits id=4990: Default list view for x_repair_reason_custom)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Repair Reason</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4984: `Odoo Studio: Default list view for x_repair_stages customization` [model=`x_repair_stages`] — type=`tree` (inherits id=4981: Default list view for x_repair_stages)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Repair Stage</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4976: `Odoo Studio: Default list view for x_repair_sub_reason customization` [model=`x_repair_sub_reason`] — type=`tree` (inherits id=4972: Default list view for x_repair_sub_reason)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Sub Reason Code</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_reason_code" string="Reason Code" options="{&quot;no_create&quot;:true}"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4980: `Odoo Studio: Default list view for x_resolutions customization` [model=`x_resolutions`] — type=`tree` (inherits id=4977: Default list view for x_resolutions)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Resolution</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4959: `Odoo Studio: Default list view for x_symptom_areas customization` [model=`x_symptom_areas`] — type=`tree` (inherits id=4954: Default list view for x_symptom_areas)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Symptom Area</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4963: `Odoo Studio: Default list view for x_symptom_codes customization` [model=`x_symptom_codes`] — type=`tree` (inherits id=4960: Default list view for x_symptom_codes)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_studio_sequence']" position="attributes">
    <attribute name="column_invisible">1</attribute></xpath>
  <xpath expr="//field[@name='x_name']" position="attributes">
    <attribute name="string">Symptom Code</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_description" string="Description"/>
    <field optional="show" name="x_studio_symptom_area" string="Symptom Area" options="{&quot;no_create&quot;:true}"/>
    <field optional="show" name="x_studio_company_id" string="Company"/>
  </xpath>
</data>
```

#### View id=4988: `Odoo Studio: Default list view for x_task_diagnosis customization` [model=`x_task_diagnosis`] — type=`tree` (inherits id=4985: Default list view for x_task_diagnosis)
- priority: 99 | active: True

```xml
<data>
  <xpath expr="//tree[1]" position="attributes">
    <attribute name="editable">bottom</attribute>
  </xpath>
  <xpath expr="//field[@name='x_name']" position="after">
    <field optional="show" name="x_studio_task_id" string="Task Id" column_invisible="1"/>
  </xpath>
</data>
```

## 6. Window Actions

| ID | Name | Model | View Modes | Domain | Target |
|---|---|---|---|---|---|
| 554 | All Tasks | `project.task` | tree,kanban,map,calendar,gantt,pivot,graph,form,activity | [('is_fsm', '=', True), ('project_id', '!=', False), ('di... | current |
| 3094 | All Tasks | `project.task` | kanban,tree,form,gantt,calendar,map,pivot,graph,activity | [('display_in_project', '=', True)] | current |
| 1790 | All Tickets | `helpdesk.ticket` | tree,kanban,form,activity,pivot,graph,cohort |  | current |
| 266 | Assigned Tasks | `project.task` | tree,form,calendar,graph,pivot | [('project_id', '!=', False)] | current |
| 3085 | Closed Tickets | `helpdesk.ticket` | tree,kanban,form,activity,pivot,graph,cohort | [('close_date', '>=', '2025-03-11 10:18:26')] | current |
| 1794 | Closed Tickets Analysis | `helpdesk.ticket` | tree,form,pivot,graph | [('close_date', '>=', '2025-03-17 22:18:26')] | current |
| 3120 | Convert to Task | `project.task` | form |  | new |
| 1811 | Create a Repair Order | `repair.order` | form |  | current |
| 2212 | Diagnosis Areas | `x_diagnosis_areas` | tree,form |  | current |
| 2213 | Diagnosis Codes | `x_diagnosis_codes` | tree,form |  | current |
| 553 | Map | `project.task` | map,calendar,gantt,kanban,tree,pivot,graph,activity,form | [('is_fsm', '=', True), ('project_id', '!=', False), ('di... | current |
| 552 | My Tasks | `project.task` | kanban,tree,map,calendar,gantt,form,graph,pivot,activity | [('is_fsm', '=', True), ('project_id', '!=', False), ('di... | current |
| 262 | My Tasks | `project.task` | kanban,tree,form,gantt,calendar,map,pivot,graph,activity | [('user_ids', 'in', uid)] | current |
| 1789 | My Tickets | `helpdesk.ticket` | list,kanban,form,activity,pivot,graph,cohort |  | current |
| 264 | Overpassed Tasks | `project.task` | tree,form,calendar,graph,kanban | [('state', 'in', ['01_in_progress', '02_changes_requested... | current |
| 1800 | Performance Analysis | `helpdesk.ticket` | pivot,graph |  | current |
| 557 | Planning by Project | `project.task` | gantt,calendar,map,tree,kanban,pivot,graph,activity | [('is_fsm', '=', True), ('project_id', '!=', False), ('di... | current |
| 556 | Planning by User | `project.task` | gantt,calendar,map,tree,kanban,pivot,graph,form,activity | [('is_fsm', '=', True), ('project_id', '!=', False), ('di... | current |
| 2012 | Planning by Worksheet Template | `project.task` | kanban,tree,calendar,map,pivot,graph,activity | [('is_fsm', '=', True), ('project_id', '!=', False), ('di... | current |
| 1916 | Project Sharing | `project.task` | kanban,tree,form | [('project_id', '=', active_id), ('display_in_project', '... | current |
| 265 | Project's tasks | `project.task` | tree,form,calendar,graph,kanban | [('project_id', '=', active_id), ('display_in_project', '... | current |
| 2175 | Repair Accounts | `x_repair_accounts` | tree,form |  | current |
| 2312 | Repair Job Details | `helpdesk.ticket` | kanban,tree,form,pivot,graph,activity |  | current |
| 2234 | Repair Job Details for the Period - RUG Only | `helpdesk.ticket` | kanban,tree,form,pivot,graph,activity |  | current |
| 3179 | Repair Orders | `repair.order` | tree,kanban,form | [('picking_type_id', '=', active_id)] | current |
| 710 | Repair Orders | `repair.order` | tree,kanban,graph,pivot,form |  | current |
| 3178 | Repair Orders | `repair.order` | form |  | current |
| 709 | Repair Orders | `repair.order` | tree,kanban,graph,pivot,form,activity |  | current |
| 1975 | Repair Reason | `x_repair_reason` | tree,form |  | current |
| 2218 | Repair Reason - Customer | `x_repair_reason_custom` | tree,form |  | current |
| 2216 | Repair Stages | `x_repair_stages` | tree,form |  | current |
| 2214 | Repair Sub Reason | `x_repair_sub_reason` | tree,form |  | current |
| 2215 | Resolutions | `x_resolutions` | tree,form |  | current |
| 2947 | Sub-tasks | `project.task` | tree,kanban,form | [('id', 'child_of', active_id), ('id', '!=', active_id)] | current |
| 2941 | Sub-tasks | `project.task` | tree,kanban,form,calendar,gantt,map,pivot,graph,activity | [('id', 'child_of', active_id), ('id', '!=', active_id)] | current |
| 3087 | Success Rate | `helpdesk.ticket` | tree,kanban,form,activity,pivot,graph,cohort | [('close_date', '>=', '2025-03-11 10:18:26')] | current |
| 1801 | Success Rate Analysis | `helpdesk.ticket` | tree,form,pivot,graph | [('close_date', '>=', '2025-03-17 22:18:26')] | current |
| 2210 | Symptom Areas | `x_symptom_areas` | tree,form |  | current |
| 2211 | Symptom Codes | `x_symptom_codes` | tree,form |  | current |
| 2217 | Task Diagnosis | `x_task_diagnosis` | tree,form |  | current |
| 261 | Tasks | `project.task` | kanban,tree,form,calendar,pivot,graph,gantt,activity,map | [('project_id', '!=', False), ('display_in_project', '=',... | current |
| 251 | Tasks | `project.task` | tree,gantt,kanban,form,calendar,pivot,graph,activity | [('project_id', '=', active_id)] | current |
| 263 | Tasks | `project.task` | kanban,tree,form |  | current |
| 2995 | Tasks | `project.task` | kanban,tree,gantt,calendar,map,pivot,graph,form,activity | [('is_fsm', '=', True), ('project_id', '=', active_id), (... | current |
| 2946 | Tasks | `project.task` | kanban,tree,gantt,calendar,map,pivot,graph,activity,form | [('milestone_id', '=', active_id)] | current |
| 1796 | Tickets | `helpdesk.ticket` | kanban,tree,form,activity,pivot,graph,cohort | [('team_id', '=', active_id)] | current |
| 1792 | Tickets | `helpdesk.ticket` | list,kanban,form,activity,pivot,graph,cohort |  | current |
| 1797 | Tickets | `helpdesk.ticket` | kanban,list,form,activity,pivot,graph,cohort | [('team_id', '=', active_id)] | current |
| 2074 | Tickets | `helpdesk.ticket` | tree,kanban,form,pivot,graph,activity | [('project_id', '=', active_id)] | current |
| 1793 | Tickets | `helpdesk.ticket` | list,kanban,form,activity,pivot,graph,cohort | [] | current |
| 613 | To Invoice | `project.task` | tree,kanban,map,calendar,gantt,pivot,graph,form,activity | [('is_fsm', '=', True), ('project_id', '!=', False), ('di... | current |
| 555 | To Schedule | `project.task` | tree,kanban,map,calendar,gantt,pivot,graph,form,activity | [('is_fsm', '=', True), ('project_id', '!=', False), ('di... | current |
| 3118 | To-dos | `project.task` | kanban,form,tree,activity | [('user_ids', 'in', [uid]), ('project_id', '=', False), (... | current |
| 2802 | project.task | `project.task` | kanban,tree,form,calendar,gantt,map,pivot,graph,activity,cohort |  | current |
| 2807 | repair.order | `repair.order` | kanban,tree,form,pivot,graph |  | current |

## 7. Access Rights & Security

### 7a. Access Rights Table

#### `helpdesk.ticket`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| helpdesk.ticket_on_internal_user | User types / Internal User | Y |  |  |  |
| helpdesk.ticket | Helpdesk / Jin - Repair - Full Rights | Y | Y | Y |  |
| helpdesk.ticket | Helpdesk / Jin - Repair - Minimum Rights | Y |  |  |  |
| helpdesk.ticket | Helpdesk / Jin - Repair - Ticket Creater | Y | Y | Y | Y |
| helpdesk.ticket.portal | User types / Portal | Y |  |  |  |
| helpdesk.ticket | Helpdesk / User | Y | Y | Y | Y |

#### `project.task`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| project.task on partners | User types / Internal User | Y | Y | Y | Y |
| Proj. Task | Accounting / Jin - ProjectInvoice | Y |  |  |  |
| project.task.helpdesk.user | Helpdesk / Jin - Repair - Full Rights | Y |  |  |  |
| project.task.helpdesk.user | Helpdesk / Jin - Repair - Minimum Rights | Y |  |  |  |
| project.task.helpdesk.user | Helpdesk / Jin - Repair - Ticket Creater | Y |  |  |  |
| task_portal | User types / Portal | Y |  |  |  |
| project.task | Project / User | Y | Y | Y | Y |
| project.task.helpdesk.user | Helpdesk / User | Y |  |  |  |

#### `repair.order`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair user | Manufacturing / Jin - Manufacturing - MO Operator | Y |  |  |  |
| Repair user | Manufacturing / Jin - Manufacturing - Production Orders Dismantler | Y |  |  |  |
| Repair user | Manufacturing / Jin - Manufacturing - Those with only view Rights | Y |  |  |  |
| Repair user | Purchase / Jin - PO Goods Receivers | Y |  |  |  |
| Repair Oreder | Helpdesk / Jin - Repair - Full Rights | Y | Y | Y | Y |
| Repair user | Inventory / User | Y |  |  |  |

#### `repair.tags`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Tags user | Manufacturing / Jin - Manufacturing - MO Operator | Y |  |  |  |
| Repair Tags user | Manufacturing / Jin - Manufacturing - Production Orders Dismantler | Y |  |  |  |
| Repair Tags user | Manufacturing / Jin - Manufacturing - Those with only view Rights | Y |  |  |  |
| Repair Tags user | Purchase / Jin - PO Goods Receivers | Y |  |  |  |
| Repair Tags user | Inventory / User | Y |  |  |  |

#### `repair.warn.uncomplete.move`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| access.repair.warn.uncomplete.move | Inventory / User | Y |  |  |  |

#### `stock.warn.insufficient.qty.repair`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| access.stock.warn.insufficient.qty.repair | Manufacturing / Jin - Manufacturing - MO Operator | Y |  |  |  |
| access.stock.warn.insufficient.qty.repair | Manufacturing / Jin - Manufacturing - Production Orders Dismantler | Y |  |  |  |
| access.stock.warn.insufficient.qty.repair | Manufacturing / Jin - Manufacturing - Those with only view Rights | Y |  |  |  |
| access.stock.warn.insufficient.qty.repair | Purchase / Jin - PO Goods Receivers | Y |  |  |  |
| access.stock.warn.insufficient.qty.repair | Inventory / User | Y |  |  |  |

#### `x_diagnosis_areas`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Diagnosis Areas group_user | User types / Internal User | Y |  |  |  |
| Diagnosis Areas group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_diagnosis_codes`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Diagnosis Codes group_user | User types / Internal User | Y |  |  |  |
| Diagnosis Codes group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_repair_accounts`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Accounts group_user | User types / Internal User | Y |  |  |  |
| Repair Accounts group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_repair_reason`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Reason group_user | User types / Internal User | Y |  |  |  |
| Repair Reason group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_repair_reason_custom`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Reason - Customer group_user | User types / Internal User | Y |  |  |  |
| Repair Reason - Customer group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_repair_stages`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Stages group_user | User types / Internal User | Y |  |  |  |
| Repair Stages group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_repair_sub_reason`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Repair Sub Reason group_user | User types / Internal User | Y |  |  |  |
| Repair Sub Reason group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_resolutions`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Resolutions group_user | User types / Internal User | Y |  |  |  |
| Resolutions group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_symptom_areas`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Symptom Areas group_user | User types / Internal User | Y |  |  |  |
| Symptom Areas group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_symptom_codes`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Symptom Codes group_user | User types / Internal User | Y |  |  |  |
| Symptom Codes group_system | Administration / Settings | Y | Y | Y | Y |

#### `x_task_diagnosis`

| Rule Name | Group | Read | Write | Create | Delete |
|---|---|---|---|---|---|
| Task Diagnosis group_user | User types / Internal User | Y |  |  |  |
| Task Diagnosis group_system | Administration / Settings | Y | Y | Y | Y |

### 7b. Record Rules

#### Rule: `Project/Task: multi-company` — model: `project.task`

- **Domain:** `[('company_id', 'in', company_ids + [False])]`
- **Groups:** (global)
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Project/Task: employees: follow required for follower-only projects` — model: `project.task`

- **Domain:** `[
            '|',
                '&',
                    ('project_id', '!=', False),
                    '|',
                        ('project_id.privacy_visibility', '!=', 'followers'),
                        ('project_id.message_partner_ids', 'in', [user.partner_id.id]),
                '|',
                    ('message_partner_ids', 'in', [user.partner_id.id]),
                    # to subscribe check access to the record, follower is not enough at creation
                    ('user_ids', 'in', user.id)
        ]`
- **Groups:** [1]
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Project/Task: project manager: see all tasks linked to a project or its own tasks` — model: `project.task`

- **Domain:** `[
            '|', ('project_id', '!=', False),
                 ('user_ids', 'in', user.id),
        ]`
- **Groups:** [32]
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Project/Task: portal users: (portal and following project) or (portal and following task)` — model: `project.task`

- **Domain:** `[
        ('project_id.privacy_visibility', '=', 'portal'),
        ('active', '=', True),
        '|',
            ('project_id.message_partner_ids', 'child_of', [user.partner_id.commercial_partner_id.id]),
            ('message_partner_ids', 'child_of', [user.partner_id.commercial_partner_id.id]),
        ]`
- **Groups:** [9]
- **Permissions:** read=True write=False create=False unlink=False
- **Active:** True

#### Rule: `Project: See private tasks` — model: `project.task`

- **Domain:** `[
            ('project_id.privacy_visibility', '!=', 'followers'),
            '|', '|', ('project_id', '!=', False),
                      ('parent_id', '!=', False),
                 ('user_ids', 'in', user.id),
        ]`
- **Groups:** [31]
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Project/Task: employees: Full access to own private task only` — model: `project.task`

- **Domain:** `[('project_id', '=', False), ('user_ids', 'in', user.id), ('parent_id', '=', False)]`
- **Groups:** [1]
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Project/Task: project users: follow required for follower-only projects` — model: `project.task`

- **Domain:** `[
            '|',
                '&',
                    ('project_id', '!=', False),
                    '|',
                        ('project_id.privacy_visibility', '!=', 'followers'),
                        ('project_id.message_partner_ids', 'in', [user.partner_id.id]),
                '|',
                    ('message_partner_ids', 'in', [user.partner_id.id]),
                    # to subscribe check access to the record, follower is not enough at creation
                    ('user_ids', 'in', user.id)
        ]`
- **Groups:** [31]
- **Permissions:** read=False write=True create=True unlink=True
- **Active:** True

#### Rule: `repair order multi-company` — model: `repair.order`

- **Domain:** `[('company_id', 'in', company_ids)]`
- **Groups:** (global)
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Helpdesk Ticket Administrator` — model: `helpdesk.ticket`

- **Domain:** `[(1,'=',1)]`
- **Groups:** [147]
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Helpdesk Ticket User` — model: `helpdesk.ticket`

- **Domain:** `['|',
                                        '|',
                                            ('team_id.privacy_visibility', '!=', 'invited_internal'),
                                            ('team_id.message_partner_ids', 'in', [user.partner_id.id]),
                                            ('message_partner_ids', 'in', [user.partner_id.id]),
                                        ]`
- **Groups:** [1, 226, 225, 234, 146]
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Ticket: multi-company` — model: `helpdesk.ticket`

- **Domain:** `[('company_id', 'in', company_ids + [False])]`
- **Groups:** (global)
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

#### Rule: `Tickets: portal users: portal or following` — model: `helpdesk.ticket`

- **Domain:** `[
                '|',
                    ('message_partner_ids', 'child_of', [user.partner_id.commercial_partner_id.id]),
                    ('message_partner_ids', 'in', [user.partner_id.id])
            ]`
- **Groups:** [9]
- **Permissions:** read=True write=True create=True unlink=True
- **Active:** True

## 8. Menus

| ID | Name | Full Path | Action | Groups | Sequence |
|---|---|---|---|---|---|
| 374 | All Tasks | Field Service/All Tasks/All Tasks | ir.actions.act_window,554 | [69] | 10 |
| 421 | To Invoice | Field Service/All Tasks/To Invoice | ir.actions.act_window,613 | [48] | 30 |
| 375 | To Schedule | Field Service/All Tasks/To Schedule | ir.actions.act_window,555 | [69] | 20 |
| 372 | Map | Field Service/My Tasks/Map | ir.actions.act_window,553 | [68] | 20 |
| 371 | Tasks | Field Service/My Tasks/Tasks | ir.actions.act_window,552 | [68] | 10 |
| 378 | By Project | Field Service/Planning/By Project | ir.actions.act_window,557 | [69] | 15 |
| 377 | By User | Field Service/Planning/By User | ir.actions.act_window,556 | [69] | 10 |
| 980 | By Worksheet Template | Field Service/Planning/By Worksheet Template | ir.actions.act_window,2012 | [69] | 20 |
| 909 | Helpdesk | Helpdesk |  | [21, 226, 225, 234, 146] | 90 |
| 920 | Helpdesk Teams | Helpdesk/Configuration/Helpdesk Teams | ir.actions.act_window,1806 | [147] | 0 |
| 1054 | Repair Accounts | Helpdesk/Configuration/Repair Accounts | ir.actions.act_window,2175 | [] | 7 |
| 1061 | Repair Diagnosis | Helpdesk/Repair Diagnosis | ir.actions.act_url,3 | [] | 101 |
| 1065 | Diagnosis Areas | Helpdesk/Repair Diagnosis/Diagnosis Areas | ir.actions.act_window,2212 | [] | 3 |
| 1066 | Diagnosis Codes | Helpdesk/Repair Diagnosis/Diagnosis Codes | ir.actions.act_window,2213 | [] | 4 |
| 977 | Repair Reason | Helpdesk/Repair Diagnosis/Repair Reason | ir.actions.act_window,1975 | [] | 5 |
| 1071 | Repair Reason - Customer | Helpdesk/Repair Diagnosis/Repair Reason - Customer | ir.actions.act_window,2218 | [] | 6 |
| 1069 | Repair Stages | Helpdesk/Repair Diagnosis/Repair Stages | ir.actions.act_window,2216 | [] | 9 |
| 1067 | Repair Sub Reason | Helpdesk/Repair Diagnosis/Repair Sub Reason | ir.actions.act_window,2214 | [] | 7 |
| 1068 | Resolutions | Helpdesk/Repair Diagnosis/Resolutions | ir.actions.act_window,2215 | [] | 8 |
| 1063 | Symptom Areas | Helpdesk/Repair Diagnosis/Symptom Areas | ir.actions.act_window,2210 | [] | 1 |
| 1064 | Symptom Codes | Helpdesk/Repair Diagnosis/Symptom Codes | ir.actions.act_window,2211 | [] | 2 |
| 1087 | Repair Job Details | Helpdesk/Reporting/Repair Job Details | ir.actions.act_window,2312 | [] | 3 |
| 1088 | Repair Sales Order List | Helpdesk/Reporting/Repair Sales Order List | ir.actions.act_window,2330 | [] | 4 |
| 919 | All Tickets | Helpdesk/Tickets/All Tickets | ir.actions.act_window,1790 | [] | 20 |
| 918 | My Tickets | Helpdesk/Tickets/My Tickets | ir.actions.act_window,1789 | [] | 10 |
| 1730 | Configuration | Jinasena Reports/Configuration |  | [] | 100 |
| 1747 | Configuration | Material Management Module/Configuration |  | [] | 3 |
| 825 | Custom Configuration | Payroll/Configuration/Custom Configuration |  | [] | 3 |
| 142 | My Tasks | Project/My Tasks | ir.actions.act_window,262 | [6, 31] | 2 |
| 1576 | All Tasks | Project/My Tasks/All Tasks | ir.actions.act_window,3094 | [] | 2 |
| 492 | Repairs | Repairs | ir.actions.act_window,709 | [20] | 165 |
| 496 | Repair Orders Tags | Repairs/Configuration/Repair Orders Tags | ir.actions.act_window,711 | [] | 10 |
| 1623 | Orders | Repairs/Orders | ir.actions.act_window,709 | [20] | 10 |
| 494 | Repairs | Repairs/Reporting/Repairs | ir.actions.act_window,710 | [] | 10 |
| 1459 | Helpdesk Team (helpdesk.team) | TEST APP 05/Projects/Helpdesk Team (helpdesk.team) | ir.actions.act_window,2876 | [] | 6 |
| 1379 | project.task | TEST APP 05/Projects/project.task | ir.actions.act_window,2802 | [] | 2 |
| 1070 | Task Diagnosis | TEST APP 05/Task Diagnosis | ir.actions.act_window,2217 | [] | 52 |
| 1384 | repair.order | TEST APP 05/repair.order | ir.actions.act_window,2807 | [] | 94 |
