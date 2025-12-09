 -- declare grain: One row per item per unit cost per year 
SELECT
  standard_hash(to_char(primary_item_id) || to_char(unit_cost) || "Fiscal Year",'MD5') as item_id_unit_cost_year_sk,
  primary_item_id,
  SUM(transaction_quantity) AS "Base Material Yearly",
  SUM(unit_qtys) AS "Units Yearly",
  unit_cost AS "Unit Cost",
  --class_code AS "Job Class Code",
  "Fiscal Year"
FROM
  {{ ref('minus_wip_valuation_conv_oh') }}
  base
GROUP BY
  primary_item_id,
  unit_cost,
  --class_code,
  "Fiscal Year"
