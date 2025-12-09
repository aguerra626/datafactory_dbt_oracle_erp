-- Business Process: Tracking inventory reservations to supply the demand coming from open sales orders with line number
-- declare grain: one row per demand (ie sales order) per supply (ie wip or inventory) per reservation 
select 
stg_base.*,
join1.*
from {{ ref('stg_mr_mso') }} stg_base
join {{ ref('src_oe_order_lines_all') }} join1 
on stg_base.mr_demand_source_line_id = join1.oel_line_id