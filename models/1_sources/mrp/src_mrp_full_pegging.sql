SELECT
    pegging_id AS peg_pegging_id,
    inventory_item_id AS peg_inventory_item_id,
    organization_id AS peg_organization_id,
    compile_designator AS peg_compile_designator,
    demand_id AS peg_demand_id,
    demand_quantity AS peg_demand_quantity,
    transaction_id AS peg_transaction_id,
    supply_quantity AS peg_supply_quantity,
    allocated_quantity AS peg_allocated_quantity,
    prev_pegging_id AS peg_prev_pegging_id,
    demand_class AS peg_demand_class,
    updated AS peg_updated,
    status AS peg_status,
    end_item_usage AS peg_end_item_usage,
    end_pegging_id AS peg_end_pegging_id,
    demand_date AS peg_demand_date,
    supply_date AS peg_supply_date,
    supply_type AS peg_supply_type,
    disposition_id AS peg_disposition_id,
    last_update_date AS peg_last_update_date,
    last_updated_by AS peg_last_updated_by,
    creation_date AS peg_creation_date,
    created_by AS peg_created_by,
    last_update_login AS peg_last_update_login,
    project_id AS peg_project_id,
    task_id AS peg_task_id,
    end_origination_type AS peg_end_origination_type,
    end_item_unit_number AS peg_end_item_unit_number
FROM
    {{ source(
        'mrp',
        'mrp_full_pegging'
    ) }}
WHERE
    organization_id = 1213
    AND compile_designator = 'MRP_NSS'
