SELECT
    stg_we_wdj_wmt.*,
    fmwop.*,
    towop.*
FROM
    {{ ref('stg_we_wdj_wmt14days') }}
    stg_we_wdj_wmt
    JOIN {{ ref('src_wip_operations_from') }}
    fmwop
    ON stg_we_wdj_wmt.wmt_wip_entity_id = fmwop.wop_fm_wip_entity_id
    AND stg_we_wdj_wmt.wmt_fm_operation_seq_num = fmwop.wop_fm_operation_seq_num
    AND stg_we_wdj_wmt.wmt_organization_id = fmwop.wop_fm_organization_id
    JOIN {{ ref('src_wip_operations_to') }}
    towop
    ON stg_we_wdj_wmt.wmt_wip_entity_id = towop.wop_to_wip_entity_id
    AND stg_we_wdj_wmt.wmt_to_operation_seq_num = towop.wop_to_operation_seq_num
    AND stg_we_wdj_wmt.wmt_organization_id = towop.wop_to_organization_id
