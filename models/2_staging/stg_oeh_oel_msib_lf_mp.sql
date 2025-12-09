SELECT
    stg_base.*,
    stg_join1.*
FROM
    {{ ref('stg_oeh_oel') }}
    stg_base
    JOIN {{ ref('stg_msib_lf_mp') }}
    stg_join1
    ON stg_base.oel_ship_from_org_id = stg_join1.msib_organization_id
    AND stg_base.oel_inventory_item_id = stg_join1.msib_inventory_item_id
