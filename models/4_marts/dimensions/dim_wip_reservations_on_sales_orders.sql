-- business process: to track reservations...
-- declare grain: one row per sales order (demand) per wip job (supply) per reservation
{# with base as (
    select * from {{ ref('int_wip_reservations_on_sales_orders') }}
) #}
select 
mso_segment1 AS "Sales Order",
mso_segment2 AS "Sales Order Type",
mso_sales_order_id,
mr_demand_source_header_id,
mr_demand_source_type_name "Demand Source Type",
mr_demand_source_type_id,
mr_demand_source_line_id,
mr_supply_source_header_id,
mr_supply_source_type_name "Supply Source Type",
mr_supply_source_type_id,
mr_requirement_date "Reservation Requirement Date",
mr_reservation_quantity "Reservation Qty",
oel_shipment_number "Sales Shipment Number",
oel_line_number "Sales Line Number",
oel_schedule_ship_date "Line Scheduled Ship Date",
mr_ship_ready_flag 
from {{ ref('int_wip_reservations_on_sales_orders') }}
