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
dd_def_detail_id "Defect Detail ID",
dd_dt_defect_code "Defect Code",
dd_dt_defect_code_meaning "Defect Code Desc",
dd_caused_by "Caused By",
dd_caused_by_description "Caused By Desc",
dd_cr_serial_number,
dd_cr_affected_assy_sn "Affected Assy SN",
dd_affected_assembly_material "Affected Assy Material",
dd_assembly_description "Assy Desc",
dd_comp_item "Component Item",
dd_problem_description "Problem Desc",
-- Date Attributes (when)
dd_inspection_date "Inspection Date",
dd_qa_creation_date "QA Creation Date",
dd_creation_date "Creation Date",
-- Minor Descriptive Attributes
--dd_insp_result,
--dd_insp_result_meaning,
dd_defect_detail_insp,
dd_wip_record_defect_copy_from_variant,
dd_ref_designator "Ref Designator",
dd_inspector_name "Inspector Name",

dd_revision_nss,
dd_non_serial_number,
dd_rework_oper,
dd_level_revision,
dd_print_mat_req,
dd_print_def_sa,
dd_inspection_source,
dd_status,
-- facts
dd_open_def "Defect Detail Open Def",
dd_quantity "Defect Detail Quantity",
dd_def_detail_print_count

from {{ ref('stg_qa_dd_pch') }}