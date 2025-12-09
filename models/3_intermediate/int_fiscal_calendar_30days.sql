SELECT 
int_base.*,
standard_hash(int_base.bcal_calendar_date || int_base.fiscal_month,'MD5') AS sk_fiscal_calendar
FROM
{{ ref('stg_bom_cal_fiscal_30days') }} int_base