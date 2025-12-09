SELECT
    stg_we_wdj_foj_wmt.*,
    fmwop.*
FROM
    {{ ref('stg_we_wdj_foj_wmt') }}
    stg_we_wdj_foj_wmt
    FULL OUTER JOIN {{ ref('src_wip_operations_from') }}
    fmwop
    ON stg_we_wdj_foj_wmt.wmt_wip_entity_id = fmwop.wop_fm_wip_entity_id
    AND stg_we_wdj_foj_wmt.wmt_fm_operation_seq_num = fmwop.wop_fm_operation_seq_num
    AND stg_we_wdj_foj_wmt.wmt_organization_id = fmwop.wop_fm_organization_id
