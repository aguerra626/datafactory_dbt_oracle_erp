select a.sales_order_id,
b.DEMAND_SOURCE_HEADER_ID,
b.DEMAND_SOURCE_LINE,
b.DEMAND_SOURCE_NAME,
b.LINE_ITEM_QUANTITY,
b.RESERVATION_QUANTITY,
b.COMPLETED_QUANTITY,
a.CURRENT_DEMAND_CLASS,
a.PREVIOUS_DEMAND_CLASS,
c.segment1,
BASE_MODEL_ID
from apps.mrp_sales_order_updates a
join apps.mtl_demand b on a.sales_order_id = b.DEMAND_SOURCE_LINE
join apps.mtl_sales_orders c on b.demand_source_header_id = c.sales_order_id
where a.organization_id = 1213
and DEMAND_SOURCE_HEADER_ID = 2167865
--and sales_order_id = 2167865