SELECT
stg_qa_dd.*,
src_pc_rr.*
FROM
    {{ ref('src_qa_results_dd') }}
    stg_qa_dd
    JOIN {{ ref('src_qa_pc_results_relationship') }}
    src_pc_rr
    ON src_pc_rr.pc_rr_child_plan_id = stg_qa_dd.dd_plan_id
    AND src_pc_rr.pc_rr_child_occurrence = stg_qa_dd.dd_occurrence
    AND src_pc_rr.pc_rr_child_collection_id = stg_qa_dd.dd_collection_id