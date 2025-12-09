SELECT
stg_base.*,
bref.*,
standard_hash(to_char(stg_base.bcomp_component_sequence_id)||bref.bref_component_reference_designator, 'MD5') as stg_boms_bcomp_bref_sk
FROM
{{ ref('stg_boms_bcomp') }} stg_base
JOIN {{ ref('src_bom_reference_designators') }} bref 
on stg_base.bcomp_component_sequence_id = bref.bref_component_sequence_id