/********************************************************************************
 * MIDAS Report : PMRB Cycle Time - 169
 * Report Type : PBI 
 * PBI Table : ACTION_REQUEST
 * Database  : USCEBSPR

 * Modification History:
 *-------------------------------------------------------------------------------
 *  ACR#/CR#   Date        By                       Remarks
 *-------------------------------------------------------------------------------
 *  1.1      03-OCT-2022   Bhupendra#(tab)#(tab)#(tab)Based on SQL from Dave Macqueen
 *  1.2      10-NOV-2022   Ed Tye               added 'on conversion error' to TO_DATE 
 *  2.0 #(tab) 09-MAR-2023   Bhupendra#(tab)#(tab)#(tab)Modified for Production view#(tab)#(tab)
 *-------------------------------------------------------------------------------
 plan_id name
3162#(tab)#(tab)ACTION REQUEST NSS   in dev 4169           AR00010013  and AR00010008
  ******************************************************************************/
 
    SELECT /*+ LEADING(qp) USE_NL(qp qr) push_pred(PH) PUSH_PRED(PR) PUSH_PRED(RC)*/
 --          qr.plan_id,     
        qp.name           plan_name,
        qr.sequence2      action_request_num,
        qr.collection_id,
        qr.occurrence,
        qr.transaction_number,
        qr.character100   quality_document,
#(tab)#(tab)qr.character1 #(tab)   EMAIL_ADDRESS, -- Prod  
        qr.character2     ar_task_count, -- DEV character1
        qr.character3     ar_task_closed_count, -- DEV character2
        qr.character4     notification_status, -- DEV character3
        qr.character5     notification_status_display, -- DEV character4
        TO_DATE(qr.character6 default NULL on conversion error, 'YYYY/MM/DD') car_creation_date,
        qr.qa_creation_date ar_creation_date, -- DEV character5
        To_Char(qr.qa_creation_date,'YYYY')  ar_creation_year,
        To_Char(qr.qa_creation_date,'MON')  ar_creation_month,
        To_Char(qr.qa_creation_date,'YYYYMM')  ar_creation_yyyymm,
        To_Char(qr.qa_creation_date,'Mon-yy')  ar_creation_monyy,
               round(   qr.qa_creation_date - TO_DATE(qr.character6 default NULL on conversion error, 'YYYY/MM/DD') ,2) induct_days_creationdt_cardt, 
        qr.character7     car_category, --DEV character6
        qr.character8     car_category_description, -- DEV character7
        TO_DATE(qr.character9 default NULL on conversion error, 'YYYY/MM/DD') due_date, ---- DEV character8
        TO_DATE(qr.character10 default NULL on conversion error, 'YYYY/MM/DD') car_closed_date, ---- DEV character9
        qr.character11    reference_qn, ---- DEV character10
        qr.character12    ar_facilitator, ---- DEV character11
        --qr.character12      severity, ---- DEV character12 not in Prod
        -- qr.character13    ar_severity, ---- DEV character13 not in Prod
        qr.character13    source_id, ---- DEV character14
        qr.character14    root_cause_code, ---- DEV character15
        qr.character15    root_cause_code2, ---- DEV character16
        qr.character16    root_cause_code3, ---- DEV character17
        qr.character17    nss_responsibility,---- DEV character18
        qr.character18    nss_resp_display, ---- DEV character19
        qr.character19    responsibility, ---- DEV character20
        qr.character20    root_cause, ---- DEV character21
        qr.item_id,
        msib.segment1     item,
        qr.character21    description, ---- DEV character22
        qr.character22    revision_nss, ---- DEV character23
        qr.character23    revision_int,  ---- DEV character24
        qr.character24    non_part_procedure, ---- DEV character25
        qr.character25    action_request_validation, ---- DEV character26
        qr.quantity       quantity,
        qr.character26    cr_serial_number, ---- DEV character27
        qr.character27    cr_serial_id, ---- DEV character28
        --qr.character90    serial_number_int, -- Not in prod
        qr.character28    nameplate_serial_number, -- DEV character30
        qr.character29    related_qn_numbers,  -- DEV character31
        qr.character30    obs_cmp_id, --observation_complaint_id,  -- DEV character32
        qr.character31    obs_cmp, --observation_complaint,  -- DEV character33
        qr.character32    obs_cmp_code, --observation_complaint_code,  -- DEV character34
        qr.character33    obs_cmp_desc, --observation_complaint_desc,  -- DEV character35
#(tab)#(tab)qr.character32 || '(' ||  qr.character33 || ')'    obs_cmp_code_desc, --observation_complaint_code_desc,
        qr.character34    subassembly,  -- DEV character36
        qr.character35    sub_assy_description,  -- DEV character37
        qr.character36    sub_assy_rev,  -- DEV character38
        qr.character37    ar_component,  -- DEV character39
        qr.character38    component_description,  -- DEV character40
        qr.character39    comp_rev, -- DEV character41
        qr.character40    problem_summary, -- DEV character42
        qr.comment1       problem, 
        qr.character41    requirements_violated, -- DEV character43
        qr.character42    customer_number_nss,-- DEV character44
        qr.customer_id,
        (
                SELECT
                party.party_name customer
            FROM
                hz_parties         party,
                hz_cust_accounts   cust_acct
            WHERE
                cust_acct.party_id = party.party_id
                AND cust_acct.cust_account_id = qr.customer_id
        ) customer,
        qr.character43    supplier_number, -- DEV character45
        qr.vendor_id, 
        pv.vendor_name    supplier,
        qr.character44    cust_contract_po, -- DEV character46
        qr.character45    customer_contact, -- DEV character47
        TO_DATE(qr.character46 default NULL on conversion error, 'YYYY/MM/DD') original_ship_date, -- DEV character48
        qr.po_header_id,
        ph.segment1       po_number,
        qr.character47    nss_receipt_number, -- DEV character49
        qr.character48      audit_number, -- DEV character50
        qr.character49      ar_audit_type, -- DEV character51
        qr.character50      ar_audit_type_disp, -- DEV character52
        TO_DATE(qr.character51 default NULL on conversion error, 'YYYY/MM/DD') ar_audit_date, -- DEV character53
        qr.character52      ar_auditing_body, -- DEV character54
        qr.request_status   request_status  ,
        qr.character53    num_of_major_findings, -- -- DEV character55 qltdate.any_to_number (qr.CHARACTER55)            NUM_OF_MAJOR_FINDINGS ,
        qr.character54    num_of_minor_findings,-- -- DEV character56 qltdate.any_to_number (qr.CHARACTER56)            NUM_OF_MINOR_FINDINGS ,
        qr.character55    num_of_op_for_improvement, -- -- DEV character57 qltdate.any_to_number (qr.CHARACTER57)            NUM_OF_OP_FOR_IMPROVEMENT ,
        qr.character56    num_of_strengths      -- DEV character58 qltdate.any_to_number (qr.CHARACTER58)            NUM_OF_STRENGTHS 
 ---- Not required  for this report  ------------------
  /*-----

        qr.character57      ar_allow_close, -- DEV character59
        qr.character60      launch_workflow, -- DEV character60 -Not in production
        qr.character61      send_notification_to, -- DEV character61 -Not in production
        qr.character62      entered_by_user, ---- DEV character62-Not in production

       hou.name            organization_name,
        qr.organization_id,
      qr.qa_last_update_date            last_update_date,
       qr.qa_last_updated_by            last_updated_by_id,
       fu2.user_name            last_updated_by,
       qr.qa_created_by            created_by_id,
       fu.user_name            created_by,
       qr.last_update_login,
 -------------------*/
    FROM
        qa_results              qr,
        qa_plans                qp,
 --       fnd_user                fu, --fnd_user_view
 --       fnd_user                fu2, --fnd_user_view
        hr_organization_units   hou,
        mtl_system_items_b      msib, --MTL_SYSTEM_ITEMS_KFV
  --     QA_CUSTOMERS_LOV_V     RC,
        ap_suppliers            pv,
        po_headers_all          ph
    WHERE
        1 = 1
        -- AND qp.plan_id = 3162 -- In Dev 4169
        AND qp.name = 'ACTION REQUEST NSS'
        AND qp.plan_id = qr.plan_id
 --      AND qr.qa_created_by = fu.user_id
--        AND qr.qa_last_updated_by = fu2.user_id
        AND qr.organization_id = hou.organization_id
        AND qr.item_id = msib.inventory_item_id (+)
        AND qr.organization_id = msib.organization_id (+)
   --    AND qr.CUSTOMER_ID = RC.CUSTOMER_ID(+)
        AND qr.vendor_id = pv.vendor_id (+)
        AND qr.po_header_id = ph.po_header_id (+)
        AND qr.organization_id = 1213
        AND TO_CHAR(qr.qa_last_update_date, 'YYYY') >= TO_CHAR(SYSDATE, 'YYYY') - 3 --get last 3 years data
        AND ( qr.status IS NULL
              OR qr.status = 2 )
   ----------------- Test filter
    --and qr.CHARACTER11 like 'BARBARA%'  --ar_facilitator
  --and qr.CHARACTER7   like 'Supplier%'--          CAR_CATEGORY_DESCRIPTION     
  --and        qr.SEQUENCE2     like 'AR00010013' --        NSS_ACTION_REQUEST_NUM 