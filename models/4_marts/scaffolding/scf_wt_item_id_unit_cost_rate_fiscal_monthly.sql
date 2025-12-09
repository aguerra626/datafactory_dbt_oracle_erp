SELECT
*
FROM
(
SELECT
MIN("Calendar Date") "First Day of Fiscal Month",
"Fiscal Month",
"Fiscal Year",
fiscal_date_placeholder
FROM {{ ref('dim_fiscal_and_calendar_dates') }} scf_base
where "Fiscal Year" = EXTRACT(YEAR from sysdate)
GROUP BY 
"Fiscal Month",
"Fiscal Year",
fiscal_date_placeholder) scf_base
CROSS JOIN 
(select distinct wt_primary_item_id, wt_usage_rate_or_amount from {{ ref('int_scf_wip_valuation_conv_oh') }} int_base)