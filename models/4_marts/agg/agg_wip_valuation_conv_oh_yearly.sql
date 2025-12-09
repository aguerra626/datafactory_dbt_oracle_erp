SELECT
we_primary_item_id,
wdj_class_code,
round(sum(wt_transaction_quantity),2) as "Base Material Per Year",
sum(unit_qtys) as "Units Per Year",
wt_usage_rate_or_amount as "Unit Cost",
"Fiscal Year"
FROM {{ ref('wip_valuation_conv_oh') }} base

GROUP BY 
we_primary_item_id,
wdj_class_code,
wt_usage_rate_or_amount,
"Fiscal Year"