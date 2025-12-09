with dbt__cte__src_inv_mtl_item_categories__ as (
SELECT
    inventory_item_id AS mic_inventory_item_id,
    organization_id AS mic_organization_id,
    category_set_id AS mic_category_set_id,
    category_id AS mic_category_id,
    last_update_date AS mic_last_update_date,
    creation_date AS mic_creation_date
FROM
    apps.mtl_item_categories
WHERE
    organization_id = 1213
),  dbt__cte__src_inv_mtl_category_sets_b__ as (
SELECT
    category_set_id AS mcs_category_set_id,
    structure_id AS mcs_structure_id,
    validate_flag AS mcs_validate_flag,
    control_level AS mcs_control_level,
    default_category_id AS mcs_default_category_id,
    last_update_date AS mcs_last_update_date,
    creation_date AS mcs_creation_date,
    mult_item_cat_assign_flag AS mcs_mult_item_cat_assign_flag
FROM
    apps.mtl_category_sets_b
),  dbt__cte__src_inv_mtl_category_sets_tl__ as (
SELECT
    category_set_id AS mcst_category_set_id,
    LANGUAGE AS mcst_language,
    source_lang AS mcst_source_lang,
    category_set_name AS mcst_category_set_name,
    description AS mcst_description,
    last_update_date AS mcst_last_update_date,
    creation_date AS mcst_creation_date
FROM
    apps.mtl_category_sets_tl
),  dbt__cte__src_inv_mtl_categories_b__ as (
SELECT
    category_id AS mc_category_id,
    structure_id AS mc_structure_id,
    description AS mc_description,
    disable_date AS mc_disable_date,
    segment1 AS mc_segment1,
    segment2 AS mc_segment2,
    summary_flag AS mc_summary_flag,
    enabled_flag AS mc_enabled_flag,
    last_update_date AS mc_last_update_date,
    creation_date AS mc_creation_date
FROM
    apps.mtl_categories_b
),  dbt__cte__src_fnd_lookup_values__ as (
SELECT
    lookup_code,
    lookup_type,
    meaning
FROM apps.fnd_lookup_values
), -- declare grain (without the group by): One row per item id per category set name
-- with the group by: one row per item id
test as (
SELECT
src_mic.mic_inventory_item_id,
src_mic.mic_organization_id, 
mcst_category_set_name
--max(case when mcst_category_set_name like 'PROGRAM_DEFAULT' then mc_segment1 end ) as  program_name,
--max(case when mcst_category_set_name like 'MATERIAL HANDLING CODE' then mc_segment1 end ) as  material_handling_code,
--max(case when mcst_category_set_name like 'PO ITEMS CATEGORY' then mc_segment1 end ) as  purchasing_commodity_code
FROM dbt__cte__src_inv_mtl_item_categories__ src_mic
INNER JOIN dbt__cte__src_inv_mtl_category_sets_b__ src_mcs
ON src_mic.mic_category_set_id = src_mcs.mcs_category_set_id
INNER JOIN dbt__cte__src_inv_mtl_category_sets_tl__ src_mcst
ON src_mcs.mcs_category_set_id = src_mcst.mcst_category_set_id
and src_mcst.mcst_language = userenv('LANG') -- PK mcst.language
INNER JOIN dbt__cte__src_inv_mtl_categories_b__ src_mc
ON src_mic.mic_category_id = src_mc.mc_category_id
INNER JOIN dbt__cte__src_fnd_lookup_values__ LU1
ON src_mcs.mcs_control_level = lu1.lookup_code
AND lu1.lookup_type = 'ITEM_CONTROL_LEVEL_GUI'
WHERE
src_mic.mic_organization_id = 1213
--and src_mcst.mcst_category_set_name IN  ('PROGRAM_DEFAULT','MATERIAL HANDLING CODE', 'PO ITEMS CATEGORY')
--group by 
--src_mic.mic_inventory_item_id,
--src_mic.mic_organization_id
)
select distinct
mcst_category_set_name
from test