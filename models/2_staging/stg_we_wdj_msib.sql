SELECT
    src_we.*,
    src_wdj.*,
    src_msib_mp.*    

FROM
    {{ ref('src_wip_entities') }}
    src_we
    JOIN {{ ref('src_wip_discrete_jobs') }}
    src_wdj
    ON src_we.we_wip_entity_id = src_wdj.wdj_wip_entity_id
    AND src_we.we_organization_id = src_wdj.wdj_organization_id
    JOIN {{ ref('stg_msib_mp') }} src_msib_mp
    ON src_wdj.wdj_primary_item_id = src_msib_mp.msib_inventory_item_id
    and src_wdj.wdj_organization_id = src_msib_mp.msib_organization_id