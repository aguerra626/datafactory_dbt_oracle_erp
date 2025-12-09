SELECT
    actuals.*,
    fiscal.fiscal_month as "Fiscal Month",
    fiscal.fiscal_year as "Fiscal Year",
    fiscal.fiscal_week as "Fiscal Week"
FROM
    {{ ref('actuals_build_delivery') }}
    actuals
    JOIN {{ ref('stg_bom_cal_fiscal_30days') }}
    fiscal
    ON fiscal.bcal_calendar_date = actuals."Completed Date"
