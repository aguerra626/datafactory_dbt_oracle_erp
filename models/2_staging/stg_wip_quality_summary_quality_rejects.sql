-- declare grain: one row per part number per job per op seq num
SELECT 
'Rejects' feature,
stg_base.rr_item_id,
stg_base.rr_wip_entity_id,
stg_base.rr_from_op_seq_num,
stg_base.wop_fm_description,
standard_hash(stg_base.rr_item_id||stg_base.rr_wip_entity_id||stg_base.rr_from_op_seq_num, 'MD5') as rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk,
standard_hash(to_char(stg_base.rr_item_id)||to_char(stg_base.rr_wip_entity_id)||to_char(stg_base.rr_from_op_seq_num)||stg_base.wop_fm_description, 'MD5') as rr_item_id__rr_wip_entity_id__rr_from_op_seq_num__op_desc_sk,
COUNT(stg_base.rr_serial_number) count_serial_number
FROM {{ ref('stg_qa_results_reject_reroute__wop') }} stg_base
WHERE
  rr_wip_insp_result = 'R'
GROUP BY
  stg_base.rr_item_id,
  stg_base.rr_wip_entity_id,
  stg_base.rr_from_op_seq_num,
  stg_base.wop_fm_description