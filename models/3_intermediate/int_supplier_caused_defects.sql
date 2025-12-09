select
dd_item_id,
dd_wip_entity_id,
dd_from_op_seq_num,
"Defect Code",
"Defect Code Desc",
"Affected Assy Material",
"Part Number" AS "Job Assy",
"DD Serial Number",
"Creation Date",
"QA Creation Date",
case when "Part Number" = "Affected Assy Material" then 1 else 0 end is_defect_same_level_of_job_assy,
"DD Quantity",
"RR Job Qty"
from {{ ref('dim_quality_defect_details_and_results_recording') }}
join {{ ref('dim_item_master') }}
on dd_item_id = msib_inventory_item_id
and dd_organization_id = msib_organization_id
where "Caused By" like 'NONM-VND'
and "QA Creation Date" >= sysdate-365