/********************************************************************************
 * MIDAS Report : PMRB Cycle Time - 169
 * Report Type #(tab): PBI 
 * PBI Table : ACTION_REQUEST_TASK
 * Database  : USCEBSPR

 * Modification History:
 *-------------------------------------------------------------------------------
 *  ACR#/CR#   Date        By                       Remarks
 *-------------------------------------------------------------------------------
 *  1.1      04-OCT-2022   Bhupendra#(tab)#(tab)#(tab)Based on SQL from Dave Macqueen
 *  1.2      10-NOV-2022   Ed Tye       Added 'ON Conversion Error"" to TO_DATE
 *  2.0      09-MAR-2023   Bhupendra#(tab)Modified for Production view#(tab)#(tab)
 *-------------------------------------------------------------------------------
 plan_id name
5161#(tab)ACTION REQUEST TASKS NSS
  ******************************************************************************/
 SELECT /*+ LEADING(qp) USE_NL(qp qr) push_pred(PH) PUSH_PRED(PR) PUSH_PRED(RC)*/
    qp.name               plan_name,
    qr.sequence2          action_request_num,
    qr.plan_id,
    qr.collection_id,
    qr.occurrence,
    qr.character2         task_ar_category, --USe from parent task -- DEV character1 CAR_CATEGORY
    qr.character3         task_ar_category_description, --Use from parent task -- DEV character2 CAR_CATEGORY_DESCRIPTION
    qr.character4         task_code, -- DEV character3
    qr.character5         task_group, -- DEV character4
    qr.character6         task_description, -- DEV character5
    TO_DATE(qr.character7 default NULL on conversion error, 'YYYY/MM/DD') due_date, -- DEV character6
    qr.character8         notification_status, -- DEV character7
    qr.character9         task_status, -- DEV character8
    qr.date_closed        task_date_closed, 
    qr.character10         part_procedure,-- DEV character9
    qr.item_id,
    msik.segment1         item, -- MSIK.CONCATENATED_SEGMENTS   ,     
    qr.character11        non_part_procedure, -- DEV character10
    qr.CHARACTER12        cr_serial_number, -- DEV character11
    qr.character90        serial_number_int, -- DEV character90
    qr.character14        NAMEPLATE_SERIAL_NUMBER,  -- DEV character13
    qr.character15        ar_task_assignment, -- DEV character14
    qr.character16        email_address, -- DEV character15
    qr.character17        send_email, -- DEV character16
    qr.character18        launch_workflow, -- DEV character17
    qr.character19        ar_task_sent, -- DEV character18
    qr.character20        ar_task_response_sent, -- DEV character19
    qr.comment1           subject,
    qr.comment2           notes,
    qr.comment3           comments_information,
    qr.character21        pc_validation, -- DEV character20
    qr.character22        ar_close_status, -- DEV character21
    /*--Not used in Production
#(tab)qr.character22        send_notification_to, -- DEV character22
    qr.character23        entered_by_user, -- DEV character23
    qr.character24        workflow_notification, -- DEV character24
#(tab)--------------*/
    qr.request_status     request_status,
    qr.qa_creation_date   task_creation_date,
    round(
            CASE
            WHEN qr.date_closed IS NULL THEN
                NULL
            ELSE
                qr.date_closed - qr.qa_creation_date
        END, 2) task_processing_days --task_date_closed- qr.qa_creation_date

   
/*-- Not used ---

      qr.qa_last_update_date                     last_update_date,
       qr.qa_last_updated_by                      last_updated_by_id,
       fu2.user_name                              last_updated_by,
       qr.qa_creation_date                        creation_date,
       qr.qa_created_by                           created_by_id,
       fu.user_name                               created_by,
-----------*/
FROM
    qa_results           qr,
    fnd_user             fu,
    fnd_user             fu2,
    qa_plans             qp,
    mtl_system_items_b   msik --MTL_SYSTEM_ITEMS_KF
WHERE
    1 = 1 
  --    AND qp.plan_id = 4170  -- ACTION REQUEST TASKS NSS
    AND qp.name = 'ACTION REQUEST TASKS NSS'
    AND qp.plan_id = qr.plan_id
    AND qr.qa_created_by = fu.user_id
    AND qr.qa_last_updated_by = fu2.user_id
    AND qr.item_id = msik.inventory_item_id (+)
    AND qr.organization_id = msik.organization_id (+)
    AND qr.organization_id = 1213
    AND TO_CHAR(qr.creation_date, 'YYYY') >= TO_CHAR(SYSDATE, 'YYYY') - 3 --3 years data
    AND ( qr.status IS NULL
          OR qr.status = 2 )
          ----------------- Test filters-- 
    --and qr.CHARACTER11 like 'BARBARA%'  --ar_facilitator
  --and qr.CHARACTER7   like 'Supplier%'--          CAR_CATEGORY_DESCRIPTION     
--    AND qr.sequence2 = 'AR00010008' -- like 'AR00010013' --        ACTION_REQUEST_NUM