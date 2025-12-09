SELECT
  planner_code as mp_planner_code,
  organization_id as mp_organization_id,
  description as mp_description
FROM
  {{ source(
    'inv',
    'mtl_planners'
  ) }}
WHERE
  organization_id = 1213