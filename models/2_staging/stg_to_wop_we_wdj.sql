SELECT
    *
FROM
    {{ ref('src_wip_operations_from') }}
    src_fm_wop
    JOIN {{ ref('stg_we_wdj_msib') }}
    stg_we_wdj
    ON src_fm_wop.wop_fm_wip_entity_id = stg_we_wdj.wdj_wip_entity_id
    AND src_fm_wop.wop_fm_organization_id = stg_we_wdj.wdj_organization_id
