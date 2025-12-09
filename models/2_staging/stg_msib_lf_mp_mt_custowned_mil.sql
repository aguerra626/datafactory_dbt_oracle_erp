SELECT
    stg_base.*,
    stg_join1.*
FROM
    {{ ref('stg_msib_lf_mp') }}
    stg_base
    JOIN {{ ref('stg_mt_custowned_mil') }}
    stg_join1
    ON stg_base.msib_organization_id = stg_join1.custowned_organization_id
    AND stg_base.msib_inventory_item_id = stg_join1.custowned_inventory_item_id
