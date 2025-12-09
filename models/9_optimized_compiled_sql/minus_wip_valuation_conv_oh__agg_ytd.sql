 -- declare grain: One row per item per unit cost per month per year 
select
wt_primary_item_id,
"Unit Cost",
"Fiscal Month",
"Fiscal Year",
sum("Base Material Monthly") over (partition by wt_primary_item_id,"Unit Cost","Fiscal Year" 
  order by tableau_date_format_change_to_custom_mmm_yy rows between unbounded preceding and current row) as "YTD Base Material",
sum("Units Monthly") over (partition by wt_primary_item_id,"Unit Cost","Fiscal Year" 
  order by tableau_date_format_change_to_custom_mmm_yy rows between unbounded preceding and current row) as "YTD Units"
from {{ ref('minus_wip_valuation_conv_oh__agg_monthly') }}