-- To track and record quality inspection results and defects for assemblies, components, and serial numbers.
-- Declare Grain: One row per defect per serial number per part number per job
-- Column Ordering: Surrogate Keys, Business Keys, Major Descriptive Attribute (highest cardinality), Dates Attribute (when), Minor Descriptive Attributes (lower cardinality)
SELECT
dd_plan_id || '-' || dd_collection_id || '-' || dd_occurrence dd_plan_collection_occur_ids,

dd_cr_serial_id,
dd_cr_affected_assy_sn_id,

pc_rr_child_plan_id,
pc_rr_child_occurrence,
pc_rr_child_collection_id,

pc_rr_parent_plan_id,
pc_rr_parent_collection_id,
pc_rr_parent_occurrence,

dd_wip_entity_id,
dd_from_op_seq_num,
dd_to_op_seq_num,
dd_item_id,
dd_organization_id,
dd_qa_created_by,
--Major Descriptive Attributes (what)
dd_def_detail_id AS "Defect Detail ID",
dd_dt_defect_code AS "Defect Code",
dd_dt_defect_code_meaning AS "Defect Code Desc",
dd_caused_by AS "Caused By",
dd_caused_by_description AS "Caused By Desc",
dd_cr_serial_number AS "DD Serial Number",
rr_serial_number AS "RR Serial Number",
dd_cr_affected_assy_sn AS "Affected Assy SN",
dd_affected_assembly_material AS "Affected Assy Material",
dd_assembly_description AS "Assy Desc",
dd_comp_item AS "Component Item",
dd_problem_description AS "Problem Desc",
-- Date Attributes (when)
dd_inspection_date AS "Inspection Date",
dd_qa_creation_date AS "QA Creation Date",
dd_creation_date AS "Creation Date",
-- Minor Descriptive Attributes
--dd_insp_result,
--dd_insp_result_meaning,
rr_wip_insp_result "RR WIP Insp Result",
rr_prev_insp_result "RR Prev WIP Insp Result",
dd_defect_detail_insp,
dd_wip_record_defect_copy_from_variant,
dd_ref_designator AS "Ref Designator",
dd_inspector_name AS "Inspector Name",
dd_rf_id AS "RFID",
dd_component_sn AS "Comp SN",

dd_revision_nss,
dd_non_serial_number,
dd_rework_oper,
dd_level_revision,
dd_print_mat_req,
dd_print_def_sa,
dd_inspection_source,
dd_status,
dd_def_detail_print_count,
-- facts
dd_open_def AS "DD Open Def",
dd_quantity AS "DD Quantity",
rr_open_def AS "RR Open Def",
rr_num_of_def AS "RR Num Of Def",
rr_num_of_accepts AS "RR Num of Accepts",
rr_comp_qty AS "RR Comp Qty",
rr_job_quantity AS "RR Job Qty"

from {{ ref('stg_qa_dd_pch_lf_rr') }}