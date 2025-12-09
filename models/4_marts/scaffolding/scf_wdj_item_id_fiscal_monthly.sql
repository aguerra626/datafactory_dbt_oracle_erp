SELECT
*
FROM
(
SELECT
MIN("Calendar Date") "First Day of Fiscal Month",
"Fiscal Month",
"Fiscal Year",
fiscal_date_placeholder
FROM {{ ref('dim_fiscal_and_calendar_dates') }} base
GROUP BY 
"Fiscal Month",
"Fiscal Year",
fiscal_date_placeholder) base
CROSS JOIN 
(select distinct wdj_primary_item_id from {{ ref('src_wip_discrete_jobs') }} src_wdj)

ORDER BY 
wdj_primary_item_id, 
fiscal_date_placeholder