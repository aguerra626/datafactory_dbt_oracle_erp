select 
'planned build' AS feature,
base.rec_new_wip_start_date AS new_start_date,
base.rec_inventory_item_id,
sum(base.rec_new_order_quantity) AS "Qty Rate",
base.fiscal_month
from {{ ref('int_mrp_monthly_snapshot_build') }} base
group by base.rec_new_wip_start_date, base.rec_inventory_item_id, base.fiscal_month