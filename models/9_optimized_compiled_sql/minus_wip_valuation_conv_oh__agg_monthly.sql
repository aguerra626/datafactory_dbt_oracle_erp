 -- declare grain: One row per item per unit cost per month per year 
select
  standard_hash(to_char(primary_item_id) || to_char(unit_cost) || "Fiscal Month" || "Fiscal Year",'MD5') as item_id_unit_cost_month_year_sk,
  standard_hash(to_char(primary_item_id) || to_char(unit_cost) || "Fiscal Year",'MD5') as item_id_unit_cost_year_sk,
  primary_item_id,
  sum(transaction_quantity) as "Base Material Monthly",
  sum(unit_qtys) as "Units Monthly",
  unit_cost as "Unit Cost",
  class_code as "Job Class Code",
  tableau_date_format_change_to_custom_mmm_yy,
  "Fiscal Month",
  "Fiscal Year"
from {{ ref('minus_wip_valuation_conv_oh') }} base
group by
primary_item_id,
unit_cost,
class_code,
tableau_date_format_change_to_custom_mmm_yy,
"Fiscal Month",
"Fiscal Year"
