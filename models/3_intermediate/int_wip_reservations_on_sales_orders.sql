select 
int_base.mso_segment1,
int_base.mso_segment2,
int_base.mso_sales_order_id,
int_base.mr_demand_source_header_id,
int_base.mr_demand_source_type_name,
int_base.mr_demand_source_type_id,
int_base.mr_demand_source_line_id,
int_base.mr_supply_source_header_id,
int_base.mr_supply_source_type_name,
int_base.mr_supply_source_type_id,
int_base.mr_requirement_date,
int_base.mr_reservation_quantity,
int_base.oel_shipment_number,
int_base.oel_line_number,
int_base.oel_schedule_ship_date,
int_base.mr_ship_ready_flag 
from {{ ref('stg_mr_mso_oel') }} int_base
where int_base.mr_supply_source_type_id = 5 -- wip jobs supply
and int_base.mr_demand_source_type_id = 2 -- sales order demand