SELECT
    stg_base.*,
    src_wmt45.*
FROM
    {{ ref('stg_we_wdj_fm_wop') }}
    stg_base
    JOIN {{ ref('src_wip_move_transactions_45days') }}
    src_wmt45
    ON stg_base.wop_fm_wip_entity_id = src_wmt45.wmt_wip_entity_id
    AND stg_base.wop_fm_operation_seq_num = src_wmt45.wmt_fm_operation_seq_num
    AND stg_base.wop_fm_organization_id = src_wmt45.wmt_organization_id
