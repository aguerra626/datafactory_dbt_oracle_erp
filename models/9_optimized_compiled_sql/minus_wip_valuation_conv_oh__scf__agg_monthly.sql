 -- declare grain: One row per item per unit cost per month per year 
 {# with base_monthly as (
 select
  standard_hash(to_char(primary_item_id) || to_char(unit_cost) || "Fiscal Month" || "Fiscal Year",'MD5') as item_id_unit_cost_month_year_sk,
  standard_hash(to_char(primary_item_id) || to_char(unit_cost) || "Fiscal Year",'MD5') as item_id_unit_cost_year_sk,
  primary_item_id,
  sum(transaction_quantity) as "Base Material Monthly",
  sum(unit_qtys) as "Units Monthly",
  unit_cost as "Unit Cost",
  --class_code as "Job Class Code",
  tableau_date_format_change_to_custom_mmm_yy,
  "Fiscal Month",
  "Fiscal Year"
from {{ ref('minus_wip_valuation_conv_oh') }} base
group by
primary_item_id,
unit_cost,
--class_code,
tableau_date_format_change_to_custom_mmm_yy,
"Fiscal Month",
"Fiscal Year"
 ) #}
select 
scf."Fiscal Month",
scf."Fiscal Year",
scf."First Day of Fiscal Month",
scf.fiscal_date_placeholder tableau_date_format_change_to_custom_mmm_yy,
scf.wt_primary_item_id,
nvl(base_monthly."Base Material Monthly",0) "Base Material Monthly",
nvl(base_monthly."Units Monthly",0) "Units Monthly",
sum("Base Material Monthly") over (partition by scf.wt_primary_item_id,scf.wt_usage_rate_or_amount,scf."Fiscal Year" 
  order by scf.fiscal_date_placeholder rows between unbounded preceding and current row) as "YTD Base Material",
sum("Units Monthly") over (partition by scf.wt_primary_item_id,scf.wt_usage_rate_or_amount,scf."Fiscal Year" 
  order by scf.fiscal_date_placeholder rows between unbounded preceding and current row) as "YTD Units",
scf.wt_usage_rate_or_amount "Unit Cost"

from {{ ref('scf_wt_item_id_unit_cost_rate_fiscal_monthly') }} scf
left join 
(
   select
  standard_hash(to_char(primary_item_id) || to_char(unit_cost) || "Fiscal Month" || "Fiscal Year",'MD5') as item_id_unit_cost_month_year_sk,
  standard_hash(to_char(primary_item_id) || to_char(unit_cost) || "Fiscal Year",'MD5') as item_id_unit_cost_year_sk,
  primary_item_id,
  sum(transaction_quantity) as "Base Material Monthly",
  sum(unit_qtys) as "Units Monthly",
  unit_cost as "Unit Cost",
  --class_code as "Job Class Code",
  tableau_date_format_change_to_custom_mmm_yy,
  "Fiscal Month",
  "Fiscal Year"
from {{ ref('minus_wip_valuation_conv_oh') }} base
group by
primary_item_id,
unit_cost,
--class_code,
tableau_date_format_change_to_custom_mmm_yy,
"Fiscal Month",
"Fiscal Year"
) base_monthly
on scf.wt_primary_item_id = base_monthly.primary_item_id
and scf.wt_usage_rate_or_amount = base_monthly."Unit Cost"
and scf."Fiscal Month" = base_monthly."Fiscal Month"
