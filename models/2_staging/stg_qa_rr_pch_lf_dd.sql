SELECT
    stg_base.*,
    join1.*
FROM
    {{ ref('src_qa_results_rr') }}
    stg_base
    LEFT JOIN {{ ref('stg_qa_dd_pch') }} join1
    ON stg_base.rr_plan_id = join1.pc_rr_parent_plan_id
    AND stg_base.rr_occurrence = join1.pc_rr_parent_occurrence
    AND stg_base.rr_collection_id = join1.pc_rr_parent_collection_id