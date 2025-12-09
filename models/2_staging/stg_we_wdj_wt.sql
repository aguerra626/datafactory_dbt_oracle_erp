-- declare grain: One row per job per resource transaction
SELECT
    stg_base.*,
    src_wt.* 

FROM
    {{ ref('stg_we_wdj') }}
    stg_base
    JOIN {{ ref('src_wip_transactions') }}
    src_wt
    ON stg_base.we_wip_entity_id = src_wt.wt_wip_entity_id