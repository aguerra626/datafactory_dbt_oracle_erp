--one row per wip job per affected assy
select 
dd_wip_entity_id,
"Affected Assy Material",
min("QA Creation Date") AS "First QA Creation Date",
sum("DD Quantity") AS "Defect Qty"
from {{ ref('int_supplier_caused_defects') }}
where is_defect_same_level_of_job_assy = 1
group by 
dd_wip_entity_id,
"Affected Assy Material"