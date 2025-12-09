select 
int_base.mic_inventory_item_id,
int_base.mic_organization_id,
int_base.mcst_category_set_name,
int_base.mcst_description,
int_base.mc_segment1 AS "Program",
int_base.mc_segment2,
stg_join1.msib_organization_id,
stg_join1.msib_inventory_item_id,
stg_join1.msib_segment1 AS "Part Number",
stg_join1.msib_end_assembly_pegging_flag AS "End Assy Pegging Flag",
stg_join1.msib_inventory_item_status_code AS "Item Status",
stg_join1.msib_planning_make_buy_code AS "Make Buy Code",
stg_join1.msib_full_lead_time AS "Full Lead Time",
stg_join1.mp_planner_code,
stg_join1.mp_description AS "Planner",
0 as dummy_qty

FROM {{ ref('stg_mtl_mic_mcs_mcst_mc') }} int_base
JOIN {{ ref('stg_msib_mp') }} stg_join1
on int_base.mic_inventory_item_id = stg_join1.msib_inventory_item_id
and int_base.mic_organization_id = stg_join1.msib_organization_id
where stg_join1.msib_segment1 like '%+TL'

union all 

select 
int_base.mic_inventory_item_id,
int_base.mic_organization_id,
int_base.mcst_category_set_name,
int_base.mcst_description,
int_base.mc_segment1 AS "Program",
int_base.mc_segment2,
stg_join1.msib_organization_id,
stg_join1.msib_inventory_item_id,
stg_join1.msib_segment1 AS "Part Number",
stg_join1.msib_end_assembly_pegging_flag AS "End Assy Pegging Flag",
stg_join1.msib_inventory_item_status_code AS "Item Status",
stg_join1.msib_planning_make_buy_code AS "Make Buy Code",
stg_join1.msib_full_lead_time AS "Full Lead Time",
stg_join1.mp_planner_code,
stg_join1.mp_description AS "Planner",
0 as dummy_qty

FROM {{ ref('stg_mtl_mic_mcs_mcst_mc') }} int_base
JOIN {{ ref('stg_msib_mp_10digit') }} stg_join1
on int_base.mic_inventory_item_id = stg_join1.msib_inventory_item_id
and int_base.mic_organization_id = stg_join1.msib_organization_id
