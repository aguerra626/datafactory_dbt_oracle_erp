SELECT
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.we_wip_entity_name,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wmt_source_code,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wmt_transaction_quantity,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wmt_fm_operation_seq_num,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wop_fm_description,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.we_entity_type,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.msib_segment1,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.msib_description,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wmt_request_id,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.we_description,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wmt_fm_intraoperation_step_type,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wdj_source_code,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wdj_description,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wdj_status_type,
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.wdj_wip_supply_type
FROM
    {{ ref('stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp') }}
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp
WHERE
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp.we_wip_entity_name IN (
        '5757847',
        '5649606',
        '5757847',
        'C29434764'
    )