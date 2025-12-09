-- Business Process: Tracking inventory reservations to supply the demand coming from open sales orders with line number
select 
mso_segment1,
mso_segment2,
mso_sales_order_id,
mr_demand_source_header_id,
mr_demand_source_type_name,
mr_demand_source_type_id,
mr_demand_source_line_id,
mr_supply_source_header_id,
mr_supply_source_type_name,
mr_supply_source_type_id,
mr_requirement_date,
mr_reservation_quantity,
mr_ship_ready_flag

from {{ ref('src_inv_mtl_reservations') }} stg_base
join {{ ref('src_inv_mtl_sales_orders') }} join1 -- only demand from Sales Orders.
on stg_base.mr_demand_source_header_id = join1.mso_sales_order_id