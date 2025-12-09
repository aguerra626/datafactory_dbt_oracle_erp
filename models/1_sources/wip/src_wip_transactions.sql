select
    transaction_id as wt_transaction_id,
    last_update_date as wt_last_update_date,
    last_updated_by as wt_last_updated_by,
    creation_date as wt_creation_date,
    created_by as wt_created_by,
    last_update_login as wt_last_update_login,
    organization_id as wt_organization_id,
    wip_entity_id as wt_wip_entity_id,
    primary_item_id as wt_primary_item_id,
    acct_period_id as wt_acct_period_id,
    department_id as wt_department_id,
    transaction_type as wt_transaction_type,
    meaning_wt_transaction_type,
    transaction_date as wt_transaction_date,
    group_id as wt_group_id,
    source_code as wt_source_code,
    source_line_id as wt_source_line_id,
    operation_seq_num as wt_operation_seq_num,
    resource_seq_num as wt_resource_seq_num,
    resource_id as wt_resource_id,
    lu_br_resource_code as wt_lu_br_resource_code,
    lu_br_description as wt_lu_br_description,
    autocharge_type as wt_autocharge_type,
    standard_rate_flag as wt_standard_rate_flag,
    usage_rate_or_amount as wt_usage_rate_or_amount,
    basis_type as wt_basis_type,
    transaction_quantity as wt_transaction_quantity,
    transaction_uom as wt_transaction_uom,
    primary_quantity as wt_primary_quantity,
    primary_uom as wt_primary_uom,
    actual_resource_rate as wt_actual_resource_rate,
    standard_resource_rate as wt_standard_resource_rate,
    reason_id as wt_reason_id,
    move_transaction_id as wt_move_transaction_id,
    request_id as wt_request_id,
    program_application_id as wt_program_application_id,
    program_id as wt_program_id,
    program_update_date as wt_program_update_date
from
    {{ source('wip', 'wip_transactions') }}
join {{ ref('lu_wt_transaction_type') }} lu
    on transaction_type = lu.lookup_code_wt_transaction_type -- Per eTRM, transaction_type is a mandatory field, thus inner join.
left join {{ ref('lu_bom_resources') }} lu2
    on resource_id = lu2.lu_br_resource_id -- Per eTRM, not mandatory field, thus, left join.
where
    organization_id = 1213
    and transaction_date >= TRUNC(sysdate, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
