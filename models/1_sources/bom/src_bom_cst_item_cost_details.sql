select
    resource_id as cicd_resource_id,
    resource_rate as cicd_resource_rate,
    usage_rate_or_amount as cicd_usage_rate_or_amount,
    basis_type as cicd_basis_type,
    basis_factor as cicd_basis_factor,
    net_yield_or_shrinkage_factor as cicd_net_yield_or_shrinkage_factor,
    item_cost as cicd_item_cost,
    cost_element_id as cicd_cost_element_id,
    rollup_source_type as cicd_rollup_source_type,
    request_id as cicd_request_id,
    program_application_id as cicd_program_application_id,
    program_id as cicd_program_id,
    program_update_date as cicd_program_update_date,
    inventory_item_id as cicd_inventory_item_id,
    organization_id as cicd_organization_id,
    cost_type_id as cicd_cost_type_id,
    last_update_date as cicd_last_update_date,
    last_updated_by as cicd_last_updated_by,
    creation_date as cicd_creation_date,
    created_by as cicd_created_by,
    last_update_login as cicd_last_update_login,
    operation_seq_num as cicd_operation_seq_num,
    level_type as cicd_level_type
from
    {{ source('bom', 'cst_item_cost_details') }}
where
    organization_id = 1213

