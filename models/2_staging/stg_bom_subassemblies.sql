SELECT
boms.boms_assembly_item_id,
boms.boms_assembly_type,
assy.msib_segment1,
assy.msib_description,
assy.msib_end_assembly_pegging_flag,
assy.mp_description,
boms.boms_bill_sequence_id,
boms.boms_common_bill_sequence_id,
bcomp.bcomp_operation_seq_num,
bcomp.bcomp_component_item_id,
bcomp_component_sequence_id,
comp.msib_segment1,
comp.msib_description,
bref.bref_component_reference_designator,
bref.bref_ref_designator_comment,
bref.bref_attribute14,
comp.msib_end_assembly_pegging_flag,
comp.mp_description,
boms.boms_implementation_date,
boms.boms_last_update_date,
boms.boms_original_system_reference,
boms.boms_effectivity_control,
boms.boms_is_preferred,
assy.mp_planner_code
FROM
{{ ref('src_bom_structures_b') }} boms
JOIN {{ ref('src_bom_components_b') }} bcomp
on boms.boms_bill_sequence_id = bcomp.bcomp_bill_sequence_id
JOIN {{ ref('src_bom_reference_designators') }} bref 
on bcomp.bcomp_component_sequence_id = bref_component_sequence_id
JOIN {{ ref('stg_msib_mp') }} assy
on boms.boms_assembly_item_id = assy.msib_inventory_item_id
and boms.boms_organization_id = assy.msib_organization_id
JOIN {{ ref('stg_msib_mp') }} comp
on bcomp.bcomp_component_item_id = comp.msib_inventory_item_id
where 1=1
and assy.msib_segment1 like '987-2094-004'