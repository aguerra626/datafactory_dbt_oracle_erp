SELECT
boms.boms_assembly_item_id,
boms.boms_assembly_type,
boms.bcomp_component_sequence_id,
assy.msib_segment1 assy_msib_segment1,
assy.msib_description assy_msib_description,
assy.msib_end_assembly_pegging_flag assy_msib_end_assembly_pegging_flag,
assy.mp_description assy_mp_description,
boms.boms_bill_sequence_id,
boms.boms_common_bill_sequence_id,
boms.bcomp_operation_seq_num,
boms.bcomp_component_item_id,
comp.msib_segment1 comp_msib_segment1,
comp.msib_description comp_msib_description,
comp.msib_end_assembly_pegging_flag comp_msib_end_assembly_pegging_flag,
comp.mp_description comp_mp_description,
boms.boms_implementation_date,
boms.boms_last_update_date,
boms.boms_original_system_reference,
boms.boms_effectivity_control,
boms.boms_is_preferred,
assy.mp_planner_code assy_mp_planner_code
FROM
{{ ref('stg_boms_bcomp') }} boms
JOIN {{ ref('stg_msib_mp') }} assy
on boms.boms_assembly_item_id = assy.msib_inventory_item_id
and boms.boms_organization_id = assy.msib_organization_id
JOIN {{ ref('stg_msib_mp') }} comp
on boms.bcomp_component_item_id = comp.msib_inventory_item_id
and boms.boms_organization_id = comp.msib_organization_id
