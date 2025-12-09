SELECT 
src_bos.*,
src_bor.*
FROM {{ ref('src_bom_operation_sequences') }} src_bos
JOIN {{ ref('src_bom_operational_routings') }} src_bor
ON src_bos.bos_routing_sequence_id = src_bor.bor_routing_sequence_id