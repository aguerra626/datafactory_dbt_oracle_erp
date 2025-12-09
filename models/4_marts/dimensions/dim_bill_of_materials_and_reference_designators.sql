-- define business process: To identify assemblies, subassemblies, and components within the bill of materials structure and their reference designators. 
-- declare grain: One row per assembly per component per reference designator
-- column order: surrogate key, business keys, major descriptive attribute, dates, to minor descriptives
select
-- surrogate key
stg_boms_bcomp_bref_sk,
-- business keys
base.bcomp_component_sequence_id,
base.boms_bill_sequence_id,
-- major descriptive attributes
base.boms_assembly_item_id,
base.bcomp_component_item_id,
base.bcomp_operation_seq_num,
base.bref_component_reference_designator,
-- dates
base.bcomp_effectivity_date,
base.bcomp_disable_date,
base.boms_implementation_date,
base.boms_last_update_date,
-- minor descriptive attributes
base.boms_original_system_reference,
base.bref_acd_type,
base.boms_assembly_type,
base.boms_effectivity_control,
base.boms_is_preferred
from {{ ref('stg_boms_bcomp_bref') }} base