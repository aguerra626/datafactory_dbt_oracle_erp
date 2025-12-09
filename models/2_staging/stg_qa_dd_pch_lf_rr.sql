SELECT
    stg_base.*,
    join1.*
FROM
    {{ ref('stg_qa_dd_pch') }}
    stg_base
    LEFT JOIN {{ ref('src_qa_results_rr') }} join1
    ON stg_base.pc_rr_parent_plan_id = join1.rr_plan_id
    AND stg_base.pc_rr_parent_occurrence = join1.rr_occurrence
    AND stg_base.pc_rr_parent_collection_id = join1.rr_collection_id