#!/bin/bash
# ============================================================
# Download third-party modules used in Clear_DB
# ============================================================
# Run this once to populate ./third_party/
# ============================================================

set -e
mkdir -p ./third_party
cd ./third_party

echo "Downloading third-party Odoo 17 modules..."

# --- OCA / GitHub free modules ---

# Stock no negative (OCA)
if [ ! -d "stock_no_negative" ]; then
    echo "Cloning stock_no_negative..."
    git clone https://github.com/OCA/stock-logistics-workflow.git --branch 17.0 --depth 1 _tmp_stock
    mv _tmp_stock/stock_no_negative ./stock_no_negative 2>/dev/null || true
    rm -rf _tmp_stock
fi

# --- Cybrosys (free on apps.odoo.com) ---
echo ""
echo "============================================"
echo "MANUAL DOWNLOAD REQUIRED:"
echo "============================================"
echo "The following modules must be downloaded manually from"
echo "https://apps.odoo.com (free, requires Odoo account):"
echo ""
echo "  1. auto_database_backup  — by Cybrosys Technologies"
echo "     https://apps.odoo.com/apps/modules/17.0/auto_database_backup/"
echo ""
echo "  2. hide_menu_user        — by Cybrosys Technologies"
echo "     https://apps.odoo.com/apps/modules/17.0/hide_menu_user/"
echo ""
echo "  3. dynamic_cheque_print_ee — by Acespritech Solutions"
echo "     https://apps.odoo.com/apps/modules/17.0/dynamic_cheque_print_ee/"
echo ""
echo "  4. bi_all_in_one_stock_backdate — by BROWSEINFO"
echo "     https://apps.odoo.com/apps/modules/17.0/bi_all_in_one_stock_backdate/"
echo ""
echo "  5. bi_warehouse_restrictions — by BROWSEINFO"
echo "     https://apps.odoo.com/apps/modules/17.0/bi_warehouse_restrictions/"
echo ""
echo "  6. bi_view_editor (BVE)  — by BROWSEINFO"
echo "     https://apps.odoo.com/apps/modules/17.0/bi_view_editor/"
echo ""
echo "  7. employee_loan_payroll_enterprise — by Probuse"
echo "     https://apps.odoo.com/apps/modules/17.0/employee_loan_payroll_enterprise/"
echo ""
echo "  8. hr_employee_loan      — by Probuse"
echo "     https://apps.odoo.com/apps/modules/17.0/hr_employee_loan/"
echo ""
echo "  9. hr_ot_sheet           — by Chandika Rathnayake (internal)"
echo " 10. payroll_imports       — by Chandika Rathnayake (internal)"
echo " 11. budget_estimate_run   — by Chandika Rathnayake (internal)"
echo ""
echo "Extract each download into ./third_party/<module_name>/"
echo "============================================"
