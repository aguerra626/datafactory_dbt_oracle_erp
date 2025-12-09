SELECT
    collection_id AS dd_collection_id,
    occurrence AS dd_occurrence,
    last_update_date AS dd_last_update_date,
    qa_last_update_date AS dd_qa_last_update_date,
    last_updated_by AS dd_last_updated_by,
    qa_last_updated_by AS dd_qa_last_updated_by,
    creation_date AS dd_creation_date,
    qa_creation_date AS dd_qa_creation_date,
    created_by AS dd_created_by,
    qa_created_by AS dd_qa_created_by,
    last_update_login AS dd_last_update_login,
    request_id AS dd_request_id,
    program_application_id AS dd_program_application_id,
    program_id AS dd_program_id,
    program_update_date AS dd_program_update_date,
    transaction_number AS dd_transaction_number,
    txn_header_id AS dd_txn_header_id,
    organization_id AS dd_organization_id,
    plan_id AS dd_plan_id,
    spec_id AS dd_spec_id,
    quantity AS dd_quantity,
    item_id AS dd_item_id,
    wip_entity_id AS dd_wip_entity_id,
    to_op_seq_num AS dd_to_op_seq_num,
    from_op_seq_num AS dd_from_op_seq_num,
    status AS dd_status,
    plan_id || '-' || collection_id || '-' || occurrence dd_plan_collection_occur_ids,
    character1 AS dd_def_detail_id,
    character2 AS dd_defect_detail_insp,
    character3 AS dd_inspector_name,
    character4 AS dd_inspection_date,
    character5 AS dd_insp_result,
    character6 AS dd_assembly_description,
    character7 AS dd_revision_nss,
    character8 AS dd_insp_result_meaning,
    character9 AS dd_wip_record_defect_copy_from_variant,
    character10 AS dd_cr_serial_number,
    character11 AS dd_cr_serial_id,
    character13 AS dd_affected_assembly_material,
    character14 AS dd_cr_affected_assy_sn,
    character15 AS dd_cr_affected_assy_sn_id,
    character16 AS dd_rework_oper,
    character17 AS dd_level_revision,
    character18 AS dd_dt_defect_code,
    character19 AS dd_dt_defect_code_meaning,
    character37 AS dd_save_allowed,
    character38 AS dd_open_def,
    character39 AS dd_print_mat_req,
    character40 AS dd_def_detail_print_count,
    character41 AS dd_print_def_sa,
    character42 AS dd_inspection_source,
    character43 AS dd_updated_source,--26.4 % nonnull 
    character44 AS dd_creation_source,--26.4 % nonnull 
    character45 AS dd_nss_dd_ref_hist,--43.8 % nonnull 
    character47 AS dd_interface_id,
    character48 AS dd_accountable_device,
    comment2 AS dd_problem_description_hist,
    -- NOT included IN recommend_me_columns macro 
    character90 AS dd_non_serial_number,
    character20 AS dd_ref_designator,
    character21 AS dd_comp_item,
    character23 AS dd_problem_description,
    character24 AS dd_caused_by,
    character25 AS dd_caused_by_description,
    character26 AS dd_date_code,
    character27 AS dd_material_used,
    character28 AS dd_nc_location,
    character29 AS dd_nc_size,
    character30 AS dd_reject,
    character31 AS dd_repair_fixed,
    character32 AS dd_vendor_sn,
    character33 AS dd_operator_id,
    character34 AS dd_additional_text,
    character35 AS dd_escaped_by_ci,
    character46 AS dd_rf_id,
    character49 AS dd_component_sn
FROM
    {{ source(
        'qa',
        'qa_results'
    ) }}
WHERE
    organization_id IN (
        1213,
        1273
    ) -- nss and general org id
    AND plan_id = 5166 -- defect details nss
    AND (
        status IS NULL
        OR status = 2
    ) -- In progress or completed forms