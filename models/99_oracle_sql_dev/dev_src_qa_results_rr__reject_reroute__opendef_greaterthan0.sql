SELECT
    wip_entity_id as rr_wip_entity_id,
    qa_creation_date as rr_qa_creation_date,
    from_op_seq_num as rr_from_op_seq_num,
    character1 as rr_serial_number,
    character3 as rr_wip_insp_result,
    item_id as rr_item_id,
    character14 as rr_num_of_def,
    character55 as rr_open_def,
    character15 as rr_num_of_accepts,
    character33 as rr_inventory_item_id,
    occurrence as rr_occurrence,
    program_application_id as rr_program_application_id
FROM
    apps.qa_results
WHERE
    organization_id = 1213 
    AND plan_id = 5179 -- results recording nss
    --AND (status = 2 OR status IS NULL)
    --and ((character3 = 'R' and character55 > 0) OR character3 = 'RR') -- wip insp result, open def
    and character55 > 0
    and character1 in
(
    '4YFNG2',
    '4YD1PY',
    '4YFHC8',
    '4TC25R',
    '4YF5N4',
    '4YDFYT',
    '4YDR1X',
    '4YDR4V',
    '4YDNKL',
    '4YDKYT',
    '4TCDMT',
    '4YFK3Y',
    '4YF7K8',
    '4YDGR0'
)