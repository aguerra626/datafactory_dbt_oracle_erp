SELECT
stg_base.*,
join1.wop_fm_operation_seq_num,
join1.wop_fm_description
FROM
{{ ref('src_qa_results_rr__reject_reroute__opendef_greaterthan0') }} stg_base
JOIN {{ ref('src_wip_operations_from') }} join1
on stg_base.rr_wip_entity_id = join1.wop_fm_wip_entity_id
and stg_base.rr_from_op_seq_num = wop_fm_operation_seq_num