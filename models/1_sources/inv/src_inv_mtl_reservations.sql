SELECT
    reservation_id AS mr_reservation_id,
    lu2.tst_transaction_source_type_name AS mr_orig_demand_source_type_name,
    orig_demand_source_header_id AS mr_orig_demand_source_header_id,
    orig_demand_source_type_id AS mr_orig_demand_source_type_id,

    lu3.tst_transaction_source_type_name AS mr_demand_source_type_name,
    demand_source_header_id AS mr_demand_source_header_id,
    demand_source_type_id AS mr_demand_source_type_id,

    lu.tst_transaction_source_type_name AS mr_orig_supply_source_type_name,
    orig_supply_source_header_id AS mr_orig_supply_source_header_id,
    orig_supply_source_type_id AS mr_orig_supply_source_type_id,

    lu4.tst_transaction_source_type_name AS mr_supply_source_type_name,
    supply_source_header_id AS mr_supply_source_header_id,
    supply_source_type_id AS mr_supply_source_type_id,
    
    requirement_date AS mr_requirement_date,
    orig_demand_source_line_id AS mr_orig_demand_source_line_id,
    secondary_detailed_quantity AS mr_secondary_detailed_quantity,
    serial_reservation_quantity AS mr_serial_reservation_quantity,
    inventory_item_id AS mr_inventory_item_id,
    demand_source_line_id AS mr_demand_source_line_id,
    primary_uom_code AS mr_primary_uom_code,
    reservation_uom_code AS mr_reservation_uom_code,
    reservation_quantity AS mr_reservation_quantity,
    ship_ready_flag AS mr_ship_ready_flag,
    primary_reservation_quantity AS mr_primary_reservation_quantity,
    subinventory_code AS mr_subinventory_code,
    locator_id AS mr_locator_id,
    last_update_date AS mr_last_update_date,
    last_updated_by AS mr_last_updated_by,
    creation_date AS mr_creation_date,
    created_by AS mr_created_by,
    last_update_login AS mr_last_update_login,
    request_id AS mr_request_id,
    program_application_id AS mr_program_application_id,
    program_id AS mr_program_id,
    program_update_date AS mr_program_update_date,
    n_column1 AS mr_n_column1,
    detailed_quantity AS mr_detailed_quantity,
    organization_id AS mr_organization_id,
    staged_flag AS mr_staged_flag
FROM
    {{ source('inv', 'mtl_reservations') }}
join {{ ref('lu_mtl_txn_source_types') }} lu
on orig_supply_source_type_id = lu.tst_transaction_source_type_id
join {{ ref('lu_mtl_txn_source_types') }} lu2
on orig_demand_source_type_id = lu2.tst_transaction_source_type_id
join {{ ref('lu_mtl_txn_source_types') }} lu3
on demand_source_type_id = lu3.tst_transaction_source_type_id
join {{ ref('lu_mtl_txn_source_types') }} lu4
on supply_source_type_id = lu4.tst_transaction_source_type_id
WHERE
    organization_id = 1213
