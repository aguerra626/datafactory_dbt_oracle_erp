select 
'planned delivery' AS feature,
base.rec_new_schedule_date AS new_due_date,
base.rec_inventory_item_id,
sum(base.rec_new_order_quantity) AS "Qty Rate",
base.fiscal_month
from {{ ref('int_mrp_monthly_snapshot_delivery') }} base
group by base.rec_new_schedule_date, base.rec_inventory_item_id, base.fiscal_month