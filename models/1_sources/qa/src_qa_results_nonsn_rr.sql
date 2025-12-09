SELECT
    collection_id AS nonsn_rr_collection_id,
    occurrence AS nonsn_rr_occurrence,
    last_update_date AS nonsn_rr_last_update_date,
    qa_last_update_date AS nonsn_rr_qa_last_update_date,
    last_updated_by AS nonsn_rr_last_updated_by,
    qa_last_updated_by AS nonsn_rr_qa_last_updated_by,
    creation_date AS nonsn_rr_creation_date,
    qa_creation_date AS nonsn_rr_qa_creation_date,
    created_by AS nonsn_rr_created_by,
    qa_created_by AS nonsn_rr_qa_created_by,
    last_update_login AS nonsn_rr_last_update_login,
    transaction_number AS nonsn_rr_transaction_number,
    txn_header_id AS nonsn_rr_txn_header_id,
    organization_id AS nonsn_rr_organization_id,
    plan_id AS nonsn_rr_plan_id,
    spec_id AS nonsn_rr_spec_id,
    transaction_id AS nonsn_rr_transaction_id,
    department_id AS nonsn_rr_department_id,
    to_department_id AS nonsn_rr_to_department_id,
    quantity AS nonsn_rr_quantity,
    item_id AS nonsn_rr_item_id,
    uom AS nonsn_rr_uom,
    wip_entity_id AS nonsn_rr_wip_entity_id,
    to_op_seq_num AS nonsn_rr_to_op_seq_num,
    from_op_seq_num AS nonsn_rr_from_op_seq_num,
    status AS nonsn_rr_status,
    character1 AS nonsn_rr_save_allowed,
    character2 AS nonsn_rr_insp_result,
    character3 AS nonsn_rr_insp_meaning,
    character4 AS nonsn_rr_insp_res,
    character5 AS nonsn_rr_qty_defect,
    character6 AS nonsn_rr_create_defect_detail,
    character7 AS nonsn_rr_from_op_code,
    character8 AS nonsn_rr_to_op_code,
    character9 AS nonsn_rr_from_intraop,
    character10 AS nonsn_rr_to_intraop
FROM
    {{ source(
        'qa',
        'qa_results'
    ) }}
WHERE
    organization_id IN (
        1213,
        1273
    )
    AND plan_id = 5175 -- non sn results recording nss
    AND (
        status IS NULL
        OR status = 2
    ) -- In progress OR completed forms (needed for ALL plan_ids IN qa_results)
