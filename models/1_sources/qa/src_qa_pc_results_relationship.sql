SELECT
    parent_plan_id as pc_rr_parent_plan_id,
    parent_collection_id as pc_rr_parent_collection_id,
    parent_occurrence as pc_rr_parent_occurrence,
    child_plan_id as pc_rr_child_plan_id,
    child_collection_id as pc_rr_child_collection_id,
    child_occurrence as pc_rr_child_occurrence,
    enabled_flag as pc_rr_enabled_flag,
    last_update_date as pc_rr_last_update_date,
    last_updated_by as pc_rr_last_updated_by,
    creation_date as pc_rr_creation_date,
    created_by as pc_rr_created_by,
    last_update_login as pc_rr_last_update_login,
    child_txn_header_id as pc_rr_child_txn_header_id
FROM
    {{ source(
        'qa',
        'qa_pc_results_relationship'
    ) }}