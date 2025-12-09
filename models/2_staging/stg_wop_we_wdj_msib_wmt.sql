SELECT
    stg_wop_we_wdj_msib.*,
    src_wmt.*
FROM
    {{ ref('stg_wop_we_wdj_msib') }}
    stg_wop_we_wdj_msib
    JOIN {{ ref('src_wip_move_transactions_365days') }}
    src_wmt
    ON stg_wop_we_wdj_msib.wop_wip_entity_id = src_wmt.wmt_wip_entity_id
    AND stg_wop_we_wdj_msib.wop_operation_seq_num = src_wmt.wmt_fm_operation_seq_num
    AND stg_wop_we_wdj_msib.wop_organization_id = src_wmt.wmt_organization_id
