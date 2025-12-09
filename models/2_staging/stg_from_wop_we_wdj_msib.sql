SELECT
    src_fm_wop.*,
    stg_we_wdj_msib.*,
    standard_hash(stg_we_wdj_msib.wdj_wip_entity_id||stg_we_wdj_msib.wdj_organization_id||src_fm_wop.wop_fm_operation_seq_num, 'MD5') as stg_from_wop_we_wdj_surrogate_key
FROM
    {{ ref('src_wip_operations_from') }}
    src_fm_wop
    JOIN {{ ref('stg_we_wdj_msib') }}
    stg_we_wdj_msib
    ON src_fm_wop.wop_fm_wip_entity_id = stg_we_wdj_msib.wdj_wip_entity_id
    AND src_fm_wop.wop_fm_organization_id = stg_we_wdj_msib.wdj_organization_id
