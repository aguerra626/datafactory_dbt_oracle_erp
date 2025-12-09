SELECT
    stg_base.*,
    src_wro.* 

FROM
    {{ ref('stg_we_wdj') }}
    stg_base
    JOIN {{ ref('src_wip_requirement_operations') }}
    src_wro
    ON stg_base.we_wip_entity_id = src_wro.wro_wip_entity_id
    AND stg_base.we_organization_id = src_wro.wro_organization_id