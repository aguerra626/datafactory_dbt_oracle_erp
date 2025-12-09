/********************************************************************************
 * MIDAS Report : Receiving Inspection Reports
 * Report Type #(tab): PBI 
 * PBI Table : RECEIVING_INSPECTION_NSS_TBL_206
 * Database  : USCEBSDG

 * Modification History:
 *-------------------------------------------------------------------------------
 *  ACR#/CR#   Date        By                       Remarks
 *-------------------------------------------------------------------------------
 *  1.0      14-OCT-2022   Bhupendra#(tab)#(tab)#(tab)Based on SQL from Dave Macqueen
 *  1.1      16-JUL-2024    Bhupendra#(tab)#(tab)#(tab)transaction_date truncated, added to_number for orderd_quantity and quantity_defective
 *  1.2      26-AUG-2024   Bhupendra#(tab)#(tab)#(tab)Added qd_po_number_receipt_number, -- to join with receives 8/26/2024
  *  1.3      29-AUG-2024   Bhupendra#(tab)#(tab)#(tab)Added AR_NUMEBR, AR_QUANTITY and NOTIFICATION_STATUS 
 by joining on the HIGHEST CAR_CLOSED_DATE record from ACTION REQUEST_NSS  with join on qd_po_number_receipt_number
  *  1.4     09-SEP-2024   Bhupendra#(tab)#(tab)#(tab)Removed AR join and added rcv_plan_occ_collect_key to join on AR records
 *-------------------------------------------------------------------------------
 plan_id name
 4174#(tab)RECEIVING INSPECTION NSS
 13969  Rows 8/26/2024
 14079  Rows 8/29/24
 14310  Rows 9/9/2024
  ******************************************************************************/
  SELECT /*+ LEADING(qp) USE_NL(qp qr) push_pred(PH) PUSH_PRED(PR) PUSH_PRED(RC)*/
    qr.plan_id,
    qr.occurrence,
    qr.collection_id,
    qr.plan_id
    || '-'
    || qr.occurrence
    || '-'
    || qr.collection_id rcv_plan_occ_collect_key,
    qr.transaction_number,
    qr.comment1       notes,
    qr.character100   quality_document,
    qr.po_header_id,
    ph.segment1       po_number,
    qr.po_line_num    po_line_number,
    qr.receipt_num    po_receipt_number,
    TRIM(qr.character100)
    || '-'
    ||  --  quality_document
        CASE
            WHEN ph.segment1 IS NULL THEN
                NULL
            ELSE
                ph.segment1
                || '-'
            || TRIM(qr.receipt_num)
        END qd_po_number_receipt_number, -- to join with receives 8/26/2024
#(tab)   CASE
        WHEN ph.segment1 IS NULL THEN
            NULL
        ELSE
            ph.segment1
            || '-'
            || TRIM(qr.receipt_num)
    END po_number_receipt_number,
    qr.vendor_id,
    pv.vendor_name    supplier,
    qr.item_id,
    msib.segment1     item,
    qr.character2     item_description, --8/24/2024 updated column name
    qr.revision       revision,
    qr.character3     revision_nss,
    qr.character4     prerelease,
    to_number(qr.character5 DEFAULT 0 ON CONVERSION ERROR) ordered_quantity,
    qr.quantity       quantity,
    qr.character6     uom_name,
    qr.character7     inspection_result,
    to_number(qr.character8 DEFAULT 0 ON CONVERSION ERROR) quantity_defective,
    qr.character9     responsibility,
    qr.character10    comments,
    qr.character11    problem_description,
    trunc(qr.transaction_date) transaction_date,
    TO_CHAR(qr.transaction_date, 'MON-YY') transaction_date_monyy,
    TO_CHAR(qr.transaction_date, 'YYYYMM') transaction_date_yyyymm,
    qr.comment2       material_po_text,
    qr.comment3       vpn_info,
    qr.character13    vpn_occurrence_nss,
    qr.character14    manufacturer_name,
    qr.character15    manufacturer_part_number,
    qr.character16    cage,
    qr.character17    qir_status,
    qr.character18    fai_status,
    qr.character1     rcv_fai_status,
 --   qr.character19               sys_save_allowed,
    qr.character12    reference_request_num,
    qp.name           plan_name,
    qr.organization_id,
    hou.name          organization_name,
    trunc(qr.qa_creation_date) creation_date
    /*----- Unused columns 
       qr.qa_last_update_date       last_update_date,
    qr.qa_last_updated_by        last_updated_by_id,
    fu2.user_name                last_updated_by,
 
    qr.qa_created_by             created_by_id,
    fu.user_name                 created_by,
    qr.last_update_login,
    ---------*/
FROM
    qa_results              qr
    JOIN qa_plans                qp ON qp.plan_id = qr.plan_id
           -- AND qr.plan_id = 5178  ---RECEIVING INSPECTION NSS  9/9/2024
                        AND qp.name = 'RECEIVING INSPECTION NSS'
    JOIN hr_organization_units   hou ON hou.organization_id = qr.organization_id
    LEFT JOIN po_headers_all          ph ON ph.po_header_id = qr.po_header_id
    LEFT JOIN ap_suppliers            pv ON pv.vendor_id = qr.vendor_id
    LEFT JOIN mtl_system_items_b      msib ON msib.inventory_item_id = qr.item_id
                                         AND msib.organization_id = qr.organization_id 
    --  join  fnd_user                fu on  fu.user_id =  qr.qa_created_by
--    join fnd_user                fu2 on fu2.user_id= qr.qa_last_updated_by
WHERE
    1 = 1
    AND ( qr.status IS NULL
          OR qr.status = 2 )
    AND TO_CHAR(qr.creation_date, 'YYYY') >= TO_CHAR(SYSDATE, 'YYYY') - 3 --3 years data
    --and ph.segment1 = '469817'     and qr.receipt_num = '7555'