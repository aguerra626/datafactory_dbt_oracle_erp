SELECT
    wip_entity_id as rr_wip_entity_id,
    qa_creation_date as rr_qa_creation_date,
    from_op_seq_num as rr_from_op_seq_num,
    character1 as rr_serial_number,
    character3 as rr_wip_insp_result,
    item_id as rr_item_id,
    character55 as rr_open_def,
    occurrence as rr_occurrence
FROM
    {{ source(
        'qa',
        'qa_results'
    ) }}
WHERE
    organization_id = 1213 AND plan_id = 5179 -- results recording nss
    AND (status = 2 OR status IS NULL)
    --and qa_creation_date >= sysdate -90
    and ((character3 = 'R' and character55 > 0) -- wip insp result, open def
    OR character3 = 'RR')