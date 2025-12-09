SELECT
  src_msib.*,
  src_mp.*

FROM
    {{ ref('src_inv_mtl_system_items_b') }} src_msib
    JOIN {{ ref('src_inv_mtl_planners') }} src_mp
    on src_msib.msib_planner_code = src_mp.mp_planner_code
    and src_msib.msib_organization_id = src_mp.mp_organization_id