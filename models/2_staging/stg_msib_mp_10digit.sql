
SELECT
  src_msib.*,
  src_mp.*

FROM
    {{ ref('src_inv_mtl_system_items_b') }} src_msib
    JOIN (
      select substr(x.msib_segment1,0,12) ten_digit_segment1 from {{ ref('src_inv_mtl_system_items_b') }} x where x.msib_segment1 like '%+TL'
    ) src_msib2
    on src_msib.msib_segment1 = src_msib2.ten_digit_segment1
    JOIN {{ ref('src_inv_mtl_planners') }} src_mp
    on src_msib.msib_planner_code = src_mp.mp_planner_code
    and src_msib.msib_organization_id = src_mp.mp_organization_id