SELECT
    src_fmwop.*,
    stg_join1.*,
    standard_hash(stg_join1.wdj_wip_entity_id||stg_join1.wdj_organization_id||src_fmwop.wop_fm_operation_seq_num, 'MD5') as stg_wop_we_wdj_surrogate_key

FROM
    {{ ref('src_wip_operations_from') }}
    src_fmwop
    JOIN {{ ref('stg_we_wdj') }}
    stg_join1
    ON src_fmwop.wop_fm_wip_entity_id = stg_join1.wdj_wip_entity_id
    AND src_fmwop.wop_fm_organization_id = stg_join1.wdj_organization_id
