select 
rr_wip_entity_id as rr_wip_entity_id,
rr_item_id as rr_item_id,
rr_serial_number AS "RR Serial Number",
rr_from_op_seq_num AS "RR Fm Op Seq Num",
rr_inspection_date AS "RR Inspection Date",
rr_wip_insp_result AS "RR WIP Insp Result",

--facts
rr_num_of_def AS "RR Num of Def",
rr_open_def AS "RR Open Def",
rr_job_quantity AS "RR Job Qty"
from {{ ref('src_qa_results_rr') }}