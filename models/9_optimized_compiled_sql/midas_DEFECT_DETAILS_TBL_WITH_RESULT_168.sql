select 
x.*,
case 
  when 
    department IN ('CIC','InspTL','QATech','SellTable','Test-ATE','Test-ESS','TestTL','Test-Vibe')
    then 'Top Level'
  when 
    department IN ('CleanRoom2','InspCR1','InspCR2','InspCR3','TestCR4','TestMepa','TestMold','InspMEPA')
    then 'Micro'
  when 
    department IN ('ENGTest','InspNPI','TestNPI')
    then 'NPI'
  when 
    department IN ('InspAuto','InspCCA','')
    then 'Board Build'
end department_grouping
from
(
SELECT 
    pch.parent_plan_id         prr_parent_plan_id,
    pch.parent_collection_id   prr_parent_collection_id,
    pch.parent_occurrence      prr_parent_occurrence,
    pch.parent_plan_id       || '-' ||  pch.parent_collection_id   || '-'  || pch.parent_occurrence      qr_parent_plan_collection_occur_id,
     qr.plan_id,
    qr.occurrence,
    qr.collection_id,
   -- qr.plan_id  || '-'     || qr.collection_id    || '-'    || qr.occurrence     plan_collection_occur_ids, -- key for qa_pc_results_relationship
    qr.organization_id,
    qr.character1             def_detail_id,
    qr.character2              defect_detail_insp,
    qr.character3              inspector,
    TO_DATE(qr.character4, 'YYYY/MM/DD') inspection_date,
    qr.wip_entity_id,
    we.wip_entity_name         job,
    null as source_code,
    qr.character8              default_values,
    qr.character9              wip_record_defect_copy,
    qr.from_op_seq_num         from_op_seq_number,
    qr.to_op_seq_num           to_op_seq_number,
    qr.item_id,
    msik.segment1              item,
    msik.INVENTORY_ITEM_STATUS_CODE item_status,
    qr.character6              description,
    qr.character7             revision_nss,
    --qr.character17              bom_revision,
    qr.character10              cr_serial_number,
    to_number(qr.character11) cr_serial_id,
    qr.character90             serial_number_int,
    qr.character13             affected_assembly_material,
    qr.character14              cr_affected_assy_sn,
    to_number(qr.character15) cr_affected_assy_sn_id,
    qr.character16             rework_oper,
    --qr.character11             dt_proc_operation,
    qr.character17             level_revision,
    qr.character18             dt_defect_code,
    qr.character19             dt_defect_code_meaning,
    qr.character20             nss_defect_tracker_ref_des,
    qr.character21             dt_component,
    qr.character22             reference_designator,
    qr.character23             problem_description,
    qr.comment1                problem_description_long,
    qr.comment2                problem_description_hist,
    qr.quantity                quantity,
    qr.character24             dt_caused_by,
    qr.character25             dt_caused_by_description,
    qr.character26             date_code,
    qr.character27             material_affected,
    qr.character28             nc_location,
    qr.character29             nc_size,
    qr.character30             reject,
    qr.character31             repair_fixed,
    qr.vendor_id               vendor_id,
    pv.vendor_name             supplier,
    qr.character32             vendor_sn,
    --qr.character93             code,
    qr.character33             operator_id,
    qr.character34             additional_text,
    qr.character35             escaped_by, ----caused_by_ci
    qr.character36             charge_defect_to_operator, --charge_defect_cqsi
    qp.name                    plan_name,
    to_date(qr.qa_creation_date, 'DD-MON-YY')       creation_date,
    TO_CHAR(qr.qa_creation_date, 'YYYY') creation_year,
    TO_CHAR(qr.qa_creation_date, 'YYYYMM') creation_year_mm,
    TO_CHAR(qr.qa_creation_date, 'MON-YYYY') creation_mon_year,
    bd.department_code         department,
     qresult.character5              wip_insp_result,
     qresult.character8              wip_insp_result_meaning,
     fu.description created_by,
     qr.QA_CREATED_BY 
  
FROM
    qa_results                      qr,
    qa_plans                        qp,
    wip_entities                    we,
    mtl_system_items_b              msik,
    po.po_vendors_obs                    pv, -- ap_suppliers replaced
    qa.qa_pc_results_relationship   pch,
      qa_results               qresult,
    qa_plans                 qresultp,
     bom_departments          bd,
     fnd_user                 fu
WHERE
    qp.name = 'DEFECT DETAILS NSS'
    AND qr.plan_id = qp.plan_id
    AND qp.plan_id = qr.plan_id
    AND qr.wip_entity_id = we.wip_entity_id (+)
    AND qr.item_id = msik.inventory_item_id (+)
    AND qr.organization_id = msik.organization_id (+)
    AND qr.vendor_id = pv.vendor_id (+)
    and FU.USER_ID = Qr.QA_CREATED_BY 
    AND ( qr.status IS NULL
          OR qr.status = 2 )
    AND ( pch.child_plan_id = qr.plan_id (+)
          AND pch.child_occurrence = qr.occurrence (+)
          AND pch.child_collection_id = qr.collection_id (+) )
    AND qr.organization_id IN (
            1213,
        1273
    )
    AND qr.qa_creation_date >= SYSDATE - 365
    -- Added 3/14/23 --
       AND qresultp.name = 'RESULTS RECORDING NSS'
    AND qresultp.plan_id = qresult.plan_id
    AND   pch.parent_plan_id  = qresult.plan_id
    and pch.parent_collection_id   =qresult.collection_id
   AND pch.parent_occurrence = qresult.occurrence
   AND qresult.department_id = bd.department_id

union all

SELECT
    null prr_parent_plan_id,
    null   prr_parent_collection_id,
    null     prr_parent_occurrence,
    null qr_parent_plan_collection_occur_id,
     qr.plan_id,
    qr.occurrence,
    qr.collection_id,
--    qr.plan_id  || '-'     || qr.collection_id    || '-'    || qr.occurrence     plan_collection_occur_ids, -- key for qa_pc_results_relationship
    qr.organization_id,
--    hou.name                 organization_name,

    qr.character1             def_detail_id,
    qr.character2              defect_detail_insp,
    qr.character3              inspector,
    TO_DATE(qr.character4, 'YYYY/MM/DD') inspection_date,
    qr.wip_entity_id,
    we.wip_entity_name         job,
    wj.source_code,
    qr.character8              default_values,
    qr.character9              wip_record_defect_copy,
    qr.from_op_seq_num         from_op_seq_number,
    qr.to_op_seq_num           to_op_seq_number,
    qr.item_id,
    msik.segment1              item,
    msik.INVENTORY_ITEM_STATUS_CODE item_status,
    qr.character6              description,
    qr.character7             revision_nss,
    --qr.character17              bom_revision,
    qr.character10              cr_serial_number,
    to_number(qr.character11) cr_serial_id,
    qr.character90             serial_number_int,
    qr.character13             affected_assembly_material,
    qr.character14              cr_affected_assy_sn,
    to_number(qr.character15) cr_affected_assy_sn_id,
    qr.character16             rework_oper,
    --qr.character11             dt_proc_operation,
    qr.character17             level_revision,
    qr.character18             dt_defect_code,
    qr.character19             dt_defect_code_meaning,
    qr.character20             nss_defect_tracker_ref_des,
    qr.character21             dt_component,
    qr.character22             reference_designator,
    qr.character23             problem_description,
    qr.comment1                problem_description_long,
    qr.comment2                problem_description_hist,
    qr.quantity                quantity,
    qr.character24             dt_caused_by,
    qr.character25             dt_caused_by_description,
    qr.character26             date_code,
    qr.character27             material_affected,
    qr.character28             nc_location,
    qr.character29             nc_size,
    qr.character30             reject,
    qr.character31             repair_fixed,
    qr.vendor_id               vendor_id,
    pv.vendor_name             supplier,
    qr.character32             vendor_sn,
    --qr.character93             code,
    qr.character33             operator_id,
    qr.character34             additional_text,
    qr.character35             escaped_by, ----caused_by_ci
    qr.character36             charge_defect_to_operator, --charge_defect_cqsi
    qp.name                    plan_name,
    to_date(qr.qa_creation_date, 'DD-MON-YY'),   
    TO_CHAR(qr.qa_creation_date, 'YYYY') creation_year,
    TO_CHAR(qr.qa_creation_date, 'YYYYMM') creation_year_mm,
    TO_CHAR(qr.qa_creation_date, 'MON-YYYY') creation_mon_year,

    null        department,
    null        wip_insp_result,
    null        wip_insp_result_meaning,
fu.description created_by,
 qr.QA_CREATED_BY 
 
FROM
    qa_results                      qr,
    qa_plans                        qp,
    wip_entities                    we,
    mtl_system_items_b              msik,
    ap_suppliers                    pv,
    wip_discrete_jobs               wj,
    fnd_user                        fu
WHERE
    qp.name = 'DEFECT DETAILS NSS'
    AND qr.plan_id = qp.plan_id
    AND qp.plan_id = qr.plan_id
    AND qr.wip_entity_id = we.wip_entity_id (+)
    AND qr.item_id = msik.inventory_item_id (+)
    AND qr.organization_id = msik.organization_id (+)
    AND qr.vendor_id = pv.vendor_id (+)
    and wj.wip_entity_id  = qr.wip_entity_id
     and FU.USER_ID = Qr.QA_CREATED_BY 
    and wj.source_code in ('DEPOT_REPAIR') --added to limit data to CRG
    AND ( qr.status IS NULL
          OR qr.status = 2 )
    AND qr.organization_id IN (
            1213,
        1273
    )
    AND qr.qa_creation_date >= SYSDATE - 365
) x