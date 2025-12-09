--declare grain: one row per assembly per routing per operation step
-- column ordering: Surrogate Keys -> Business Keys -> Major Descriptive Attributes (from highest cardinality) 
-- -> Dates Attributes (when) -> minor attributes (hierarchical, lookup codes) 
SELECT
-- standard_hash() -> _sk,
bos_operation_sequence_id,
bos_routing_sequence_id,
bos_operation_seq_num,
bor_assembly_item_id,

bos_effectivity_date,
bor_last_update_date,
bor_creation_date,

bos_department_id,
bos_operation_description,
bor_completion_subinventory
FROM {{ ref('stg_bos_bor') }} base