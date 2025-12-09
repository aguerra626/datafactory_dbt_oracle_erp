-- declare grain (without the group by): One row per item id per category set name
-- with the group by: one row per item id
SELECT
src_mic.mic_inventory_item_id,
src_mic.mic_organization_id, 
max(case when mcst_category_set_name like 'PROGRAM_DEFAULT' then mc_segment1 end ) as  program_name,
max(case when mcst_category_set_name like 'MATERIAL HANDLING CODE' then mc_segment1 end ) as  material_handling_code,
max(case when mcst_category_set_name like 'PO ITEMS CATEGORY' then mc_segment1 end ) as  purchasing_commodity_code,
max(case when mcst_category_set_name like 'LAB OFFICE CODE' then mc_segment1 end ) as  lab_office_code,
max(case when mcst_category_set_name like 'ESD CODE' then mc_segment1 end ) as  esd_code,
max(case when mcst_category_set_name like 'FAI Program Code' then mc_segment1 end ) as  fai_program_code,
max(case when mcst_category_set_name like 'EQUIPMENT DESCRIPTION' then mc_segment1 end ) as  equipment_description,
max(case when mcst_category_set_name like 'CONFIG RECORD COMPONENT' then mc_segment1 end ) as  config_record_component,
max(case when mcst_category_set_name like 'TINNING CODE' then mc_segment1 end ) as  tinning_code,
max(case when mcst_category_set_name like 'Key Characteristic' then mc_segment1 end ) as  key_characteristic
FROM {{ ref('src_inv_mtl_item_categories') }} src_mic
INNER JOIN {{ ref('src_inv_mtl_category_sets_b') }} src_mcs
ON src_mic.mic_category_set_id = src_mcs.mcs_category_set_id
INNER JOIN {{ ref('src_inv_mtl_category_sets_tl') }} src_mcst
ON src_mcs.mcs_category_set_id = src_mcst.mcst_category_set_id
and src_mcst.mcst_language = userenv('LANG') -- PK mcst.language
INNER JOIN {{ ref('src_inv_mtl_categories_b') }} src_mc
ON src_mic.mic_category_id = src_mc.mc_category_id
INNER JOIN {{ ref('src_fnd_lookup_values') }} LU1
ON src_mcs.mcs_control_level = lu1.lookup_code
AND lu1.lookup_type = 'ITEM_CONTROL_LEVEL_GUI'
WHERE
src_mic.mic_organization_id = 1213
and src_mcst.mcst_category_set_name IN  ('PROGRAM_DEFAULT','MATERIAL HANDLING CODE', 'PO ITEMS CATEGORY')
group by 
src_mic.mic_inventory_item_id,
src_mic.mic_organization_id