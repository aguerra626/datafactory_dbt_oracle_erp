select
    wip_sub_ledger_id as wta_wip_sub_ledger_id,
    transaction_id as wta_transaction_id,
    reference_account as wta_reference_account,
    last_update_date as wta_last_update_date,
    last_updated_by as wta_last_updated_by,
    creation_date as wta_creation_date,
    created_by as wta_created_by,
    last_update_login as wta_last_update_login,
    organization_id as wta_organization_id,
    transaction_date as wta_transaction_date,
    wip_entity_id as wta_wip_entity_id,
    accounting_line_type as wta_accounting_line_type,
    meaning_wta_cst_accounting_line_type,
    base_transaction_value as wta_base_transaction_value,
    contra_set_id as wta_contra_set_id,
    primary_quantity as wta_primary_quantity,
    rate_or_amount as wta_rate_or_amount,
    basis_type as wta_basis_type,
    resource_id as wta_resource_id,
    lu_br_resource_code as wta_lu_br_resource_code,
    lu_br_description as wta_lu_br_description,
    cost_element_id as wta_cost_element_id,
    request_id as wta_request_id,
    program_application_id as wta_program_application_id,
    program_id as wta_program_id,
    program_update_date as wta_program_update_date
from
    {{ source('wip', 'wip_transaction_accounts') }}
left join {{ ref('lu_wta_cst_accounting_line_type') }} lu
    on accounting_line_type = lu.lookup_code_wta_cst_accounting_line_type -- Per eTRM, not mandatory field, thus, left join.
left join {{ ref('lu_bom_resources') }} lu2
    on resource_id = lu2.lu_br_resource_id -- Per eTRM, not mandatory field, thus, left join.
where
    organization_id = 1213
