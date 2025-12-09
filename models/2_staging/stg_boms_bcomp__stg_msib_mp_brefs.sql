SELECT
stg_base.*,
bref.bref_component_reference_designator,
bref.bref_component_sequence_id,
bref.bref_acd_type

FROM
{{ ref('stg_boms_bcomp__stg_msib_mp') }} stg_base
JOIN {{ ref('src_bom_reference_designators') }} bref 
on stg_base.bcomp_component_sequence_id = bref_component_sequence_id