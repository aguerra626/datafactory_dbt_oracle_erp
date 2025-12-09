SELECT DISTINCT
    pc_rr_parent_plan_id,
    parent.qp_name,
    parent.qp_description,
    pc_rr_child_plan_id,
    child.qp_name,
    child.qp_description,
    pc_rr_enabled_flag
FROM
    {{ ref('src_qa_pc_results_relationship') }} stg_base
    join {{ ref('src_qa_plans') }} parent
    on pc_rr_parent_plan_id = parent.qp_plan_id
    join {{ ref('src_qa_plans') }} child
    on pc_rr_child_plan_id = child.qp_plan_id
order by pc_rr_parent_plan_id,pc_rr_parent_plan_id