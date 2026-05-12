# Repair/Helpdesk Critical Data Reference

> **Purpose:** Complete data reference for the `jinasena_helpdesk_repair` custom module that will replace all Odoo Studio customizations in the repair/helpdesk workflow.

## Metadata

| Field | Value |
| --- | --- |
| `source` | rohanabalagalla-jinstage-clear-db-29834478.dev.odoo.com |
| `odoo_version` | 17.0+e |
| `extracted_by` | XML-RPC |
| `extraction_date` | 2026-05-12 |

## Section 1: Selection Field Values

These are the allowed selection values for Studio-added selection fields on each model.

### stock.picking Selection Fields

#### `x_studio_pr_type`

| Value | Label | Sequence |
| --- | --- | --- |
| Local | Local | 0 |
| Import | Import | 1 |

#### `x_studio_quotation_type`

| Value | Label | Sequence |
| --- | --- | --- |
| Sales | Sales | 0 |
| Project | Project | 1 |
| Repair | Repair | 2 |

#### `x_studio_related_field_zZDiA`

| Value | Label | Sequence |
| --- | --- | --- |
| Sales | Sales | 0 |
| Project | Project | 1 |
| Repair | Repair | 2 |

#### `x_studio_quotation_type_2`

| Value | Label | Sequence |
| --- | --- | --- |
| Sales | Sales | 0 |
| Project | Project | 1 |
| Repair | Repair | 2 |

#### `x_studio_gl_account_status`

| Value | Label | Sequence |
| --- | --- | --- |
| Pending | Pending | 0 |
| Updated | Updated | 1 |

#### `x_studio_type_of_operation`

| Value | Label | Sequence |
| --- | --- | --- |
| incoming | Receipt | 0 |
| outgoing | Delivery | 1 |
| internal | Internal Transfer | 2 |
| mrp_operation | Manufacturing | 3 |

### project.task Selection Fields

#### `x_studio_priority`

| Value | Label | Sequence |
| --- | --- | --- |
| Highest | Highest | 0 |
| High | High | 1 |
| Normal | Normal | 2 |
| Low | Low | 3 |
| Lowest | Lowest | 4 |

#### `x_studio_quotation_type`

| Value | Label | Sequence |
| --- | --- | --- |
| Sales | Sales | 0 |
| Project | Project | 1 |
| Repair | Repair | 2 |

#### `x_studio_material_availability`

| Value | Label | Sequence |
| --- | --- | --- |
| Material Not Ready | Material Not Ready | 0 |
| Material Ready | Material Ready | 1 |

#### `x_studio_quick_repair_status_1`

| Value | Label | Sequence |
| --- | --- | --- |
| None | None | 0 |
| Quick Repair | Quick Repair | 1 |

#### `x_studio_payment_type`

| Value | Label | Sequence |
| --- | --- | --- |
| Cash | Cash | 0 |
| Credit | Credit | 1 |

### helpdesk.ticket Selection Fields

#### `x_studio_job_location`

| Value | Label | Sequence |
| --- | --- | --- |
| Centre Repair | Centre Repair | 0 |
| Factory Repair | Factory Repair | 1 |

#### `x_studio_material_availability`

| Value | Label | Sequence |
| --- | --- | --- |
| Material Not Ready | Material Not Ready | 0 |
| Material Ready | Material Ready | 1 |

#### `x_studio_tracking`

| Value | Label | Sequence |
| --- | --- | --- |
| serial | By Unique Serial Number | 0 |
| lot | By Lots | 1 |
| none | No Tracking | 2 |

#### `x_studio_rug_approval_status`

| Value | Label | Sequence |
| --- | --- | --- |
| Pending RUG Approval | Pending RUG Approval | 0 |
| RUG Approved | RUG Approved | 1 |
| RUG Rejected | RUG Rejected | 2 |

#### `x_studio_cancel_status`

| Value | Label | Sequence |
| --- | --- | --- |
| None | None | 0 |
| Cancelled | Cancelled | 1 |

#### `x_studio_reopen_status`

| Value | Label | Sequence |
| --- | --- | --- |
| None | None | 0 |
| Reopened | Reopened | 1 |

#### `x_studio_re_estimate_status`

| Value | Label | Sequence |
| --- | --- | --- |
| None | None | 0 |
| Re-estimated | Re-estimated | 1 |

#### `x_studio_quick_repair_status`

| Value | Label | Sequence |
| --- | --- | --- |
| None | None | 0 |
| Quick Repair | Tested OK | 1 |

#### `x_studio_city`

| Value | Label | Sequence |
| --- | --- | --- |
| Gampaha | Gampaha | 0 |
| Colombo | Colombo | 1 |
| Yakkala | Yakkala | 2 |

#### `x_studio_branch`

| Value | Label | Sequence |
| --- | --- | --- |
| Colombo | Colombo | 0 |
| Gampah | Gampah | 1 |

## Section 2: Stock Operation Types (Repair-Related)

Total records: 108. Includes all warehouses; repair-specific warehouses use `RP-*` and `RP-JM` prefixes.

| `id` | `name` | `code` | `warehouse_id` | `src_location` | `dest_location` | `sequence_prefix` | `mj_in` | `mj_out` | `movement_journal` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 246 | Returns | `incoming` | BR-AM - Warehouse for Ampara Sales Center |  | BR-AM/Stock | `BR-AM/IN/` |  |  |  |
| 298 | Movement Journals - OUT | `outgoing` | Raw Material Main Warehouse - RP-EK | RP-EK/Stock | Virtual Locations/MJ | `RP-EK/MJ/OUT/` |  | Y | Y |
| 257 | Returns | `incoming` | BR-AN - Warehouse for Anuradhapura Sales Center |  | BR-AN/Stock | `BR-AN/RET/` |  |  |  |
| 247 | Receipts | `incoming` | Repairs warehouse - RP-CM |  | RP-CM/Stock | `RP-CM/IN/` |  |  |  |
| 251 | Internal Transfers | `internal` | Repairs warehouse - RP-CM | RP-CM/Stock | RP-CM/Stock | `RP-CM/INT/` |  |  |  |
| 248 | Delivery Orders | `outgoing` | Repairs warehouse - RP-CM | RP-CM/Stock |  | `RP-CM/OUT/` |  |  |  |
| 256 | PoS Orders | `outgoing` | Repairs warehouse - RP-CM | RP-CM/Stock | Partner Locations/Customers | `RP-CM/POS/` |  |  |  |
| 252 | Returns | `incoming` | Repairs warehouse - RP-CM |  | RP-CM/Stock | `RP-CM/RET/` |  |  |  |
| 255 | Manufacturing | `mrp_operation` | Repairs warehouse - RP-CM | RP-CM/Stock | RP-CM/Stock | `RP-CM/MO/` |  |  |  |
| 258 | Returns | `incoming` | BR-AN - Warehouse for Anuradhapura Sales Center |  | BR-AN/Stock | `BR-AN/RET/` |  |  |  |
| 264 | Returns | `incoming` | BR-EK - Warehouse for Ekala Sales Center |  | BR-EK/Stock | `BR-EK/RET/` |  |  |  |
| 269 | Receipts | `incoming` | Quick Repairs warehouse - RP-QU |  | RP-QU/Stock | `RP-QU/IN/` |  |  |  |
| 273 | Internal Transfers | `internal` | Quick Repairs warehouse - RP-QU | RP-QU/Stock | RP-QU/Stock | `RP-QU/INT/` |  |  |  |
| 270 | Delivery Orders | `outgoing` | Quick Repairs warehouse - RP-QU | RP-QU/Stock |  | `RP-QU/OUT/` |  |  |  |
| 278 | PoS Orders | `outgoing` | Quick Repairs warehouse - RP-QU | RP-QU/Stock | Partner Locations/Customers | `RP-QU/POS/` |  |  |  |
| 274 | Returns | `incoming` | Quick Repairs warehouse - RP-QU |  | RP-QU/Stock | `RP-QU/RET/` |  |  |  |
| 277 | Manufacturing | `mrp_operation` | Quick Repairs warehouse - RP-QU | RP-QU/Stock | RP-QU/Stock | `RP-QU/MO/` |  |  |  |
| 284 | Returns | `incoming` | Electrical Installation Projects warehouse - PJ-EI |  | PJ-EI/Stock | `PJ-EI/RET/` |  |  |  |
| 289 | Returns | `incoming` | Production warehouse - PW-E1 |  | PW-E1/Stock | `PW-E1/RET/` |  |  |  |
| 291 | Returns | `incoming` | BR-AM - Warehouse for Ampara Sales Center |  | BR-AM/Stock | `BR-AM/RET/` |  |  |  |
| 295 | Returns | `incoming` | Main warehouse - MW-EK |  | MW-EK/Stock | `MW-EK/RET/` |  |  |  |
| 302 | Returns | `incoming` | Casting warehouse - CW-CM |  | CW-CM/Stock | `CW-CM/RET/` |  |  |  |
| 305 | Returns | `incoming` | Main warehouse - MW-CM |  | MW-CM/Stock | `MW-CM/RET/` |  |  |  |
| 308 | Returns | `incoming` | Oils & lubricants warehouse - OW-EK |  | OW-EK/Stock | `OW-EK/RET/` |  |  |  |
| 311 | Returns | `incoming` | Retail Sales Counter(Sp) - SP-RC |  | SP-RC/Stock | `SP-RC/RET/` |  |  |  |
| 317 | Returns | `incoming` | Production warehouse - PW-JE |  | PW-JE/Stock | `PW-JE/RET/` |  |  |  |
| 320 | Returns | `incoming` | Production warehouse - PW-MW |  | PW-MW/Stock | `PW-MW/RET/` |  |  |  |
| 325 | Returns | `incoming` | Raw Material Main Warehouse - RP-EK |  | RP-EK/Stock | `RP-EK/RET/` |  |  |  |
| 332 | Returns | `incoming` | RC-TM - Warehouse for Colombo Sales Center |  | RC-TM/Stock | `RC-TM/RET/` |  |  |  |
| 346 | Returns | `incoming` | Casting Department - MW-JC |  | MW-JC/Stock | `MW-JC/RET/` |  |  |  |
| 388 | Returns | `incoming` | Main warehouse - Raw material for motors - MW-JE |  | MW-JE/Stock | `MW-JE/RET/` |  |  |  |
| 502 | Returns | `incoming` | Production Warehouse - (PW-JM) |  | PW-JM/Stock | `PW-JM/RET/` |  |  |  |
| 509 | Receipts | `incoming` | Repairs Warehouse - (RP-JM) |  | RP-JM/Stock | `RP-JM/IN/` |  |  |  |
| 513 | Internal Transfers | `internal` | Repairs Warehouse - (RP-JM) | RP-JM/Stock | RP-JM/Stock | `RP-JM/INT/` |  |  |  |
| 510 | Delivery Orders | `outgoing` | Repairs Warehouse - (RP-JM) | RP-JM/Stock |  | `RP-JM/OUT/` |  |  |  |
| 517 | Manufacturing | `mrp_operation` | Repairs Warehouse - (RP-JM) | RP-JM/Stock | RP-JM/Stock | `RP-JM/MO/` |  |  |  |
| 1082 | MJ-INNN | `incoming` | JAM Warehouse Ekala- (JM-EK) | Virtual Locations/Scrap | JM-EK/Stock | `JM-EK/MJIN/` | Y |  | Y |
| 1080 | MJ - Out | `outgoing` | JAM Warehouse Ekala- (JM-EK) | JM-EK/Stock | Virtual Locations/Scrap | `JM-EK/MJOUT/` |  | Y | Y |
| 757 | Returns | `incoming` | JAM Warehouse Ekala- (JM-EK) |  | JM-EK/Stock | `JM-EK/RET/` |  |  |  |
| 781 | Returns | `incoming` | Production warehouse for Machining and Assembly of JEM - ( PW-MA ) |  | PW-MA/Stock | `PW-MA/RET/` |  |  |  |
| 793 | Returns | `incoming` | Plastic Warehouse - ( PL-EK ) |  | PL-EK/Stock | `PL-EK/RET/` |  |  |  |
| 540 | Returns | `incoming` | Production warehouse - Pumps (PW-E1) |  | PW-E1/Stock | `PW-E1/RET/` |  |  |  |
| 552 | Returns | `incoming` | Production warehouse - Plastic (PL-EK) |  | PL-EK/Stock | `PL-EK/RET/` |  |  |  |
| 564 | Returns | `incoming` | Production warehouse - Casting (MW-JC) |  | MW-JC/Stock | `MW-JC/RET/` |  |  |  |
| 576 | Returns | `incoming` | Casting warehouse -  (CW-CM) |  | CW-CM/Stock | `CW-CM/RET/` |  |  |  |
| 588 | Returns | `incoming` | Raw Material Warehouse - (RP-EK) |  | RP-EK/Stock | `RP-EK/RET/` |  |  |  |
| 600 | Returns | `incoming` | Oils & lubricants warehouse - (OW-EK) |  | OW-EK/Stock | `OW-EK/RET/` |  |  |  |
| 612 | Returns | `incoming` | Production warehouse  JEM Department - (PW-MA) |  | PW-MA/Stock | `PW-MA/RET/` |  |  |  |
| 624 | Returns | `incoming` | Production warehouse - Motor winding & assembly - (PW-JE) |  | PW-JE/Stock | `PW-JE/RET/` |  |  |  |
| 636 | Returns | `incoming` | Main warehouse(Primovers) - (MW-CM) |  | MW-CM/Stock | `MW-CM/RET/` |  |  |  |
| 648 | Returns | `incoming` | Main warehouse - MW-EK |  | MW-EK/Stock | `MW-EK/RET/` |  |  |  |
| 660 | Returns | `incoming` | Main warehouse - Raw material for motors - (MW-JE) |  | MW-JE/Stock | `MW-JE/RET/` |  |  |  |
| 672 | Returns | `incoming` | Production warehouse Motor Winding - (PW-MW) |  | PW-MW/Stock | `PW-MW/RET/` |  |  |  |
| 680 | Receipts | `incoming` | Repair warehouse - Colombo (RP-CM) |  | RP-CM/Stock | `RP-CM/IN/` |  |  |  |
| 684 | Internal Transfers | `internal` | Repair warehouse - Colombo (RP-CM) | RP-CM/Stock | RP-CM/Stock | `RP-CM/INT/` |  |  |  |
| 681 | Delivery Orders | `outgoing` | Repair warehouse - Colombo (RP-CM) | RP-CM/Stock |  | `RP-CM/OUT/` |  |  |  |
| 691 | PoS Orders | `outgoing` | Repair warehouse - Colombo (RP-CM) | RP-CM/Stock | Partner Locations/Customers | `RP-CM/POS/` |  |  |  |
| 685 | Returns | `incoming` | Repair warehouse - Colombo (RP-CM) |  | RP-CM/Stock | `RP-CM/RET/` |  |  |  |
| 688 | Manufacturing | `mrp_operation` | Repair warehouse - Colombo (RP-CM) | RP-CM/Stock | RP-CM/Stock | `RP-CM/MO/` |  |  |  |
| 697 | Returns | `incoming` | Branch warehouse - Ekala (BR-EK) |  | BR-EK/Stock | `BR-EK/RET/` |  |  |  |
| 821 | Repairs | `repair_operation` | Production Warehouse - (PW-JM) | PW-JM/Stock | Virtual Locations/Production | `PW-JM/RO/` |  |  |  |
| 822 | Repairs | `repair_operation` | Repairs Warehouse - (RP-JM) | RP-JM/Stock | Virtual Locations/Production | `RP-JM/RO/` |  |  |  |
| 823 | Repairs | `repair_operation` | Branch Warehouse - Ekala(BR-EK) | BR-EK/Stock | Virtual Locations/Production | `BR-EK/RO/` |  |  |  |
| 824 | Repairs | `repair_operation` | Production warehouse - Pumps (PW-E1) | PW-E1/Stock | Virtual Locations/Production | `PW-E1/RO/` |  |  |  |
| 825 | Repairs | `repair_operation` | Production warehouse - Plastic (PL-EK) | PL-EK/Stock | Virtual Locations/Production | `PL-EK/RO/` |  |  |  |
| 826 | Repairs | `repair_operation` | Production warehouse - Casting (MW-JC) | MW-JC/Stock | Virtual Locations/Production | `MW-JC/RO/` |  |  |  |
| 827 | Repairs | `repair_operation` | Casting warehouse -  (CW-CM) | CW-CM/Stock | Virtual Locations/Production | `CW-CM/RO/` |  |  |  |
| 828 | Repairs | `repair_operation` | Raw Material Warehouse - (RP-EK) | RP-EK/Stock | Virtual Locations/Production | `RP-EK/RO/` |  |  |  |
| 829 | Repairs | `repair_operation` | Oils & lubricants warehouse - (OW-EK) | OW-EK/Stock | Virtual Locations/Production | `OW-EK/RO/` |  |  |  |
| 830 | Repairs | `repair_operation` | Production warehouse  JEM Department - (PW-MA) | PW-MA/Stock | Virtual Locations/Production | `PW-MA/RO/` |  |  |  |
| 831 | Repairs | `repair_operation` | Production warehouse - Motor winding & assembly - (PW-JE) | PW-JE/Stock | Virtual Locations/Production | `PW-JE/RO/` |  |  |  |
| 832 | Repairs | `repair_operation` | Main warehouse(Primovers) - (MW-CM) | MW-CM/Stock | Virtual Locations/Production | `MW-CM/RO/` |  |  |  |
| 833 | Repairs | `repair_operation` | Main warehouse - MW-EK | MW-EK/Stock | Virtual Locations/Production | `MW-EK/RO/` |  |  |  |
| 834 | Repairs | `repair_operation` | Main warehouse - Raw material for motors - (MW-JE) | MW-JE/Stock | Virtual Locations/Production | `MW-JE/RO/` |  |  |  |
| 835 | Repairs | `repair_operation` | Production warehouse Motor Winding - (PW-MW) | PW-MW/Stock | Virtual Locations/Production | `PW-MW/RO/` |  |  |  |
| 836 | Repairs | `repair_operation` | Repair warehouse - Colombo (RP-CM) | RP-CM/Stock | Virtual Locations/Production | `RP-CM/RO/` |  |  |  |
| 837 | Repairs | `repair_operation` | Branch warehouse - Ekala (BR-EK) | BR-EK/Stock | Virtual Locations/Production | `BR-EK/RO/` |  |  |  |
| 838 | Repairs | `repair_operation` | JAM Warehouse Ekala- (JM-EK) | JM-EK/Stock | Virtual Locations/Production | `JM-EK/RO/` |  |  |  |
| 850 | Repairs | `repair_operation` | Branch warehouse - Ampara | BR-AM/Stock | Virtual Locations/Production | `BR-AM/RO/` |  |  |  |
| 860 | Repairs | `repair_operation` | Branch warehouse - Anuradhapura | BR-AN/Stock | Virtual Locations/Production | `BR-AN/RO/` |  |  |  |
| 870 | Repairs | `repair_operation` | Branch warehouse - Avissawella | BR-AV/Stock | Virtual Locations/Production | `BR-AV/RO/` |  |  |  |
| 880 | Repairs | `repair_operation` | Branch warehouse - Bandarawela | BR-BA/Stock | Virtual Locations/Production | `BR-BA/RO/` |  |  |  |
| 890 | Repairs | `repair_operation` | Branch warehouse - Beruwela | BR-BE/Stock | Virtual Locations/Production | `BR-BE/RO/` |  |  |  |
| 900 | Repairs | `repair_operation` | Branch warehouse - Buttala | BR-BU/Stock | Virtual Locations/Production | `BR-BU/RO/` |  |  |  |
| 910 | Repairs | `repair_operation` | Branch warehouse - Dambulla | BR-DA/Stock | Virtual Locations/Production | `BR-DA/RO/` |  |  |  |
| 920 | Repairs | `repair_operation` | Branch warehouse - Embilipitiya | BR-EM/Stock | Virtual Locations/Production | `BR-EM/RO/` |  |  |  |
| 930 | Repairs | `repair_operation` | Branch warehouse - Galle | BR-GA/Stock | Virtual Locations/Production | `BR-GA/RO/` |  |  |  |
| 940 | Repairs | `repair_operation` | Branch warehouse - Girandurukotte | BR-GK/Stock | Virtual Locations/Production | `BR-GK/RO/` |  |  |  |
| 950 | Repairs | `repair_operation` | Branch warehouse - Jaffna | BR-JF/Stock | Virtual Locations/Production | `BR-JF/RO/` |  |  |  |
| 960 | Repairs | `repair_operation` | Branch warehouse - Kandy | BR-KA/Stock | Virtual Locations/Production | `BR-KA/RO/` |  |  |  |
| 970 | Repairs | `repair_operation` | Branch warehouse - Kaduruwela | BR-KD/Stock | Virtual Locations/Production | `BR-KD/RO/` |  |  |  |
| 980 | Repairs | `repair_operation` | Branch warehouse - Kurunegala | BR-KU/Stock | Virtual Locations/Production | `BR-KU/RO/` |  |  |  |
| 990 | Repairs | `repair_operation` | Branch warehouse - Nuwara-Eliya | BR-NE/Stock | Virtual Locations/Production | `BR-NE/RO/` |  |  |  |
| 1000 | Repairs | `repair_operation` | Branch warehouse - Thambuttegama | BR-TH/Stock | Virtual Locations/Production | `BR-TH/RO/` |  |  |  |
| 1010 | Repairs | `repair_operation` | JAM Scrap Warehouse | RP-SC/Stock | Virtual Locations/Production | `RP-SC/RO/` |  |  |  |
| 1011 | Receipts | `incoming` | Research and Development JAM Factory Ekala |  | RD-JM/Stock | `RD-JM/IN/` |  |  |  |
| 1015 | Internal Transfers | `internal` | Research and Development JAM Factory Ekala | RD-JM/Stock | RD-JM/Stock | `RD-JM/INT/` |  |  |  |
| 1012 | Delivery Orders | `outgoing` | Research and Development JAM Factory Ekala | RD-JM/Stock |  | `RD-JM/OUT/` |  |  |  |
| 1019 | PoS Orders | `outgoing` | Research and Development JAM Factory Ekala | RD-JM/Stock | Partner Locations/Customers | `RD-JM/POS/` |  |  |  |
| 1020 | Repairs | `repair_operation` | Research and Development JAM Factory Ekala | RD-JM/Stock | Virtual Locations/Production | `RD-JM/RO/` |  |  |  |
| 1030 | Repairs | `repair_operation` | Retail Counter - Waste ManagementX | RC-WX/Stock | Virtual Locations/Production | `RC-WX/RO/` |  |  |  |
| 1040 | Repairs | `repair_operation` | Retail Counter for Products, Implements And Accessories - Thimbirigasya | RC-TM/Stock | Virtual Locations/Production | `RC-TM/RO/` |  |  |  |
| 1050 | Repairs | `repair_operation` | JAM Non Moving Warehouse | JM-NM/Stock | Virtual Locations/Production | `JM-NM/RO/` |  |  |  |
| 1060 | Repairs | `repair_operation` | Intransit warehouse - JAM | IW-JM/Stock | Virtual Locations/Production | `IW-JM/RO/` |  |  |  |
| 1070 | Repairs | `repair_operation` | Intransit warehouse - Embilipitiya | IB-EM/Stock | Virtual Locations/Production | `IB-EM/RO/` |  |  |  |
| 1079 | Repairs | `repair_operation` | Retail Counter - Waste Management | RC-WM/Stock | Virtual Locations/Production | `RC-WM/RO/` |  |  |  |
| 1096 | Repairs | `repair_operation` | Tender warehouse - Head Office | TD-HO/Stock | PW-JM/Stock | `TD-HO/RO/` |  |  |  |
| 209 | Movement Journals - IN | `incoming` | Raw Material Main Warehouse - RP-EK | Virtual Locations/MJ |  | `RP-EK/MJ/IN/` | Y |  | Y |

## Section 3: Repair Stock Locations

Total records: 29. Locations flagged with one or more Studio repair-related boolean fields.

| `id` | `complete_name` | `usage` | `company` | `repair_factory` | `repair_return` | `temp` | `finished_good` | `return_receipt` | `return_seq` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 149 | BR-AM/Stock | `internal` | Jinasena (Pvt) Ltd. |  | Y |  |  |  |  |
| 158 | BR-AN/Stock | `internal` | Jinasena (Pvt) Ltd. |  | Y |  |  |  |  |
| 353 | BR-EK/Stock | `internal` | Jinasena (Pvt) Ltd. |  | Y |  |  |  |  |
| 527 | BR-EK/Stock | `internal` | Jinasena Agricultural Machinery (Pvt) Ltd. |  | Y |  |  |  |  |
| 657 | BR-EK/Stock | `internal` | JLTD |  | Y |  |  |  |  |
| 647 | CW-CM/FinishGood | `internal` | JLTD |  |  |  | Y |  |  |
| 485 | MW-EK/FinishGood | `internal` | Jinasena (Pvt) Ltd. |  |  |  | Y |  |  |
| 625 | MW-EK/FinishGood | `internal` | JLTD |  |  |  | Y |  |  |
| 460 | MW-JC/FinishGood | `internal` | Jinasena (Pvt) Ltd. |  |  |  | Y |  |  |
| 223 | MW-JC/Stock | `internal` | Jinasena (Pvt) Ltd. |  |  |  | Y |  |  |
| 626 | PL-EK/FinishGood | `internal` | JLTD |  |  |  | Y |  |  |
| 759 | PL-EK/Stock | `internal` | Jinasena (Pvt) Ltd. |  |  |  | Y |  |  |
| 132 | PW-E1/Stock | `internal` | Jinasena (Pvt) Ltd. |  |  |  | Y |  |  |
| 538 | PW-E1/Stock | `internal` | JLTD |  |  |  | Y |  |  |
| 666 | PW-JM/Transit | `internal` | Jinasena Agricultural Machinery (Pvt) Ltd. |  |  | Y |  |  |  |
| 751 | PW-MA/Stock | `internal` | Jinasena (Pvt) Ltd. |  |  |  | Y |  |  |
| 167 | RC-TM/Stock | `internal` | Jinasena (Pvt) Ltd. |  | Y |  |  |  |  |
| 334 | RP-CM/Stock | `internal` | Jinasena (Pvt) Ltd. | Y |  |  |  |  |  |
| 649 | RP-CM/Stock | `internal` | JLTD | Y |  |  |  |  |  |
| 480 | RP-EK/FinishGood | `internal` | Jinasena (Pvt) Ltd. |  |  |  | Y |  |  |
| 627 | RP-EK/FinishGood | `internal` | JLTD |  |  |  | Y |  |  |
| 519 | RP-JM/Stock | `internal` | Jinasena Agricultural Machinery (Pvt) Ltd. | Y | Y |  |  |  |  |
| 361 | RP-QU/Stock | `internal` | Jinasena (Pvt) Ltd. |  | Y |  |  |  |  |
| 644 | Temp | `view` | JLTD |  |  | Y |  |  |  |
| 766 | Temp | `view` | Jinasena (Pvt) Ltd. |  |  | Y |  |  |  |
| 255 | Virtual Locations/Repair/Colombo | `inventory` | Jinasena (Pvt) Ltd. |  |  |  |  |  |  |
| 389 | Virtual Locations/Repair/Ekala | `inventory` | Jinasena (Pvt) Ltd. |  |  |  |  |  |  |
| 667 | Virtual Locations/Repair/Ekala | `inventory` | Jinasena Agricultural Machinery (Pvt) Ltd. |  |  |  |  |  |  |
| 415 | Virtual Locations/Repair/RP-QU | `inventory` | Jinasena (Pvt) Ltd. |  |  |  |  |  |  |

## Section 4: SLA Policies

No SLA policies are defined in this system.

```json
{
  "sla_policies": [],
  "sla_status_sample": []
}
```

## Section 5: System Configuration Settings

> Note: get_values blocked by XML-RPC serialization of mail.alias.domain; using alternatives

### Relevant Installed Modules

| `id` | `name` | `state` | `summary` |
| --- | --- | --- | --- |
| 206 | `helpdesk` | installed | Track, prioritize, and solve customer tickets |
| 558 | `industry_fsm` | installed | Schedule and track onsite operations, time and material |
| 100 | `repair` | installed | Repair damaged products |
| 400 | `helpdesk_sale` | installed | Project, Tasks, After Sales |
| 422 | `helpdesk_timesheet` | installed | Project, Tasks, Timesheet |

### `res.config.settings` Model Fields

| `id` | `name` | `field_description` | `ttype` |
| --- | --- | --- | --- |
| 42944 | `google_translate_api_key` | Message Translation API Key | `char` |
| 10290 | `group_industry_fsm_quotations` | Extra Quotations | `boolean` |
| 4595 | `group_project_rating` | Customer Ratings | `boolean` |
| 63293 | `group_timesheet_leaderboard_show_rates` | Billing Rate Target | `boolean` |
| 63295 | `group_use_timesheet_leaderboard` | Billing Rate Leaderboard | `boolean` |
| 10277 | `invoiced_timesheet` | Timesheets Invoicing | `selection` |
| 13511 | `leave_timesheet_task_id` | Time Off Task | `many2one` |
| 4593 | `module_hr_timesheet` | Task Logs | `boolean` |
| 9331 | `module_industry_fsm_report` | Worksheets | `boolean` |
| 9332 | `module_industry_fsm_sale` | Time and Material Invoicing | `boolean` |
| 7666 | `module_project_timesheet_holidays` | Time Off | `boolean` |
| 52495 | `timesheet_encode_method` | Encoding Method | `selection` |
| 7669 | `timesheet_min_duration` | Minimal Duration | `integer` |
| 7670 | `timesheet_rounding` | Round up | `integer` |

### `ir.config_parameter` Records

_(none returned — access restricted via XML-RPC)_

## Section 6: Repair Service Products

Total records: 13. All are `service` type products in category `SV-LB-60`.

| `id` | `name` | `type` | `list_price` | `standard_price` | `categ` | `uom` | `invoice_policy` | `sale_ok` | `purchase_ok` | `x_studio_charge_type` | `x_studio_non_billable` | `x_studio_item_approved` | `x_studio_sub_contract` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 332939 | BAKING STATOR QUICK REPAIR | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332973 | CUTTER DRUM CORE REPAIRE | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332974 | ELECTRICAL PROBLEM REPAIR WORK | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332950 | LABOUR FREE | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332964 | LABOUR FREE | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332951 | LABOUR FREE | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332935 | LABOUR FREE | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332936 | LABOUR FREE | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332971 | PREASSURE PAD REPAIR | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332972 | REDUCTION SHAFT & BEARING REPAIR | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332954 | RUBBER ROLLING MACHINE REPAIR CHARGES | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332965 | SERVICE CHARGE | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |
| 332967 | TRANSPORTATION CHARGES FOR TCM REPAIR | `service` | 1.0 | 0.0 | SV-LB-60 | pcs | `delivery` | True | True |  | False | False | False |

## Section 7: Journals & Journal Types

### `account.journal` Records

| `id` | `name` | `code` | `type` | `company` | `default_account` | `active` |
| --- | --- | --- | --- | --- | --- | --- |
| 55 | Advance Payment - Repairs | `ADVP2` | `general` | Jinasena Agricultural Machinery (Pvt) Ltd. |  | True |
| 137 | Advance Receipt - Repairs | `ADVRR` | `general` | Jinasena Agricultural Machinery (Pvt) Ltd. | 12090350 CASH IN HAND (4371) | True |
| 150 | Customer Invoices - Repairs | `INVRE` | `sale` | Jinasena Agricultural Machinery (Pvt) Ltd. | 41010010 SALES (4406) | True |
| 35 | Fixed Asset Journal | `FXAJR` | `general` | Jinasena Agricultural Machinery (Pvt) Ltd. |  | True |
| 163 | Stock Journal | `INV` | `general` | Jinasena (Pvt) Ltd. |  | True |
| 48 | Miscellanious Journal | `MISC` | `general` | Jinasena Agricultural Machinery (Pvt) Ltd. |  | True |
| 47 | TAX JOURNAL | `TAXJ` | `general` | Jinasena Agricultural Machinery (Pvt) Ltd. |  | True |

### `x_journal_types` Records (Studio Custom Model)

| `id` | `x_name` | `x_studio_sequence` | `x_studio_company_id` |
| --- | --- | --- | --- |
| 1 | `Inv_Cnt_MJ` | 10 | Jinasena (Pvt) Ltd. |
| 2 | `Inv_GENPR0` | 10 | Jinasena (Pvt) Ltd. |
| 3 | `Inv_GENREP` | 10 | Jinasena (Pvt) Ltd. |
| 4 | `Inv_Mov` | 10 | Jinasena (Pvt) Ltd. |
| 5 | `MJ_FSE` | 10 | Jinasena (Pvt) Ltd. |
| 6 | `Inv_Mov` | 10 | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 7 | `MJ_CS` | 10 | Jinasena Agricultural Machinery (Pvt) Ltd. |

## Section 8: Repair GL Accounts (x_repair_accounts)

Total records: 2.

### Repair Accounts - JLD

- **`x_name`:** Repair Accounts - JLD
- **`x_studio_company_id`:** Jinasena (Pvt) Ltd.
- **`x_studio_rug_account`:** id=1361, name=`RG006 R.U.G. - REPAIRS`, code=`RG006`, account_type=`expense`, company=Jinasena (Pvt) Ltd.
- **`x_studio_sequence`:** 10
- **`x_active`:** True
- **`create_date`:** 2023-05-04 01:15:26
- **`write_date`:** 2024-09-12 01:03:18

### Repair Accounts - JAM

- **`x_name`:** Repair Accounts - JAM
- **`x_studio_company_id`:** Jinasena Agricultural Machinery (Pvt) Ltd.
- **`x_studio_rug_account`:** _(not set)_
- **`x_studio_sequence`:** 10
- **`x_active`:** True
- **`create_date`:** 2024-09-12 01:04:50
- **`write_date`:** 2024-09-12 01:04:50

## Section 9: Sample Repair Ticket Records

Five anonymized `helpdesk.ticket` records showing field usage patterns.

### Ticket 1: REPAIR/2026/00015 (id=899)

- **`id`:** 899
- **`ticket_ref`:** 19
- **`name`:** REPAIR/2026/00015
- **`stage_id`:** New (id=20)
- **`team_id`:** Customer Care - Repair
- **`ticket_type_id`:** Repair - Under Warranty - RUG
- **`x_studio_job_location`:** (not set)
- **`x_studio_tracking`:** (not set)
- **`x_studio_normal_repair_with_serial_no`:** False
- **`x_studio_normal_repair_without_serial_no`:** False
- **`x_studio_rug_repair`:** True
- **`x_studio_rug_approval_status`:** Pending RUG Approval
- **`x_studio_material_availability`:** Material Not Ready
- **`x_studio_cancel_status`:** None
- **`x_studio_reopen_status`:** None
- **`x_studio_repair_started_stage_updated`:** False
- **`x_studio_repair_complete_stage_updated`:** False
- **`x_studio_invoice_stage_updated`:** False
- **`x_studio_handed_over`:** False
- **`create_date`:** 2026-05-08 09:50:16
- **`write_date`:** 2026-05-08 09:51:53

### Ticket 2: REPAIR/2026/00014 (id=898)

- **`id`:** 898
- **`ticket_ref`:** 18
- **`name`:** REPAIR/2026/00014
- **`stage_id`:** Received at Factory (id=25)
- **`team_id`:** Customer Care - Repair
- **`ticket_type_id`:** Repair - Under Warranty - RUG
- **`x_studio_job_location`:** Factory Repair
- **`x_studio_tracking`:** (not set)
- **`x_studio_normal_repair_with_serial_no`:** False
- **`x_studio_normal_repair_without_serial_no`:** False
- **`x_studio_rug_repair`:** True
- **`x_studio_rug_approval_status`:** Pending RUG Approval
- **`x_studio_material_availability`:** Material Not Ready
- **`x_studio_cancel_status`:** None
- **`x_studio_reopen_status`:** None
- **`x_studio_repair_started_stage_updated`:** False
- **`x_studio_repair_complete_stage_updated`:** False
- **`x_studio_invoice_stage_updated`:** False
- **`x_studio_handed_over`:** False
- **`create_date`:** 2026-05-08 04:46:54
- **`write_date`:** 2026-05-08 05:34:39

### Ticket 3: REPAIR/2026/00012 (id=896)

- **`id`:** 896
- **`ticket_ref`:** 16
- **`name`:** REPAIR/2026/00012
- **`stage_id`:** New (id=20)
- **`team_id`:** Customer Care - Repair
- **`ticket_type_id`:** Repair - Under Warranty - RUG
- **`x_studio_job_location`:** Factory Repair
- **`x_studio_tracking`:** (not set)
- **`x_studio_normal_repair_with_serial_no`:** False
- **`x_studio_normal_repair_without_serial_no`:** False
- **`x_studio_rug_repair`:** True
- **`x_studio_rug_approval_status`:** Pending RUG Approval
- **`x_studio_material_availability`:** Material Not Ready
- **`x_studio_cancel_status`:** None
- **`x_studio_reopen_status`:** None
- **`x_studio_repair_started_stage_updated`:** False
- **`x_studio_repair_complete_stage_updated`:** False
- **`x_studio_invoice_stage_updated`:** False
- **`x_studio_handed_over`:** False
- **`create_date`:** 2026-05-07 06:16:28
- **`write_date`:** 2026-05-08 09:52:48

### Ticket 4: REPAIR/2026/00010 (id=894)

- **`id`:** 894
- **`ticket_ref`:** 14
- **`name`:** REPAIR/2026/00010
- **`stage_id`:** Sent to Factory (id=24)
- **`team_id`:** Customer Care - Repair
- **`ticket_type_id`:** Repair - Under Warranty - RUG
- **`x_studio_job_location`:** Factory Repair
- **`x_studio_tracking`:** (not set)
- **`x_studio_normal_repair_with_serial_no`:** False
- **`x_studio_normal_repair_without_serial_no`:** False
- **`x_studio_rug_repair`:** True
- **`x_studio_rug_approval_status`:** Pending RUG Approval
- **`x_studio_material_availability`:** Material Not Ready
- **`x_studio_cancel_status`:** None
- **`x_studio_reopen_status`:** None
- **`x_studio_repair_started_stage_updated`:** False
- **`x_studio_repair_complete_stage_updated`:** False
- **`x_studio_invoice_stage_updated`:** False
- **`x_studio_handed_over`:** False
- **`create_date`:** 2026-05-07 03:03:45
- **`write_date`:** 2026-05-07 03:08:56

### Ticket 5: REPAIR/2026/00009 (id=893)

- **`id`:** 893
- **`ticket_ref`:** 13
- **`name`:** REPAIR/2026/00009
- **`stage_id`:** Received at Factory (id=25)
- **`team_id`:** Customer Care - Repair
- **`ticket_type_id`:** Repair - Under Warranty - RUG
- **`x_studio_job_location`:** Centre Repair
- **`x_studio_tracking`:** serial
- **`x_studio_normal_repair_with_serial_no`:** False
- **`x_studio_normal_repair_without_serial_no`:** False
- **`x_studio_rug_repair`:** True
- **`x_studio_rug_approval_status`:** Pending RUG Approval
- **`x_studio_material_availability`:** Material Not Ready
- **`x_studio_cancel_status`:** None
- **`x_studio_reopen_status`:** None
- **`x_studio_repair_started_stage_updated`:** False
- **`x_studio_repair_complete_stage_updated`:** False
- **`x_studio_invoice_stage_updated`:** False
- **`x_studio_handed_over`:** False
- **`create_date`:** 2026-05-06 08:27:12
- **`write_date`:** 2026-05-08 09:53:13

## Section 10: Record Rules (ir.rule)

Total records: 29.

| `name` | `model` | `global` | `groups` | `perm_read` | `perm_write` | `perm_create` | `perm_unlink` | `active` | `domain_force` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Location multi-company | Inventory Locations | True |  | True | True | True | True | True | `[('company_id', 'in', company_ids + [False])]` |
| Stock data restrict Location | Inventory Locations | False | Inventory / Administrator | True | True | True | True | True | `[(1,'=',1)]` |
| Stock data admin location | Inventory Locations | False | Inventory / Administrator | True | True | True | True | True | `[(1, '=', 1),]` |
| stock_picking multi-company | Transfer | True |  | True | True | True | True | True | `[('company_id', 'in', company_ids)]` |
| Portal Follower Transfers | Transfer | False | User types / Portal | True | True | True | True | True | `['&#124;', '&#124;', ('message_partner_ids', 'in', [user.partner_id.id]), ('partner_id', '=', user.partner_id.id), ('sale_id.partner_id', '=', user.partner_id.id)]` |
| Kap-Operation Control | Transfer | False |  | True | True | True | True | True | `['&', (1, '=', 1), '&#124;', '&#124;', '&#124;', '&', ('x_studio_sequence_code', '=', 'INT'), ('origin', '=', False), '&', ('x_studio_sequence_code', '=', 'MJ/OUT'), ('origin', '=', False), '&', ('x_studio_sequence_code', '=', 'MJ/IN'), ('origin', '=', False), '&', ('x_studio_sequence_code', '!=', 'INT'), ('origin', '!=', False)]` |
| Transfer Type Block | Transfer | False |  | True | True | True | True | True | `['&', '!', (0, '=', 1), ('x_studio_type_of_operation', '=', 'internal')]` |
| Block Operations | Transfer | False |  | True | True | True | True | True | `[('x_studio_type_of_operation', '=', 'internal')]` |
| Test | Transfer | False |  | True | True | True | True | True | `` |
| Block Receipt Operations | Transfer | False |  | True | True | False | False | True | `[('picking_type_id.code', '=', 'internal')]` |
| Kap- | Transfer | False |  | True | True | False | False | True | `[('user_id', '=', user.id)]` |
| Kap-Operation Control 2 | Transfer | False |  | True | True | True | True | True | `['&', (1, '=', 1), '&#124;', '&#124;', '&#124;', '&', ('x_studio_sequence_code', '=', 'INT'), ('origin', '=', False), '&', ('x_studio_sequence_code', '=', 'MJ/OUT'), ('origin', '=', False), '&', ('x_studio_sequence_code', '=', 'MJ/IN'), ('origin', '=', False), '&', ('x_studio_sequence_code', '!=', 'INT'), ('origin', '!=', False)]` |
| Stock data admin | Transfer | False | Inventory / Administrator | True | True | True | True | True | `[(1,'=',1)]` |
| Stock data picking | Transfer | False | Technical / Restrict Stock Warehouse Operations/Location | True | True | True | True | True | `[('picking_type_id', 'in', user.operation_ids.ids),]` |
| Stock data picking location | Transfer | False | Technical / Restrict Stock Warehouse Operations/Location | True | True | True | True | True | `[('location_dest_id', 'in', user.location_ids.ids)]` |
| Stock data warehouse | Transfer | False | Inventory / Administrator | True | True | True | True | True | `[(1,'=',1)]` |
| Stock data warehouse | Transfer | False | Technical / Restrict Stock Warehouse Operations/Location | True | True | True | True | True | `[('picking_type_id.warehouse_id', 'in', user.warehouse_ids.ids)]` |
| Project/Task: multi-company | Task | True |  | True | True | True | True | True | `[('company_id', 'in', company_ids + [False])]` |
| Project/Task: employees: follow required for follower-only projects | Task | False | User types / Internal User | True | True | True | True | True | `[             '&#124;',                 '&',                     ('project_id', '!=', False),                     '&#124;',                         ('project_id.privacy_visibility', '!=', 'followers'),                         ('project_id.message_partner_ids', 'in', [user.partner_id.id]),                 '&#124;',                     ('message_partner_ids', 'in', [user.partner_id.id]),                     # to subscribe check access to the record, follower is not enough at creation                     ('user_ids', 'in', user.id)         ]` |
| Project/Task: project manager: see all tasks linked to a project or its own tasks | Task | False | Project / Administrator | True | True | True | True | True | `[             '&#124;', ('project_id', '!=', False),                  ('user_ids', 'in', user.id),         ]` |
| Project/Task: portal users: (portal and following project) or (portal and following task) | Task | False | User types / Portal | True | False | False | False | True | `[         ('project_id.privacy_visibility', '=', 'portal'),         ('active', '=', True),         '&#124;',             ('project_id.message_partner_ids', 'child_of', [user.partner_id.commercial_partner_id.id]),             ('message_partner_ids', 'child_of', [user.partner_id.commercial_partner_id.id]),         ]` |
| Project: See private tasks | Task | False | Project / User | True | True | True | True | True | `[             ('project_id.privacy_visibility', '!=', 'followers'),             '&#124;', '&#124;', ('project_id', '!=', False),                       ('parent_id', '!=', False),                  ('user_ids', 'in', user.id),         ]` |
| Project/Task: employees: Full access to own private task only | Task | False | User types / Internal User | True | True | True | True | True | `[('project_id', '=', False), ('user_ids', 'in', user.id), ('parent_id', '=', False)]` |
| Project/Task: project users: follow required for follower-only projects | Task | False | Project / User | False | True | True | True | True | `[             '&#124;',                 '&',                     ('project_id', '!=', False),                     '&#124;',                         ('project_id.privacy_visibility', '!=', 'followers'),                         ('project_id.message_partner_ids', 'in', [user.partner_id.id]),                 '&#124;',                     ('message_partner_ids', 'in', [user.partner_id.id]),                     # to subscribe check access to the record, follower is not enough at creation                     ('user_ids', 'in', user.id)         ]` |
| repair order multi-company | Repair Order | True |  | True | True | True | True | True | `[('company_id', 'in', company_ids)]` |
| Helpdesk Ticket Administrator | Helpdesk Ticket | False | Helpdesk / Administrator | True | True | True | True | True | `[(1,'=',1)]` |
| Helpdesk Ticket User | Helpdesk Ticket | False | User types / Internal User, Helpdesk / Jin - Repair - Full Rights, Helpdesk / Jin - Repair - Minimum Rights, Helpdesk / Jin - Repair - Ticket Creater, Helpdesk / User | True | True | True | True | True | `['&#124;',                                         '&#124;',                                             ('team_id.privacy_visibility', '!=', 'invited_internal'),                                             ('team_id.message_partner_ids', 'in', [user.partner_id.id]),                                             ('message_partner_ids', 'in', [user.partner_id.id]),                                         ]` |
| Ticket: multi-company | Helpdesk Ticket | True |  | True | True | True | True | True | `[('company_id', 'in', company_ids + [False])]` |
| Tickets: portal users: portal or following | Helpdesk Ticket | False | User types / Portal | True | True | True | True | True | `[                 '&#124;',                     ('message_partner_ids', 'child_of', [user.partner_id.commercial_partner_id.id]),                     ('message_partner_ids', 'in', [user.partner_id.id])             ]` |

## Section 11: Email Templates

Total records: 13. All templates are on model `helpdesk.ticket`.

### Template: RR- Customer Repair Letter - Test

| Field | Value |
| --- | --- |
| `id` | 60 |
| `name` | RR- Customer Repair Letter - Test |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `(not set)` |
| `email_from` | `(not set)` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

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

</details>

### Template: RR- Customer Repair Letter - Test2

| Field | Value |
| --- | --- |
| `id` | 63 |
| `name` | RR- Customer Repair Letter - Test2 |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `(not set)` |
| `email_from` | `(not set)` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer :<t t-out="object.partner_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

</details>

### Template: RR- Customer Repair Letter - Test3

| Field | Value |
| --- | --- |
| `id` | 64 |
| `name` | RR- Customer Repair Letter - Test3 |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `(not set)` |
| `email_from` | `(not set)` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer :<t t-out="object.partner_id.display_name" style="box-sizing:border-box;"> </t> Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

</details>

### Template: RR- Customer Repair Letter - Test4

| Field | Value |
| --- | --- |
| `id` | 71 |
| `name` | RR- Customer Repair Letter - Test4 |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `(not set)` |
| `email_from` | `(not set)` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer :<t t-out="object.fsm_task_count.sale_order_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true"> </t> Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here</p><p style="box-sizing:border-box;margin-bottom: 0px;">Write Your Wording Here
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

</details>

### Template: Repair - Customer Letter

| Field | Value |
| --- | --- |
| `id` | 56 |
| `name` | Repair - Customer Letter |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ object._rating_get_operator().email_formatted }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

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

</details>

### Template: Repair - Customer Letter - 2

| Field | Value |
| --- | --- |
| `id` | 59 |
| `name` | Repair - Customer Letter - 2 |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ object._rating_get_operator().email_formatted }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

```html
<div>
    <t t-set="access_token" t-value="object._rating_get_access_token()">

<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Dear&nbsp;</span>Madam/Sir<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">,</span><br><br><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Your request&nbsp;</span>&nbsp;<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">has been received and is being reviewed by our&nbsp;</span>Table legs are unbalanced<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">&nbsp;team. The reference of your ticket is&nbsp;</span>15<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">.</span><br><a style="text-decoration:none;box-sizing:border-box;background-color:transparent;color:inherit;">View the ticket</a><br><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">To add additional comments, reply to this email.</span><br><br><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Thank you,</span><br><br>Helpdesk<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">&nbsp;Team.</span>

<br></t><t t-set="access_token" t-value="object._rating_get_access_token()"></t><t t-set="partner" t-value="object._rating_get_partner()"></t><t t-set="access_token" t-value="object._rating_get_access_token()"></t><t t-set="access_token" t-value="object._rating_get_access_token()"></t></div>
```

</details>

### Template: Repair - Final Notice

| Field | Value |
| --- | --- |
| `id` | 66 |
| `name` | Repair - Final Notice |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ object._rating_get_operator().email_formatted }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

```html
<p style="margin:0px 0 12px 0;box-sizing:border-box;">

<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Customer Name : <t t-out="object.partner_id.display_name" style="box-sizing:border-box;"> </t></span></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff"></span><span style="color: #000000;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">REPAIRS TO&nbsp; <t t-out="object.product_id.display_name" style="box-sizing:border-box;"> </t> PUMP - FINAL NOTICE</span><br><br>Dear Sir/Madam ,<br><span style="font-size: 13px">We refer to the <span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">"CENTRIC"</span>

type&nbsp;</span>pumping unit No&nbsp;<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff"><t t-out="object.product_id.display_name" style="box-sizing:border-box;"> </t></span>

&nbsp;repaired on the above references and job number. We note that you have not responded to our email dated&nbsp; <t t-out="object.x_studio_created_on_8" style="box-sizing:border-box;"> </t> and requesting you to collect same.<br><br><br>Since we are unable to store this pumping unit any longer, we must finally request you to make payment of Rs. <t t-out="object.x_studio_balance_due" style="box-sizing:border-box;"> </t><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">&nbsp;</span>in cash and remove same from our workshop within 2 weeks of this letter. (PLEASE NOTE THAT A STORAGGE CHARGE OF RS 15/- PER DAY WILL BE LEVIED FROM <t t-out="object.x_studio_created_on_8" style="box-sizing:border-box;"> </t> IN ADDITION TO THE REPAIR CHARGE. )<br><br>When calling to make final payment and collecting the pump our reservation deposit receipt number <t t-out="object.name" style="box-sizing:border-box;"> </t> &nbsp; OR BOTH OF THESE RECEIPTS ARE LOST, OR CANNOT BE SURRENDERED AN AFFIDAVIT MUST BE SUBMITTED. )<br><br><br>If the pump is to be handed over to a representative, please send through him a letter authorizing us to hand over the pump to him/her. His/her specimen signature and national identity card number should be certified by you.<br><br>If the pump is not collected within 2 weeks of this letter, it will be considered to be abandoned and will be destroyed.<br>Yours faithfully,<br><span style="font-size: 13px"><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br>Jinasena Ltd</strong></span><br><br><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br><br><br>Repairs Department</strong>

<br></p>
```

</details>

### Template: Repair - Final Notice - Estimated

| Field | Value |
| --- | --- |
| `id` | 67 |
| `name` | Repair - Final Notice - Estimated |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ object._rating_get_operator().email_formatted }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

```html
<p style="margin:0px 0 12px 0;box-sizing:border-box;">

<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Customer Name : <t t-out="object.partner_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t></span></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff"></span><span style="color: #000000;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">CENTRIC PUMPS HANDED IN FOR REPAIRS - FINAL NOTICE</span><br><br>Dear Sir/Madam ,</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><br>We refer to the "CENTRIC" type <t t-out="object.product_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> given to us for repairs and our quotation dated <t t-out="object.x_studio_sale_order.create_date" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> .It is noted with regret that you have not responded to this quotation to date. We now wish to inform you that this quotation is no longer valid and e are not in a position to store this pump in our stores.<br></p><p style="margin:0px 0 12px 0;box-sizing:border-box;">Due to limited space we have, we must make an urgent request to you, to make necessary arrangements to collect same within 10 days of this e-mail, in which event, we shall not be responsible for this item after the stipulated time period.</p><p style="margin:0px 0 12px 0;box-sizing:border-box;">When calling to collect same, please ensure to produce the repair receipt issued to you at the time the pump was handed over to us.&nbsp;&nbsp;<br><br><br><br>Yours faithfully,<br><span style="font-size: 13px"><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br>Jinasena Ltd</strong></span><br><br><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br><br><br>Repairs Department</strong>

<br></p>
```

</details>

### Template: Repair - Final Notice - Scrappage

| Field | Value |
| --- | --- |
| `id` | 69 |
| `name` | Repair - Final Notice - Scrappage |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ object._rating_get_operator().email_formatted }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

```html
<p style="box-sizing:border-box;margin-bottom: 0px;">Customer Name :<t t-out="object.partner_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> </p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;">NOTICE OF SCRAPPAGE</p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">Dear Sir/Madam ,
</p><p style="box-sizing:border-box;margin-bottom: 0px;">  
</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">We refer to the "CENTRIC" type <t t-out="object.product_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> &nbsp;water pump handed over to us on <t t-out="object.x_studio_created_on_1" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> under the reference number <t t-out="object.name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> and regret to note that in spite of ready for collection notices sent to you on <t t-out="object.create_date" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> &amp; XXXX &amp; XXXX, you have failed to respond positively.</p><p style="box-sizing:border-box;margin-bottom: 0px;"><br>

</p><p style="box-sizing:border-box;margin-bottom: 0px;"><span style="color: #000000;font-size: 13px;font-style: normal;font-weight: 400;background-color: rgba(1, 126, 132, 0.1)"><br></span><span style="box-sizing:border-box;background-color:#f6f6f6;color: #000000; font-size: 13px; font-style: normal; font-weight: 400;" class="bg-o-color-3">We regret to note that continue to ignore our notices and can only assume that you are no longer interested in this pump and accordingly we have scrapped this item.<br><br><br>Therefore, please be informed that we are no longer responsible for this item.</span>

<br></p><p style="box-sizing:border-box;margin-bottom: 0px;"><font class="bg-o-color-3" style="box-sizing:border-box;background-color:#f6f6f6;color:#091124;">​</font></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="box-sizing:border-box;margin-bottom: 0px;">Yours faithfully,

</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"></p><p style="box-sizing:border-box;margin-bottom: 0px;"><br></p><p style="caret-color:#37352f;position:relative;margin:0px 0 12px 0;box-sizing:border-box;"></p>
```

</details>

### Template: Repair - Reminding Letter

| Field | Value |
| --- | --- |
| `id` | 70 |
| `name` | Repair - Reminding Letter |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ object._rating_get_operator().email_formatted }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

```html
<p style="margin:0px 0 12px 0;box-sizing:border-box;">

<span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">Customer Name : <t t-out="object.partner_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t></span></p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">REMINDER</span><br><br>Dear Sir/Madam ,<br><span style="font-size: 13px">We refer to the <span style="color: #444b5a;font-size: 13px;font-style: normal;font-weight: 400;background-color: #ffffff">"CENTRIC"</span>

type <t t-out="object.product_id.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable="">&nbsp;</t></span>&nbsp;pumping unit No <t t-out="object.x_studio_serial_no.display_name" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t> repaired on the above references and job number. We note that you have not responded to our letter dated <t t-out="object.create_date" style="box-sizing:border-box;" contenteditable="false" data-oe-t-inline="true" oe-keep-contenteditable=""> </t>   and requesting you to collect same.<br><br><br>Due to limited sapce for holding " Awaiting collection pumps " in colombo and therefore we must take an urgent request to you to make necessary arrangements to collect same from our repair department at Colombo.</p><p style="margin:0px 0 12px 0;box-sizing:border-box;"><br>When calling to collect please ensure that you have all necessary documents including the repair receipt issued to you at the time the pump was handed over to us.<br><br><br>In the event that the pump is not collected within 10 days of this letter we will be transferring this pump to our warehouse in Ekala and the pump can only be collected by you from our warehouse after making payment (if any) at our colombo office.</p><p style="margin:0px 0 12px 0;box-sizing:border-box;">To avoid the resultant inconvinience to you, plea ensure you pay close attention to this communication.<br><br></p><p style="margin:0px 0 12px 0;box-sizing:border-box;">Yours faithfully,<br><span style="font-size: 13px"><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br>Jinasena Ltd</strong></span><br><br><strong style="box-sizing:border-box;font-weight: bolder"><br><br><br><br><br>Repairs Department</strong>

<br></p>
```

</details>

### Template: Ticket: Rating Request (requires rating enabled on team)

| Field | Value |
| --- | --- |
| `id` | 41 |
| `name` | Ticket: Rating Request (requires rating enabled on team) |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.company_id.name or object.user_id.company_id.name or 'Helpdesk' }}: Service Rating Request` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ object._rating_get_operator().email_formatted }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

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

</details>

### Template: Ticket: Reception Acknowledgment

| Field | Value |
| --- | --- |
| `id` | 39 |
| `name` | Ticket: Reception Acknowledgment |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ (object.user_id.email_formatted or user.email_formatted) }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

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

</details>

### Template: Ticket: Solved

| Field | Value |
| --- | --- |
| `id` | 40 |
| `name` | Ticket: Solved |
| `model` | `helpdesk.ticket` |
| `subject` | `{{ object.display_name }}` |
| `email_to` | `{{ (object.partner_email if not object.sudo().partner_id.email or object.sudo().partner_id.email != object.partner_email else '') }}` |
| `email_from` | `{{ (object.user_id.email_formatted or user.email_formatted) }}` |
| `reply_to` | `(not set)` |

<details>
<summary>Template HTML</summary>

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

</details>

## Section 12: Stage → Email Template Mapping

Total records: 28. Maps `helpdesk.stage` to the email template triggered on stage transition.

| `id` | `name` | `sequence` | `fold` | `template_id` | `x_studio_company_id` |
| --- | --- | --- | --- | --- | --- |
| 1 | New | 0 | False | Ticket: Reception Acknowledgment (id=39) | Jinasena (Pvt) Ltd. |
| 20 | New | 0 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 33 | New | 0 | False | Ticket: Reception Acknowledgment (id=39) | JLTD |
| 5 | Sent to Factory | 1 | False | _(none)_ | Jinasena (Pvt) Ltd. |
| 24 | Sent to Factory | 1 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 35 | On Hold | 2 | False | _(none)_ | _(all companies)_ |
| 6 | Received at Factory | 2 | False | _(none)_ | Jinasena (Pvt) Ltd. |
| 25 | Received at Factory | 2 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 2 | Diagnosis | 3 | False | _(none)_ | Jinasena (Pvt) Ltd. |
| 21 | Diagnosis | 3 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 10 | Estimation Sent to Customer | 4 | False | _(none)_ | Jinasena (Pvt) Ltd. |
| 29 | Estimation Sent to Customer | 4 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 12 | Estimation Approval Received | 5 | False | _(none)_ | Jinasena (Pvt) Ltd. |
| 31 | Estimation Approval Received | 5 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 22 | Advance Received | 6 | True | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 3 | Advance Received | 6 | True | _(none)_ | Jinasena (Pvt) Ltd. |
| 30 | Repair Started | 7 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 11 | Repair Started | 7 | False | _(none)_ | Jinasena (Pvt) Ltd. |
| 9 | Repair Completed | 8 | False | _(none)_ | Jinasena (Pvt) Ltd. |
| 28 | Repair Completed | 8 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 26 | Sent to Sales Centre | 9 | False | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 7 | Sent to Sales Centre | 9 | False | _(none)_ | Jinasena (Pvt) Ltd. |
| 8 | Received at Sales Centre | 10 | True | _(none)_ | Jinasena (Pvt) Ltd. |
| 27 | Received at Sales Centre | 10 | True | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 32 | Handed Over to Customer | 11 | True | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 13 | Handed Over to Customer | 11 | True | _(none)_ | Jinasena (Pvt) Ltd. |
| 23 | Cancelled | 12 | True | _(none)_ | Jinasena Agricultural Machinery (Pvt) Ltd. |
| 4 | Cancelled | 12 | True | _(none)_ | Jinasena (Pvt) Ltd. |
