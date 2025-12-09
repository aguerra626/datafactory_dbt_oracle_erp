SELECT
    int_base.fiscal_month,
    TRUNC(SYSDATE) AS "update_at"
FROM
    {{ ref('stg_bom_cal_fiscal_30days') }}
    int_base
WHERE
    TRUNC(SYSDATE) BETWEEN TRUNC(int_base.fiscal_start_date) AND TRUNC(int_base.fiscal_end_date) 
    AND ROWNUM = 1
