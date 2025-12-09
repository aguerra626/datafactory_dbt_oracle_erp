select 
int_base.*,
case when int_base.material_handling_code like 'OUTPUT CREDIT' then 1 else 0 end is_plus_tl,
stg_join1.msib_organization_id,
stg_join1.msib_inventory_item_id,
stg_join1.msib_segment1,
stg_join1.msib_description,
stg_join1.msib_end_assembly_pegging_flag,
stg_join1.msib_inventory_item_status_code,
stg_join1.msib_planner_code,
stg_join1.msib_planning_make_buy_code,
stg_join1.msib_full_lead_time,
stg_join1.mp_planner_code,
stg_join1.mp_description

FROM {{ ref('stg_mtl_mic_mcs_mcst_mc') }} int_base
JOIN {{ ref('stg_msib_lf_mp') }} stg_join1
on int_base.mic_inventory_item_id = stg_join1.msib_inventory_item_id
and int_base.mic_organization_id = stg_join1.msib_organization_id