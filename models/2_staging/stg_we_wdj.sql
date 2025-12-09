SELECT
    src_we.*,
    src_wdj.* 

FROM
    {{ ref('src_wip_entities') }}
    src_we
    JOIN {{ ref('src_wip_discrete_jobs') }}
    src_wdj
    ON src_we.we_wip_entity_id = src_wdj.wdj_wip_entity_id
    AND src_we.we_organization_id = src_wdj.wdj_organization_id
where 1=1