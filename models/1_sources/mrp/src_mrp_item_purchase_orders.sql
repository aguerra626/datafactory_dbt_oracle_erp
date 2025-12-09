SELECT
    transaction_id AS mrp_transaction_id,
    last_update_date AS mrp_last_update_date,
    last_updated_by AS mrp_last_updated_by,
    creation_date AS mrp_creation_date,
    created_by AS mrp_created_by,
    last_update_login AS mrp_last_update_login,
    inventory_item_id AS mrp_inventory_item_id,
    organization_id AS mrp_organization_id,
    compile_designator AS mrp_compile_designator,
    purchase_order_id AS mrp_purchase_order_id,
    source_organization_id AS mrp_source_organization_id,
    vendor_id AS mrp_vendor_id,
    vendor_site_id AS mrp_vendor_site_id,
    order_type AS mrp_order_type,
    delivery_schedule_date AS mrp_delivery_schedule_date,
    po_number AS mrp_po_number,
    delivery_balance AS mrp_delivery_balance,
    expected_scrap_quantity AS mrp_expected_scrap_quantity,
    uom_code AS mrp_uom_code,
    po_uom_delivery_balance AS mrp_po_uom_delivery_balance,
    delivery_price AS mrp_delivery_price,
    delivery_status_type AS mrp_delivery_status_type,
    purch_line_num AS mrp_purch_line_num,
    line_id AS mrp_line_id,
    firm_planned_status_type AS mrp_firm_planned_status_type,
    delivery_need_date AS mrp_delivery_need_date,
    revision AS mrp_revision,
    print_date AS mrp_print_date,
    receiving_document_designator AS mrp_receiving_document_designator,
    request_id AS mrp_request_id,
    program_id AS mrp_program_id,
    program_update_date AS mrp_program_update_date,
    demand_class AS mrp_demand_class,
    project_id AS mrp_project_id,
    task_id AS mrp_task_id,
    planning_group AS mrp_planning_group,
    end_item_unit_number AS mrp_end_item_unit_number,
    program_application_id AS mrp_program_application_id
FROM
    {{ source(
        'mrp',
        'mrp_item_purchase_orders'
    ) }}
WHERE
    organization_id = 1213
    AND compile_designator = 'MRP_NSS'
