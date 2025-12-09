SELECT
*
FROM
{{ ref('src_bom_structures_b') }} boms
JOIN {{ ref('src_bom_components_b') }} bcomp
on boms.boms_bill_sequence_id = bcomp.bcomp_bill_sequence_id