SELECT
    int_base.oel_cust_po_number "Sales Line Locator",
    int_base.oel_user_item_description "SAASM Item Number",
    int_base.oel_ordered_quantity "Sales Line Ordered Quantity",
    trunc(int_base.oel_schedule_ship_date) "VMI Date EST",
    int_base.oeh_order_number || ' ' || int_base.oel_line_number || '.' || int_base.oel_shipment_number "Order Line Number",
    'VMI SOs PLANNED' "Feature",
    'N/A' "Reference Text",
    int_base.hz_p_party_name "Party Name",
    int_base.wsh_nd_name "Delivery Number",
    int_base.oel_flow_status_code "Sales Line Flow Status",
    int_base.stg_oeh_oel_sk,
    int_base.stg_oeh_oel_sk2,
    null reason_code
FROM {{ ref('int_saasm_sales_lines_and_deliveries') }} int_base