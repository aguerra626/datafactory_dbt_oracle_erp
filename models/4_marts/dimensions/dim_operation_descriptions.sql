with base as (
    select * from {{ ref('src_bom_operation_sequences') }}
)
select
bos_operation_sequence_id,
bos_routing_sequence_id,
bos_operation_seq_num,
bos_operation_description,
bos_attribute14,
bos_operation_type
from base