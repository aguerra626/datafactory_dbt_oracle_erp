SELECT
    *
FROM
    {{ ref('stg_from_wop_we_wdj_msib') }}
    stg_base
    LEFT JOIN {{ ref('src_wip_move_transactions_365days') }}
    src_wmt
    ON stg_base.wop_fm_wip_entity_id = src_wmt.wmt_wip_entity_id
    AND stg_base.wop_fm_operation_seq_num = src_wmt.wmt_fm_operation_seq_num
    AND stg_base.wop_fm_organization_id = src_wmt.wmt_organization_id
