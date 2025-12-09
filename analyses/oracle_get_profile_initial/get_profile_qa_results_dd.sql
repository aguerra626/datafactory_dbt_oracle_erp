
    
      
select 
'COLLECTION_ID' AS column__name_profiled,
count(COLLECTION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COLLECTION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(COLLECTION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COLLECTION_ID) >0 and count(COLLECTION_ID)/count(*) >.1
    

  union all
    
      
select 
'OCCURRENCE' AS column__name_profiled,
count(OCCURRENCE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(OCCURRENCE) as howmanynulls_count_star_minus_count_non_null,
cast(count(OCCURRENCE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(OCCURRENCE) >0 and count(OCCURRENCE)/count(*) >.1
    

  union all
    
      
select 
'LAST_UPDATE_DATE' AS column__name_profiled,
count(LAST_UPDATE_DATE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(LAST_UPDATE_DATE) as howmanynulls_count_star_minus_count_non_null,
cast(count(LAST_UPDATE_DATE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(LAST_UPDATE_DATE) >0 and count(LAST_UPDATE_DATE)/count(*) >.1
    

  union all
    
      
select 
'QA_LAST_UPDATE_DATE' AS column__name_profiled,
count(QA_LAST_UPDATE_DATE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(QA_LAST_UPDATE_DATE) as howmanynulls_count_star_minus_count_non_null,
cast(count(QA_LAST_UPDATE_DATE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(QA_LAST_UPDATE_DATE) >0 and count(QA_LAST_UPDATE_DATE)/count(*) >.1
    

  union all
    
      
select 
'LAST_UPDATED_BY' AS column__name_profiled,
count(LAST_UPDATED_BY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(LAST_UPDATED_BY) as howmanynulls_count_star_minus_count_non_null,
cast(count(LAST_UPDATED_BY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(LAST_UPDATED_BY) >0 and count(LAST_UPDATED_BY)/count(*) >.1
    

  union all
    
      
select 
'QA_LAST_UPDATED_BY' AS column__name_profiled,
count(QA_LAST_UPDATED_BY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(QA_LAST_UPDATED_BY) as howmanynulls_count_star_minus_count_non_null,
cast(count(QA_LAST_UPDATED_BY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(QA_LAST_UPDATED_BY) >0 and count(QA_LAST_UPDATED_BY)/count(*) >.1
    

  union all
    
      
select 
'CREATION_DATE' AS column__name_profiled,
count(CREATION_DATE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CREATION_DATE) as howmanynulls_count_star_minus_count_non_null,
cast(count(CREATION_DATE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CREATION_DATE) >0 and count(CREATION_DATE)/count(*) >.1
    

  union all
    
      
select 
'QA_CREATION_DATE' AS column__name_profiled,
count(QA_CREATION_DATE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(QA_CREATION_DATE) as howmanynulls_count_star_minus_count_non_null,
cast(count(QA_CREATION_DATE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(QA_CREATION_DATE) >0 and count(QA_CREATION_DATE)/count(*) >.1
    

  union all
    
      
select 
'CREATED_BY' AS column__name_profiled,
count(CREATED_BY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CREATED_BY) as howmanynulls_count_star_minus_count_non_null,
cast(count(CREATED_BY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CREATED_BY) >0 and count(CREATED_BY)/count(*) >.1
    

  union all
    
      
select 
'QA_CREATED_BY' AS column__name_profiled,
count(QA_CREATED_BY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(QA_CREATED_BY) as howmanynulls_count_star_minus_count_non_null,
cast(count(QA_CREATED_BY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(QA_CREATED_BY) >0 and count(QA_CREATED_BY)/count(*) >.1
    

  union all
    
      
select 
'LAST_UPDATE_LOGIN' AS column__name_profiled,
count(LAST_UPDATE_LOGIN) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(LAST_UPDATE_LOGIN) as howmanynulls_count_star_minus_count_non_null,
cast(count(LAST_UPDATE_LOGIN)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(LAST_UPDATE_LOGIN) >0 and count(LAST_UPDATE_LOGIN)/count(*) >.1
    

  union all
    
      
select 
'REQUEST_ID' AS column__name_profiled,
count(REQUEST_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(REQUEST_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(REQUEST_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(REQUEST_ID) >0 and count(REQUEST_ID)/count(*) >.1
    

  union all
    
      
select 
'PROGRAM_APPLICATION_ID' AS column__name_profiled,
count(PROGRAM_APPLICATION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROGRAM_APPLICATION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROGRAM_APPLICATION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROGRAM_APPLICATION_ID) >0 and count(PROGRAM_APPLICATION_ID)/count(*) >.1
    

  union all
    
      
select 
'PROGRAM_ID' AS column__name_profiled,
count(PROGRAM_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROGRAM_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROGRAM_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROGRAM_ID) >0 and count(PROGRAM_ID)/count(*) >.1
    

  union all
    
      
select 
'PROGRAM_UPDATE_DATE' AS column__name_profiled,
count(PROGRAM_UPDATE_DATE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROGRAM_UPDATE_DATE) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROGRAM_UPDATE_DATE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROGRAM_UPDATE_DATE) >0 and count(PROGRAM_UPDATE_DATE)/count(*) >.1
    

  union all
    
      
select 
'TRANSACTION_NUMBER' AS column__name_profiled,
count(TRANSACTION_NUMBER) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TRANSACTION_NUMBER) as howmanynulls_count_star_minus_count_non_null,
cast(count(TRANSACTION_NUMBER)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TRANSACTION_NUMBER) >0 and count(TRANSACTION_NUMBER)/count(*) >.1
    

  union all
    
      
select 
'TXN_HEADER_ID' AS column__name_profiled,
count(TXN_HEADER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TXN_HEADER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(TXN_HEADER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TXN_HEADER_ID) >0 and count(TXN_HEADER_ID)/count(*) >.1
    

  union all
    
      
select 
'ORGANIZATION_ID' AS column__name_profiled,
count(ORGANIZATION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(ORGANIZATION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(ORGANIZATION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(ORGANIZATION_ID) >0 and count(ORGANIZATION_ID)/count(*) >.1
    

  union all
    
      
select 
'PLAN_ID' AS column__name_profiled,
count(PLAN_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PLAN_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PLAN_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PLAN_ID) >0 and count(PLAN_ID)/count(*) >.1
    

  union all
    
      
select 
'SPEC_ID' AS column__name_profiled,
count(SPEC_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SPEC_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(SPEC_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SPEC_ID) >0 and count(SPEC_ID)/count(*) >.1
    

  union all
    
      
select 
'TRANSACTION_ID' AS column__name_profiled,
count(TRANSACTION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TRANSACTION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(TRANSACTION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TRANSACTION_ID) >0 and count(TRANSACTION_ID)/count(*) >.1
    

  union all
    
      
select 
'DEPARTMENT_ID' AS column__name_profiled,
count(DEPARTMENT_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DEPARTMENT_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(DEPARTMENT_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DEPARTMENT_ID) >0 and count(DEPARTMENT_ID)/count(*) >.1
    

  union all
    
      
select 
'TO_DEPARTMENT_ID' AS column__name_profiled,
count(TO_DEPARTMENT_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TO_DEPARTMENT_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(TO_DEPARTMENT_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TO_DEPARTMENT_ID) >0 and count(TO_DEPARTMENT_ID)/count(*) >.1
    

  union all
    
      
select 
'RESOURCE_ID' AS column__name_profiled,
count(RESOURCE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(RESOURCE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(RESOURCE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(RESOURCE_ID) >0 and count(RESOURCE_ID)/count(*) >.1
    

  union all
    
      
select 
'QUANTITY' AS column__name_profiled,
count(QUANTITY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(QUANTITY) as howmanynulls_count_star_minus_count_non_null,
cast(count(QUANTITY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(QUANTITY) >0 and count(QUANTITY)/count(*) >.1
    

  union all
    
      
select 
'ITEM_ID' AS column__name_profiled,
count(ITEM_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(ITEM_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(ITEM_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(ITEM_ID) >0 and count(ITEM_ID)/count(*) >.1
    

  union all
    
      
select 
'UOM' AS column__name_profiled,
count(UOM) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(UOM) as howmanynulls_count_star_minus_count_non_null,
cast(count(UOM)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(UOM) >0 and count(UOM)/count(*) >.1

  union all
    
      
select 
'REVISION' AS column__name_profiled,
count(REVISION) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(REVISION) as howmanynulls_count_star_minus_count_non_null,
cast(count(REVISION)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(REVISION) >0 and count(REVISION)/count(*) >.1

  union all
    
      
select 
'SUBINVENTORY' AS column__name_profiled,
count(SUBINVENTORY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SUBINVENTORY) as howmanynulls_count_star_minus_count_non_null,
cast(count(SUBINVENTORY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SUBINVENTORY) >0 and count(SUBINVENTORY)/count(*) >.1

  union all
    
      
select 
'LOCATOR_ID' AS column__name_profiled,
count(LOCATOR_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(LOCATOR_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(LOCATOR_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(LOCATOR_ID) >0 and count(LOCATOR_ID)/count(*) >.1
    

  union all
    
      
select 
'LOT_NUMBER' AS column__name_profiled,
count(LOT_NUMBER) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(LOT_NUMBER) as howmanynulls_count_star_minus_count_non_null,
cast(count(LOT_NUMBER)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(LOT_NUMBER) >0 and count(LOT_NUMBER)/count(*) >.1

  union all
    
      
select 
'SERIAL_NUMBER' AS column__name_profiled,
count(SERIAL_NUMBER) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SERIAL_NUMBER) as howmanynulls_count_star_minus_count_non_null,
cast(count(SERIAL_NUMBER)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SERIAL_NUMBER) >0 and count(SERIAL_NUMBER)/count(*) >.1

  union all
    
      
select 
'COMP_ITEM_ID' AS column__name_profiled,
count(COMP_ITEM_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMP_ITEM_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMP_ITEM_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMP_ITEM_ID) >0 and count(COMP_ITEM_ID)/count(*) >.1
    

  union all
    
      
select 
'COMP_UOM' AS column__name_profiled,
count(COMP_UOM) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMP_UOM) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMP_UOM)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMP_UOM) >0 and count(COMP_UOM)/count(*) >.1

  union all
    
      
select 
'COMP_REVISION' AS column__name_profiled,
count(COMP_REVISION) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMP_REVISION) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMP_REVISION)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMP_REVISION) >0 and count(COMP_REVISION)/count(*) >.1

  union all
    
      
select 
'COMP_SUBINVENTORY' AS column__name_profiled,
count(COMP_SUBINVENTORY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMP_SUBINVENTORY) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMP_SUBINVENTORY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMP_SUBINVENTORY) >0 and count(COMP_SUBINVENTORY)/count(*) >.1

  union all
    
      
select 
'COMP_LOCATOR_ID' AS column__name_profiled,
count(COMP_LOCATOR_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMP_LOCATOR_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMP_LOCATOR_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMP_LOCATOR_ID) >0 and count(COMP_LOCATOR_ID)/count(*) >.1
    

  union all
    
      
select 
'COMP_LOT_NUMBER' AS column__name_profiled,
count(COMP_LOT_NUMBER) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMP_LOT_NUMBER) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMP_LOT_NUMBER)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMP_LOT_NUMBER) >0 and count(COMP_LOT_NUMBER)/count(*) >.1

  union all
    
      
select 
'COMP_SERIAL_NUMBER' AS column__name_profiled,
count(COMP_SERIAL_NUMBER) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMP_SERIAL_NUMBER) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMP_SERIAL_NUMBER)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMP_SERIAL_NUMBER) >0 and count(COMP_SERIAL_NUMBER)/count(*) >.1

  union all
    
      
select 
'WIP_ENTITY_ID' AS column__name_profiled,
count(WIP_ENTITY_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(WIP_ENTITY_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(WIP_ENTITY_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(WIP_ENTITY_ID) >0 and count(WIP_ENTITY_ID)/count(*) >.1
    

  union all
    
      
select 
'LINE_ID' AS column__name_profiled,
count(LINE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(LINE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(LINE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(LINE_ID) >0 and count(LINE_ID)/count(*) >.1
    

  union all
    
      
select 
'TO_OP_SEQ_NUM' AS column__name_profiled,
count(TO_OP_SEQ_NUM) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TO_OP_SEQ_NUM) as howmanynulls_count_star_minus_count_non_null,
cast(count(TO_OP_SEQ_NUM)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TO_OP_SEQ_NUM) >0 and count(TO_OP_SEQ_NUM)/count(*) >.1
    

  union all
    
      
select 
'FROM_OP_SEQ_NUM' AS column__name_profiled,
count(FROM_OP_SEQ_NUM) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(FROM_OP_SEQ_NUM) as howmanynulls_count_star_minus_count_non_null,
cast(count(FROM_OP_SEQ_NUM)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(FROM_OP_SEQ_NUM) >0 and count(FROM_OP_SEQ_NUM)/count(*) >.1
    

  union all
    
      
select 
'VENDOR_ID' AS column__name_profiled,
count(VENDOR_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(VENDOR_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(VENDOR_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(VENDOR_ID) >0 and count(VENDOR_ID)/count(*) >.1
    

  union all
    
      
select 
'RECEIPT_NUM' AS column__name_profiled,
count(RECEIPT_NUM) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(RECEIPT_NUM) as howmanynulls_count_star_minus_count_non_null,
cast(count(RECEIPT_NUM)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(RECEIPT_NUM) >0 and count(RECEIPT_NUM)/count(*) >.1

  union all
    
      
select 
'PO_HEADER_ID' AS column__name_profiled,
count(PO_HEADER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PO_HEADER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PO_HEADER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PO_HEADER_ID) >0 and count(PO_HEADER_ID)/count(*) >.1
    

  union all
    
      
select 
'PO_RELEASE_ID' AS column__name_profiled,
count(PO_RELEASE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PO_RELEASE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PO_RELEASE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PO_RELEASE_ID) >0 and count(PO_RELEASE_ID)/count(*) >.1
    

  union all
    
      
select 
'PO_LINE_NUM' AS column__name_profiled,
count(PO_LINE_NUM) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PO_LINE_NUM) as howmanynulls_count_star_minus_count_non_null,
cast(count(PO_LINE_NUM)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PO_LINE_NUM) >0 and count(PO_LINE_NUM)/count(*) >.1

  union all
    
      
select 
'PO_SHIPMENT_NUM' AS column__name_profiled,
count(PO_SHIPMENT_NUM) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PO_SHIPMENT_NUM) as howmanynulls_count_star_minus_count_non_null,
cast(count(PO_SHIPMENT_NUM)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PO_SHIPMENT_NUM) >0 and count(PO_SHIPMENT_NUM)/count(*) >.1
    

  union all
    
      
select 
'CUSTOMER_ID' AS column__name_profiled,
count(CUSTOMER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CUSTOMER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(CUSTOMER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CUSTOMER_ID) >0 and count(CUSTOMER_ID)/count(*) >.1
    

  union all
    
      
select 
'SO_HEADER_ID' AS column__name_profiled,
count(SO_HEADER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SO_HEADER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(SO_HEADER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SO_HEADER_ID) >0 and count(SO_HEADER_ID)/count(*) >.1
    

  union all
    
      
select 
'RMA_HEADER_ID' AS column__name_profiled,
count(RMA_HEADER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(RMA_HEADER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(RMA_HEADER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(RMA_HEADER_ID) >0 and count(RMA_HEADER_ID)/count(*) >.1
    

  union all
    
      
select 
'PROJECT_ID' AS column__name_profiled,
count(PROJECT_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROJECT_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROJECT_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROJECT_ID) >0 and count(PROJECT_ID)/count(*) >.1
    

  union all
    
      
select 
'TASK_ID' AS column__name_profiled,
count(TASK_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TASK_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(TASK_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TASK_ID) >0 and count(TASK_ID)/count(*) >.1
    

  union all
    
      
select 
'STATUS' AS column__name_profiled,
count(STATUS) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(STATUS) as howmanynulls_count_star_minus_count_non_null,
cast(count(STATUS)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(STATUS) >0 and count(STATUS)/count(*) >.1
    

  union all
    
      
select 
'TRANSACTION_DATE' AS column__name_profiled,
count(TRANSACTION_DATE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TRANSACTION_DATE) as howmanynulls_count_star_minus_count_non_null,
cast(count(TRANSACTION_DATE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TRANSACTION_DATE) >0 and count(TRANSACTION_DATE)/count(*) >.1
    

  union all
    
      
select 
'CHARACTER1' AS column__name_profiled,
count(CHARACTER1) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER1) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER1)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER1) >0 and count(CHARACTER1)/count(*) >.1

  union all
    
      
select 
'CHARACTER2' AS column__name_profiled,
count(CHARACTER2) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER2) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER2)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER2) >0 and count(CHARACTER2)/count(*) >.1

  union all
    
      
select 
'CHARACTER3' AS column__name_profiled,
count(CHARACTER3) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER3) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER3)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER3) >0 and count(CHARACTER3)/count(*) >.1

  union all
    
      
select 
'CHARACTER4' AS column__name_profiled,
count(CHARACTER4) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER4) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER4)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER4) >0 and count(CHARACTER4)/count(*) >.1

  union all
    
      
select 
'CHARACTER5' AS column__name_profiled,
count(CHARACTER5) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER5) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER5)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER5) >0 and count(CHARACTER5)/count(*) >.1

  union all
    
      
select 
'CHARACTER6' AS column__name_profiled,
count(CHARACTER6) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER6) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER6)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER6) >0 and count(CHARACTER6)/count(*) >.1

  union all
    
      
select 
'CHARACTER7' AS column__name_profiled,
count(CHARACTER7) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER7) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER7)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER7) >0 and count(CHARACTER7)/count(*) >.1

  union all
    
      
select 
'CHARACTER8' AS column__name_profiled,
count(CHARACTER8) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER8) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER8)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER8) >0 and count(CHARACTER8)/count(*) >.1

  union all
    
      
select 
'CHARACTER9' AS column__name_profiled,
count(CHARACTER9) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER9) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER9)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER9) >0 and count(CHARACTER9)/count(*) >.1

  union all
    
      
select 
'CHARACTER10' AS column__name_profiled,
count(CHARACTER10) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER10) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER10)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER10) >0 and count(CHARACTER10)/count(*) >.1

  union all
    
      
select 
'CHARACTER11' AS column__name_profiled,
count(CHARACTER11) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER11) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER11)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER11) >0 and count(CHARACTER11)/count(*) >.1

  union all
    
      
select 
'CHARACTER12' AS column__name_profiled,
count(CHARACTER12) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER12) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER12)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER12) >0 and count(CHARACTER12)/count(*) >.1

  union all
    
      
select 
'CHARACTER13' AS column__name_profiled,
count(CHARACTER13) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER13) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER13)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER13) >0 and count(CHARACTER13)/count(*) >.1

  union all
    
      
select 
'CHARACTER14' AS column__name_profiled,
count(CHARACTER14) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER14) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER14)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER14) >0 and count(CHARACTER14)/count(*) >.1

  union all
    
      
select 
'CHARACTER15' AS column__name_profiled,
count(CHARACTER15) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER15) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER15)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER15) >0 and count(CHARACTER15)/count(*) >.1

  union all
    
      
select 
'CHARACTER16' AS column__name_profiled,
count(CHARACTER16) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER16) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER16)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER16) >0 and count(CHARACTER16)/count(*) >.1

  union all
    
      
select 
'CHARACTER17' AS column__name_profiled,
count(CHARACTER17) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER17) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER17)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER17) >0 and count(CHARACTER17)/count(*) >.1

  union all
    
      
select 
'CHARACTER18' AS column__name_profiled,
count(CHARACTER18) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER18) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER18)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER18) >0 and count(CHARACTER18)/count(*) >.1

  union all
    
      
select 
'CHARACTER19' AS column__name_profiled,
count(CHARACTER19) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER19) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER19)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER19) >0 and count(CHARACTER19)/count(*) >.1

  union all
    
      
select 
'CHARACTER20' AS column__name_profiled,
count(CHARACTER20) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER20) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER20)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER20) >0 and count(CHARACTER20)/count(*) >.1

  union all
    
      
select 
'CHARACTER21' AS column__name_profiled,
count(CHARACTER21) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER21) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER21)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER21) >0 and count(CHARACTER21)/count(*) >.1

  union all
    
      
select 
'CHARACTER22' AS column__name_profiled,
count(CHARACTER22) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER22) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER22)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER22) >0 and count(CHARACTER22)/count(*) >.1

  union all
    
      
select 
'CHARACTER23' AS column__name_profiled,
count(CHARACTER23) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER23) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER23)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER23) >0 and count(CHARACTER23)/count(*) >.1

  union all
    
      
select 
'CHARACTER24' AS column__name_profiled,
count(CHARACTER24) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER24) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER24)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER24) >0 and count(CHARACTER24)/count(*) >.1

  union all
    
      
select 
'CHARACTER25' AS column__name_profiled,
count(CHARACTER25) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER25) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER25)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER25) >0 and count(CHARACTER25)/count(*) >.1

  union all
    
      
select 
'CHARACTER26' AS column__name_profiled,
count(CHARACTER26) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER26) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER26)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER26) >0 and count(CHARACTER26)/count(*) >.1

  union all
    
      
select 
'CHARACTER27' AS column__name_profiled,
count(CHARACTER27) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER27) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER27)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER27) >0 and count(CHARACTER27)/count(*) >.1

  union all
    
      
select 
'CHARACTER28' AS column__name_profiled,
count(CHARACTER28) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER28) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER28)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER28) >0 and count(CHARACTER28)/count(*) >.1

  union all
    
      
select 
'CHARACTER29' AS column__name_profiled,
count(CHARACTER29) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER29) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER29)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER29) >0 and count(CHARACTER29)/count(*) >.1

  union all
    
      
select 
'CHARACTER30' AS column__name_profiled,
count(CHARACTER30) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER30) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER30)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER30) >0 and count(CHARACTER30)/count(*) >.1

  union all
    
      
select 
'CHARACTER31' AS column__name_profiled,
count(CHARACTER31) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER31) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER31)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER31) >0 and count(CHARACTER31)/count(*) >.1

  union all
    
      
select 
'CHARACTER32' AS column__name_profiled,
count(CHARACTER32) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER32) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER32)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER32) >0 and count(CHARACTER32)/count(*) >.1

  union all
    
      
select 
'CHARACTER33' AS column__name_profiled,
count(CHARACTER33) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER33) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER33)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER33) >0 and count(CHARACTER33)/count(*) >.1

  union all
    
      
select 
'CHARACTER34' AS column__name_profiled,
count(CHARACTER34) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER34) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER34)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER34) >0 and count(CHARACTER34)/count(*) >.1

  union all
    
      
select 
'CHARACTER35' AS column__name_profiled,
count(CHARACTER35) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER35) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER35)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER35) >0 and count(CHARACTER35)/count(*) >.1

  union all
    
      
select 
'CHARACTER36' AS column__name_profiled,
count(CHARACTER36) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER36) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER36)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER36) >0 and count(CHARACTER36)/count(*) >.1

  union all
    
      
select 
'CHARACTER37' AS column__name_profiled,
count(CHARACTER37) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER37) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER37)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER37) >0 and count(CHARACTER37)/count(*) >.1

  union all
    
      
select 
'CHARACTER38' AS column__name_profiled,
count(CHARACTER38) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER38) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER38)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER38) >0 and count(CHARACTER38)/count(*) >.1

  union all
    
      
select 
'CHARACTER39' AS column__name_profiled,
count(CHARACTER39) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER39) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER39)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER39) >0 and count(CHARACTER39)/count(*) >.1

  union all
    
      
select 
'CHARACTER40' AS column__name_profiled,
count(CHARACTER40) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER40) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER40)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER40) >0 and count(CHARACTER40)/count(*) >.1

  union all
    
      
select 
'CHARACTER41' AS column__name_profiled,
count(CHARACTER41) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER41) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER41)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER41) >0 and count(CHARACTER41)/count(*) >.1

  union all
    
      
select 
'CHARACTER42' AS column__name_profiled,
count(CHARACTER42) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER42) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER42)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER42) >0 and count(CHARACTER42)/count(*) >.1

  union all
    
      
select 
'REPAIR_LINE_ID' AS column__name_profiled,
count(REPAIR_LINE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(REPAIR_LINE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(REPAIR_LINE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(REPAIR_LINE_ID) >0 and count(REPAIR_LINE_ID)/count(*) >.1
    

  union all
    
      
select 
'JTF_TASK_ID' AS column__name_profiled,
count(JTF_TASK_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(JTF_TASK_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(JTF_TASK_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(JTF_TASK_ID) >0 and count(JTF_TASK_ID)/count(*) >.1
    

  union all
    
      
select 
'ASSET_INSTANCE_ID' AS column__name_profiled,
count(ASSET_INSTANCE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(ASSET_INSTANCE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(ASSET_INSTANCE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(ASSET_INSTANCE_ID) >0 and count(ASSET_INSTANCE_ID)/count(*) >.1
    

  union all
    
      
select 
'PROCESS_BATCH_ID' AS column__name_profiled,
count(PROCESS_BATCH_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROCESS_BATCH_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROCESS_BATCH_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROCESS_BATCH_ID) >0 and count(PROCESS_BATCH_ID)/count(*) >.1
    

  union all
    
      
select 
'PROCESS_BATCHSTEP_ID' AS column__name_profiled,
count(PROCESS_BATCHSTEP_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROCESS_BATCHSTEP_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROCESS_BATCHSTEP_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROCESS_BATCHSTEP_ID) >0 and count(PROCESS_BATCHSTEP_ID)/count(*) >.1
    

  union all
    
      
select 
'PROCESS_OPERATION_ID' AS column__name_profiled,
count(PROCESS_OPERATION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROCESS_OPERATION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROCESS_OPERATION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROCESS_OPERATION_ID) >0 and count(PROCESS_OPERATION_ID)/count(*) >.1
    

  union all
    
      
select 
'PROCESS_ACTIVITY_ID' AS column__name_profiled,
count(PROCESS_ACTIVITY_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROCESS_ACTIVITY_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROCESS_ACTIVITY_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROCESS_ACTIVITY_ID) >0 and count(PROCESS_ACTIVITY_ID)/count(*) >.1
    

  union all
    
      
select 
'PROCESS_RESOURCE_ID' AS column__name_profiled,
count(PROCESS_RESOURCE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROCESS_RESOURCE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROCESS_RESOURCE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROCESS_RESOURCE_ID) >0 and count(PROCESS_RESOURCE_ID)/count(*) >.1
    

  union all
    
      
select 
'PROCESS_PARAMETER_ID' AS column__name_profiled,
count(PROCESS_PARAMETER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PROCESS_PARAMETER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PROCESS_PARAMETER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PROCESS_PARAMETER_ID) >0 and count(PROCESS_PARAMETER_ID)/count(*) >.1
    

  union all
    
      
select 
'NONCONFORM_PRIORITY' AS column__name_profiled,
count(NONCONFORM_PRIORITY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(NONCONFORM_PRIORITY) as howmanynulls_count_star_minus_count_non_null,
cast(count(NONCONFORM_PRIORITY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(NONCONFORM_PRIORITY) >0 and count(NONCONFORM_PRIORITY)/count(*) >.1

  union all
    
      
select 
'NONCONFORMANCE_TYPE' AS column__name_profiled,
count(NONCONFORMANCE_TYPE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(NONCONFORMANCE_TYPE) as howmanynulls_count_star_minus_count_non_null,
cast(count(NONCONFORMANCE_TYPE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(NONCONFORMANCE_TYPE) >0 and count(NONCONFORMANCE_TYPE)/count(*) >.1

  union all
    
      
select 
'NONCONFORMANCE_CODE' AS column__name_profiled,
count(NONCONFORMANCE_CODE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(NONCONFORMANCE_CODE) as howmanynulls_count_star_minus_count_non_null,
cast(count(NONCONFORMANCE_CODE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(NONCONFORMANCE_CODE) >0 and count(NONCONFORMANCE_CODE)/count(*) >.1

  union all
    
      
select 
'DATE_OPENED' AS column__name_profiled,
count(DATE_OPENED) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DATE_OPENED) as howmanynulls_count_star_minus_count_non_null,
cast(count(DATE_OPENED)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DATE_OPENED) >0 and count(DATE_OPENED)/count(*) >.1
    

  union all
    
      
select 
'DATE_CLOSED' AS column__name_profiled,
count(DATE_CLOSED) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DATE_CLOSED) as howmanynulls_count_star_minus_count_non_null,
cast(count(DATE_CLOSED)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DATE_CLOSED) >0 and count(DATE_CLOSED)/count(*) >.1
    

  union all
    
      
select 
'DAYS_TO_CLOSE' AS column__name_profiled,
count(DAYS_TO_CLOSE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DAYS_TO_CLOSE) as howmanynulls_count_star_minus_count_non_null,
cast(count(DAYS_TO_CLOSE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DAYS_TO_CLOSE) >0 and count(DAYS_TO_CLOSE)/count(*) >.1
    

  union all
    
      
select 
'TO_SUBINVENTORY' AS column__name_profiled,
count(TO_SUBINVENTORY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TO_SUBINVENTORY) as howmanynulls_count_star_minus_count_non_null,
cast(count(TO_SUBINVENTORY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TO_SUBINVENTORY) >0 and count(TO_SUBINVENTORY)/count(*) >.1

  union all
    
      
select 
'TO_LOCATOR_ID' AS column__name_profiled,
count(TO_LOCATOR_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(TO_LOCATOR_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(TO_LOCATOR_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(TO_LOCATOR_ID) >0 and count(TO_LOCATOR_ID)/count(*) >.1
    

  union all
    
      
select 
'BILL_REFERENCE_ID' AS column__name_profiled,
count(BILL_REFERENCE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(BILL_REFERENCE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(BILL_REFERENCE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(BILL_REFERENCE_ID) >0 and count(BILL_REFERENCE_ID)/count(*) >.1
    

  union all
    
      
select 
'ROUTING_REFERENCE_ID' AS column__name_profiled,
count(ROUTING_REFERENCE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(ROUTING_REFERENCE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(ROUTING_REFERENCE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(ROUTING_REFERENCE_ID) >0 and count(ROUTING_REFERENCE_ID)/count(*) >.1
    

  union all
    
      
select 
'CONCURRENT_REQUEST_ID' AS column__name_profiled,
count(CONCURRENT_REQUEST_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CONCURRENT_REQUEST_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(CONCURRENT_REQUEST_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CONCURRENT_REQUEST_ID) >0 and count(CONCURRENT_REQUEST_ID)/count(*) >.1
    

  union all
    
      
select 
'LOT_STATUS_ID' AS column__name_profiled,
count(LOT_STATUS_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(LOT_STATUS_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(LOT_STATUS_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(LOT_STATUS_ID) >0 and count(LOT_STATUS_ID)/count(*) >.1
    

  union all
    
      
select 
'SERIAL_STATUS_ID' AS column__name_profiled,
count(SERIAL_STATUS_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SERIAL_STATUS_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(SERIAL_STATUS_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SERIAL_STATUS_ID) >0 and count(SERIAL_STATUS_ID)/count(*) >.1
    

  union all
    
      
select 
'NONCONFORMANCE_STATUS' AS column__name_profiled,
count(NONCONFORMANCE_STATUS) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(NONCONFORMANCE_STATUS) as howmanynulls_count_star_minus_count_non_null,
cast(count(NONCONFORMANCE_STATUS)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(NONCONFORMANCE_STATUS) >0 and count(NONCONFORMANCE_STATUS)/count(*) >.1

  union all
    
      
select 
'RCV_TRANSACTION_ID' AS column__name_profiled,
count(RCV_TRANSACTION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(RCV_TRANSACTION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(RCV_TRANSACTION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(RCV_TRANSACTION_ID) >0 and count(RCV_TRANSACTION_ID)/count(*) >.1
    

  union all
    
      
select 
'REQUEST_STATUS' AS column__name_profiled,
count(REQUEST_STATUS) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(REQUEST_STATUS) as howmanynulls_count_star_minus_count_non_null,
cast(count(REQUEST_STATUS)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(REQUEST_STATUS) >0 and count(REQUEST_STATUS)/count(*) >.1

  union all
    
      
select 
'REQUEST_SOURCE' AS column__name_profiled,
count(REQUEST_SOURCE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(REQUEST_SOURCE) as howmanynulls_count_star_minus_count_non_null,
cast(count(REQUEST_SOURCE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(REQUEST_SOURCE) >0 and count(REQUEST_SOURCE)/count(*) >.1

  union all
    
      
select 
'REQUEST_PRIORITY' AS column__name_profiled,
count(REQUEST_PRIORITY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(REQUEST_PRIORITY) as howmanynulls_count_star_minus_count_non_null,
cast(count(REQUEST_PRIORITY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(REQUEST_PRIORITY) >0 and count(REQUEST_PRIORITY)/count(*) >.1

  union all
    
      
select 
'REQUEST_SEVERITY' AS column__name_profiled,
count(REQUEST_SEVERITY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(REQUEST_SEVERITY) as howmanynulls_count_star_minus_count_non_null,
cast(count(REQUEST_SEVERITY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(REQUEST_SEVERITY) >0 and count(REQUEST_SEVERITY)/count(*) >.1

  union all
    
      
select 
'ECO_NAME' AS column__name_profiled,
count(ECO_NAME) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(ECO_NAME) as howmanynulls_count_star_minus_count_non_null,
cast(count(ECO_NAME)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(ECO_NAME) >0 and count(ECO_NAME)/count(*) >.1

  union all
    
      
select 
'FOLLOWUP_ACTIVITY_ID' AS column__name_profiled,
count(FOLLOWUP_ACTIVITY_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(FOLLOWUP_ACTIVITY_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(FOLLOWUP_ACTIVITY_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(FOLLOWUP_ACTIVITY_ID) >0 and count(FOLLOWUP_ACTIVITY_ID)/count(*) >.1
    

  union all
    
      
select 
'XFR_LPN_ID' AS column__name_profiled,
count(XFR_LPN_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(XFR_LPN_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(XFR_LPN_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(XFR_LPN_ID) >0 and count(XFR_LPN_ID)/count(*) >.1
    

  union all
    
      
select 
'CHARACTER43' AS column__name_profiled,
count(CHARACTER43) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER43) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER43)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER43) >0 and count(CHARACTER43)/count(*) >.1

  union all
    
      
select 
'CHARACTER44' AS column__name_profiled,
count(CHARACTER44) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER44) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER44)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER44) >0 and count(CHARACTER44)/count(*) >.1

  union all
    
      
select 
'CHARACTER45' AS column__name_profiled,
count(CHARACTER45) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER45) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER45)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER45) >0 and count(CHARACTER45)/count(*) >.1

  union all
    
      
select 
'CHARACTER46' AS column__name_profiled,
count(CHARACTER46) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER46) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER46)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER46) >0 and count(CHARACTER46)/count(*) >.1

  union all
    
      
select 
'CHARACTER47' AS column__name_profiled,
count(CHARACTER47) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER47) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER47)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER47) >0 and count(CHARACTER47)/count(*) >.1

  union all
    
      
select 
'CHARACTER48' AS column__name_profiled,
count(CHARACTER48) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER48) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER48)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER48) >0 and count(CHARACTER48)/count(*) >.1

  union all
    
      
select 
'CHARACTER49' AS column__name_profiled,
count(CHARACTER49) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER49) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER49)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER49) >0 and count(CHARACTER49)/count(*) >.1

  union all
    
      
select 
'CHARACTER50' AS column__name_profiled,
count(CHARACTER50) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER50) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER50)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER50) >0 and count(CHARACTER50)/count(*) >.1

  union all
    
      
select 
'CHARACTER51' AS column__name_profiled,
count(CHARACTER51) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER51) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER51)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER51) >0 and count(CHARACTER51)/count(*) >.1

  union all
    
      
select 
'CHARACTER52' AS column__name_profiled,
count(CHARACTER52) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER52) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER52)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER52) >0 and count(CHARACTER52)/count(*) >.1

  union all
    
      
select 
'CHARACTER53' AS column__name_profiled,
count(CHARACTER53) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER53) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER53)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER53) >0 and count(CHARACTER53)/count(*) >.1

  union all
    
      
select 
'CHARACTER54' AS column__name_profiled,
count(CHARACTER54) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER54) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER54)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER54) >0 and count(CHARACTER54)/count(*) >.1

  union all
    
      
select 
'CHARACTER55' AS column__name_profiled,
count(CHARACTER55) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER55) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER55)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER55) >0 and count(CHARACTER55)/count(*) >.1

  union all
    
      
select 
'CHARACTER56' AS column__name_profiled,
count(CHARACTER56) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER56) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER56)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER56) >0 and count(CHARACTER56)/count(*) >.1

  union all
    
      
select 
'CHARACTER57' AS column__name_profiled,
count(CHARACTER57) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER57) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER57)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER57) >0 and count(CHARACTER57)/count(*) >.1

  union all
    
      
select 
'CHARACTER58' AS column__name_profiled,
count(CHARACTER58) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER58) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER58)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER58) >0 and count(CHARACTER58)/count(*) >.1

  union all
    
      
select 
'CHARACTER59' AS column__name_profiled,
count(CHARACTER59) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER59) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER59)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER59) >0 and count(CHARACTER59)/count(*) >.1

  union all
    
      
select 
'CHARACTER60' AS column__name_profiled,
count(CHARACTER60) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER60) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER60)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER60) >0 and count(CHARACTER60)/count(*) >.1

  union all
    
      
select 
'CHARACTER61' AS column__name_profiled,
count(CHARACTER61) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER61) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER61)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER61) >0 and count(CHARACTER61)/count(*) >.1

  union all
    
      
select 
'CHARACTER62' AS column__name_profiled,
count(CHARACTER62) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER62) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER62)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER62) >0 and count(CHARACTER62)/count(*) >.1

  union all
    
      
select 
'CHARACTER63' AS column__name_profiled,
count(CHARACTER63) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER63) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER63)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER63) >0 and count(CHARACTER63)/count(*) >.1

  union all
    
      
select 
'CHARACTER64' AS column__name_profiled,
count(CHARACTER64) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER64) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER64)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER64) >0 and count(CHARACTER64)/count(*) >.1

  union all
    
      
select 
'CHARACTER65' AS column__name_profiled,
count(CHARACTER65) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER65) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER65)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER65) >0 and count(CHARACTER65)/count(*) >.1

  union all
    
      
select 
'CHARACTER66' AS column__name_profiled,
count(CHARACTER66) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER66) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER66)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER66) >0 and count(CHARACTER66)/count(*) >.1

  union all
    
      
select 
'CHARACTER67' AS column__name_profiled,
count(CHARACTER67) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER67) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER67)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER67) >0 and count(CHARACTER67)/count(*) >.1

  union all
    
      
select 
'CHARACTER68' AS column__name_profiled,
count(CHARACTER68) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER68) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER68)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER68) >0 and count(CHARACTER68)/count(*) >.1

  union all
    
      
select 
'CHARACTER69' AS column__name_profiled,
count(CHARACTER69) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER69) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER69)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER69) >0 and count(CHARACTER69)/count(*) >.1

  union all
    
      
select 
'CHARACTER70' AS column__name_profiled,
count(CHARACTER70) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER70) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER70)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER70) >0 and count(CHARACTER70)/count(*) >.1

  union all
    
      
select 
'CHARACTER71' AS column__name_profiled,
count(CHARACTER71) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER71) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER71)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER71) >0 and count(CHARACTER71)/count(*) >.1

  union all
    
      
select 
'CHARACTER72' AS column__name_profiled,
count(CHARACTER72) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER72) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER72)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER72) >0 and count(CHARACTER72)/count(*) >.1

  union all
    
      
select 
'CHARACTER73' AS column__name_profiled,
count(CHARACTER73) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER73) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER73)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER73) >0 and count(CHARACTER73)/count(*) >.1

  union all
    
      
select 
'CHARACTER74' AS column__name_profiled,
count(CHARACTER74) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER74) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER74)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER74) >0 and count(CHARACTER74)/count(*) >.1

  union all
    
      
select 
'CHARACTER75' AS column__name_profiled,
count(CHARACTER75) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER75) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER75)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER75) >0 and count(CHARACTER75)/count(*) >.1

  union all
    
      
select 
'CHARACTER76' AS column__name_profiled,
count(CHARACTER76) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER76) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER76)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER76) >0 and count(CHARACTER76)/count(*) >.1

  union all
    
      
select 
'CHARACTER77' AS column__name_profiled,
count(CHARACTER77) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER77) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER77)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER77) >0 and count(CHARACTER77)/count(*) >.1

  union all
    
      
select 
'CHARACTER78' AS column__name_profiled,
count(CHARACTER78) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER78) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER78)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER78) >0 and count(CHARACTER78)/count(*) >.1

  union all
    
      
select 
'CHARACTER79' AS column__name_profiled,
count(CHARACTER79) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER79) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER79)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER79) >0 and count(CHARACTER79)/count(*) >.1

  union all
    
      
select 
'CHARACTER80' AS column__name_profiled,
count(CHARACTER80) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER80) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER80)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER80) >0 and count(CHARACTER80)/count(*) >.1

  union all
    
      
select 
'CHARACTER81' AS column__name_profiled,
count(CHARACTER81) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER81) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER81)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER81) >0 and count(CHARACTER81)/count(*) >.1

  union all
    
      
select 
'CHARACTER82' AS column__name_profiled,
count(CHARACTER82) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER82) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER82)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER82) >0 and count(CHARACTER82)/count(*) >.1

  union all
    
      
select 
'CHARACTER83' AS column__name_profiled,
count(CHARACTER83) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER83) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER83)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER83) >0 and count(CHARACTER83)/count(*) >.1

  union all
    
      
select 
'CHARACTER84' AS column__name_profiled,
count(CHARACTER84) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER84) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER84)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER84) >0 and count(CHARACTER84)/count(*) >.1

  union all
    
      
select 
'CHARACTER85' AS column__name_profiled,
count(CHARACTER85) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER85) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER85)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER85) >0 and count(CHARACTER85)/count(*) >.1

  union all
    
      
select 
'CHARACTER86' AS column__name_profiled,
count(CHARACTER86) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER86) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER86)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER86) >0 and count(CHARACTER86)/count(*) >.1

  union all
    
      
select 
'CHARACTER87' AS column__name_profiled,
count(CHARACTER87) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER87) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER87)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER87) >0 and count(CHARACTER87)/count(*) >.1

  union all
    
      
select 
'CHARACTER88' AS column__name_profiled,
count(CHARACTER88) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER88) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER88)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER88) >0 and count(CHARACTER88)/count(*) >.1

  union all
    
      
select 
'CHARACTER89' AS column__name_profiled,
count(CHARACTER89) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER89) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER89)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER89) >0 and count(CHARACTER89)/count(*) >.1

  union all
    
      
select 
'CHARACTER90' AS column__name_profiled,
count(CHARACTER90) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER90) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER90)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER90) >0 and count(CHARACTER90)/count(*) >.1

  union all
    
      
select 
'CHARACTER91' AS column__name_profiled,
count(CHARACTER91) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER91) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER91)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER91) >0 and count(CHARACTER91)/count(*) >.1

  union all
    
      
select 
'CHARACTER92' AS column__name_profiled,
count(CHARACTER92) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER92) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER92)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER92) >0 and count(CHARACTER92)/count(*) >.1

  union all
    
      
select 
'CHARACTER93' AS column__name_profiled,
count(CHARACTER93) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER93) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER93)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER93) >0 and count(CHARACTER93)/count(*) >.1

  union all
    
      
select 
'CHARACTER94' AS column__name_profiled,
count(CHARACTER94) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER94) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER94)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER94) >0 and count(CHARACTER94)/count(*) >.1

  union all
    
      
select 
'CHARACTER95' AS column__name_profiled,
count(CHARACTER95) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER95) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER95)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER95) >0 and count(CHARACTER95)/count(*) >.1

  union all
    
      
select 
'CHARACTER96' AS column__name_profiled,
count(CHARACTER96) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER96) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER96)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER96) >0 and count(CHARACTER96)/count(*) >.1

  union all
    
      
select 
'CHARACTER97' AS column__name_profiled,
count(CHARACTER97) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER97) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER97)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER97) >0 and count(CHARACTER97)/count(*) >.1

  union all
    
      
select 
'CHARACTER98' AS column__name_profiled,
count(CHARACTER98) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER98) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER98)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER98) >0 and count(CHARACTER98)/count(*) >.1

  union all
    
      
select 
'CHARACTER99' AS column__name_profiled,
count(CHARACTER99) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER99) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER99)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER99) >0 and count(CHARACTER99)/count(*) >.1

  union all
    
      
select 
'CHARACTER100' AS column__name_profiled,
count(CHARACTER100) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CHARACTER100) as howmanynulls_count_star_minus_count_non_null,
cast(count(CHARACTER100)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CHARACTER100) >0 and count(CHARACTER100)/count(*) >.1

  union all
    
      
select 
'LPN_ID' AS column__name_profiled,
count(LPN_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(LPN_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(LPN_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(LPN_ID) >0 and count(LPN_ID)/count(*) >.1
    

  union all
    
      
select 
'CONTRACT_ID' AS column__name_profiled,
count(CONTRACT_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CONTRACT_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(CONTRACT_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CONTRACT_ID) >0 and count(CONTRACT_ID)/count(*) >.1
    

  union all
    
      
select 
'CONTRACT_LINE_ID' AS column__name_profiled,
count(CONTRACT_LINE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CONTRACT_LINE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(CONTRACT_LINE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CONTRACT_LINE_ID) >0 and count(CONTRACT_LINE_ID)/count(*) >.1
    

  union all
    
      
select 
'DELIVERABLE_ID' AS column__name_profiled,
count(DELIVERABLE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DELIVERABLE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(DELIVERABLE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DELIVERABLE_ID) >0 and count(DELIVERABLE_ID)/count(*) >.1
    

  union all
    
      
select 
'ASSET_GROUP_ID' AS column__name_profiled,
count(ASSET_GROUP_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(ASSET_GROUP_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(ASSET_GROUP_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(ASSET_GROUP_ID) >0 and count(ASSET_GROUP_ID)/count(*) >.1
    

  union all
    
      
select 
'ASSET_ACTIVITY_ID' AS column__name_profiled,
count(ASSET_ACTIVITY_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(ASSET_ACTIVITY_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(ASSET_ACTIVITY_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(ASSET_ACTIVITY_ID) >0 and count(ASSET_ACTIVITY_ID)/count(*) >.1
    

  union all
    
      
select 
'ASSET_NUMBER' AS column__name_profiled,
count(ASSET_NUMBER) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(ASSET_NUMBER) as howmanynulls_count_star_minus_count_non_null,
cast(count(ASSET_NUMBER)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(ASSET_NUMBER) >0 and count(ASSET_NUMBER)/count(*) >.1

  union all
    
      
select 
'WORK_ORDER_ID' AS column__name_profiled,
count(WORK_ORDER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(WORK_ORDER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(WORK_ORDER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(WORK_ORDER_ID) >0 and count(WORK_ORDER_ID)/count(*) >.1
    

  union all
    
      
select 
'SEQUENCE1' AS column__name_profiled,
count(SEQUENCE1) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE1) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE1)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE1) >0 and count(SEQUENCE1)/count(*) >.1

  union all
    
      
select 
'SEQUENCE2' AS column__name_profiled,
count(SEQUENCE2) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE2) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE2)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE2) >0 and count(SEQUENCE2)/count(*) >.1

  union all
    
      
select 
'SEQUENCE3' AS column__name_profiled,
count(SEQUENCE3) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE3) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE3)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE3) >0 and count(SEQUENCE3)/count(*) >.1

  union all
    
      
select 
'SEQUENCE4' AS column__name_profiled,
count(SEQUENCE4) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE4) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE4)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE4) >0 and count(SEQUENCE4)/count(*) >.1

  union all
    
      
select 
'SEQUENCE5' AS column__name_profiled,
count(SEQUENCE5) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE5) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE5)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE5) >0 and count(SEQUENCE5)/count(*) >.1

  union all
    
      
select 
'SEQUENCE6' AS column__name_profiled,
count(SEQUENCE6) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE6) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE6)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE6) >0 and count(SEQUENCE6)/count(*) >.1

  union all
    
      
select 
'SEQUENCE7' AS column__name_profiled,
count(SEQUENCE7) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE7) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE7)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE7) >0 and count(SEQUENCE7)/count(*) >.1

  union all
    
      
select 
'SEQUENCE8' AS column__name_profiled,
count(SEQUENCE8) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE8) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE8)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE8) >0 and count(SEQUENCE8)/count(*) >.1

  union all
    
      
select 
'SEQUENCE9' AS column__name_profiled,
count(SEQUENCE9) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE9) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE9)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE9) >0 and count(SEQUENCE9)/count(*) >.1

  union all
    
      
select 
'SEQUENCE10' AS column__name_profiled,
count(SEQUENCE10) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE10) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE10)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE10) >0 and count(SEQUENCE10)/count(*) >.1

  union all
    
      
select 
'SEQUENCE11' AS column__name_profiled,
count(SEQUENCE11) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE11) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE11)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE11) >0 and count(SEQUENCE11)/count(*) >.1

  union all
    
      
select 
'SEQUENCE12' AS column__name_profiled,
count(SEQUENCE12) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE12) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE12)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE12) >0 and count(SEQUENCE12)/count(*) >.1

  union all
    
      
select 
'SEQUENCE13' AS column__name_profiled,
count(SEQUENCE13) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE13) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE13)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE13) >0 and count(SEQUENCE13)/count(*) >.1

  union all
    
      
select 
'SEQUENCE14' AS column__name_profiled,
count(SEQUENCE14) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE14) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE14)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE14) >0 and count(SEQUENCE14)/count(*) >.1

  union all
    
      
select 
'SEQUENCE15' AS column__name_profiled,
count(SEQUENCE15) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(SEQUENCE15) as howmanynulls_count_star_minus_count_non_null,
cast(count(SEQUENCE15)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(SEQUENCE15) >0 and count(SEQUENCE15)/count(*) >.1

  union all
    
      
select 
'COMMENT1' AS column__name_profiled,
count(COMMENT1) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMMENT1) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMMENT1)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMMENT1) >0 and count(COMMENT1)/count(*) >.1

  union all
    
      
select 
'COMMENT2' AS column__name_profiled,
count(COMMENT2) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMMENT2) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMMENT2)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMMENT2) >0 and count(COMMENT2)/count(*) >.1

  union all
    
      
select 
'COMMENT3' AS column__name_profiled,
count(COMMENT3) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMMENT3) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMMENT3)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMMENT3) >0 and count(COMMENT3)/count(*) >.1

  union all
    
      
select 
'COMMENT4' AS column__name_profiled,
count(COMMENT4) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMMENT4) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMMENT4)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMMENT4) >0 and count(COMMENT4)/count(*) >.1

  union all
    
      
select 
'COMMENT5' AS column__name_profiled,
count(COMMENT5) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COMMENT5) as howmanynulls_count_star_minus_count_non_null,
cast(count(COMMENT5)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COMMENT5) >0 and count(COMMENT5)/count(*) >.1

  union all
    
      
select 
'PARTY_ID' AS column__name_profiled,
count(PARTY_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(PARTY_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(PARTY_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(PARTY_ID) >0 and count(PARTY_ID)/count(*) >.1
    

  union all
    
      
select 
'CSI_INSTANCE_ID' AS column__name_profiled,
count(CSI_INSTANCE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CSI_INSTANCE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(CSI_INSTANCE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CSI_INSTANCE_ID) >0 and count(CSI_INSTANCE_ID)/count(*) >.1
    

  union all
    
      
select 
'COUNTER_ID' AS column__name_profiled,
count(COUNTER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COUNTER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(COUNTER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COUNTER_ID) >0 and count(COUNTER_ID)/count(*) >.1
    

  union all
    
      
select 
'COUNTER_READING_ID' AS column__name_profiled,
count(COUNTER_READING_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(COUNTER_READING_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(COUNTER_READING_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(COUNTER_READING_ID) >0 and count(COUNTER_READING_ID)/count(*) >.1
    

  union all
    
      
select 
'AHL_MR_ID' AS column__name_profiled,
count(AHL_MR_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(AHL_MR_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(AHL_MR_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(AHL_MR_ID) >0 and count(AHL_MR_ID)/count(*) >.1
    

  union all
    
      
select 
'CS_INCIDENT_ID' AS column__name_profiled,
count(CS_INCIDENT_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(CS_INCIDENT_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(CS_INCIDENT_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(CS_INCIDENT_ID) >0 and count(CS_INCIDENT_ID)/count(*) >.1
    

  union all
    
      
select 
'WIP_REWORK_ID' AS column__name_profiled,
count(WIP_REWORK_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(WIP_REWORK_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(WIP_REWORK_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(WIP_REWORK_ID) >0 and count(WIP_REWORK_ID)/count(*) >.1
    

  union all
    
      
select 
'DISPOSITION_SOURCE' AS column__name_profiled,
count(DISPOSITION_SOURCE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DISPOSITION_SOURCE) as howmanynulls_count_star_minus_count_non_null,
cast(count(DISPOSITION_SOURCE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DISPOSITION_SOURCE) >0 and count(DISPOSITION_SOURCE)/count(*) >.1

  union all
    
      
select 
'DISPOSITION' AS column__name_profiled,
count(DISPOSITION) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DISPOSITION) as howmanynulls_count_star_minus_count_non_null,
cast(count(DISPOSITION)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DISPOSITION) >0 and count(DISPOSITION)/count(*) >.1

  union all
    
      
select 
'DISPOSITION_ACTION' AS column__name_profiled,
count(DISPOSITION_ACTION) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DISPOSITION_ACTION) as howmanynulls_count_star_minus_count_non_null,
cast(count(DISPOSITION_ACTION)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DISPOSITION_ACTION) >0 and count(DISPOSITION_ACTION)/count(*) >.1

  union all
    
      
select 
'DISPOSITION_STATUS' AS column__name_profiled,
count(DISPOSITION_STATUS) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(DISPOSITION_STATUS) as howmanynulls_count_star_minus_count_non_null,
cast(count(DISPOSITION_STATUS)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(DISPOSITION_STATUS) >0 and count(DISPOSITION_STATUS)/count(*) >.1

  union all
    
      
select 
'MTI_TRANSACTION_HEADER_ID' AS column__name_profiled,
count(MTI_TRANSACTION_HEADER_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(MTI_TRANSACTION_HEADER_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(MTI_TRANSACTION_HEADER_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(MTI_TRANSACTION_HEADER_ID) >0 and count(MTI_TRANSACTION_HEADER_ID)/count(*) >.1
    

  union all
    
      
select 
'MTI_TRANSACTION_INTERFACE_ID' AS column__name_profiled,
count(MTI_TRANSACTION_INTERFACE_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(MTI_TRANSACTION_INTERFACE_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(MTI_TRANSACTION_INTERFACE_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(MTI_TRANSACTION_INTERFACE_ID) >0 and count(MTI_TRANSACTION_INTERFACE_ID)/count(*) >.1
    

  union all
    
      
select 
'MMT_TRANSACTION_ID' AS column__name_profiled,
count(MMT_TRANSACTION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(MMT_TRANSACTION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(MMT_TRANSACTION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(MMT_TRANSACTION_ID) >0 and count(MMT_TRANSACTION_ID)/count(*) >.1
    

  union all
    
      
select 
'WJSI_GROUP_ID' AS column__name_profiled,
count(WJSI_GROUP_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(WJSI_GROUP_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(WJSI_GROUP_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(WJSI_GROUP_ID) >0 and count(WJSI_GROUP_ID)/count(*) >.1
    

  union all
    
      
select 
'WMTI_GROUP_ID' AS column__name_profiled,
count(WMTI_GROUP_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(WMTI_GROUP_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(WMTI_GROUP_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(WMTI_GROUP_ID) >0 and count(WMTI_GROUP_ID)/count(*) >.1
    

  union all
    
      
select 
'WMT_TRANSACTION_ID' AS column__name_profiled,
count(WMT_TRANSACTION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(WMT_TRANSACTION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(WMT_TRANSACTION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(WMT_TRANSACTION_ID) >0 and count(WMT_TRANSACTION_ID)/count(*) >.1
    

  union all
    
      
select 
'RTI_INTERFACE_TRANSACTION_ID' AS column__name_profiled,
count(RTI_INTERFACE_TRANSACTION_ID) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(RTI_INTERFACE_TRANSACTION_ID) as howmanynulls_count_star_minus_count_non_null,
cast(count(RTI_INTERFACE_TRANSACTION_ID)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(RTI_INTERFACE_TRANSACTION_ID) >0 and count(RTI_INTERFACE_TRANSACTION_ID)/count(*) >.1
    

  union all
    
      
select 
'MAINTENANCE_OP_SEQ' AS column__name_profiled,
count(MAINTENANCE_OP_SEQ) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(MAINTENANCE_OP_SEQ) as howmanynulls_count_star_minus_count_non_null,
cast(count(MAINTENANCE_OP_SEQ)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(MAINTENANCE_OP_SEQ) >0 and count(MAINTENANCE_OP_SEQ)/count(*) >.1
    

  union all
    
      
select 
'NONCONFORMANCE_SOURCE' AS column__name_profiled,
count(NONCONFORMANCE_SOURCE) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(NONCONFORMANCE_SOURCE) as howmanynulls_count_star_minus_count_non_null,
cast(count(NONCONFORMANCE_SOURCE)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(NONCONFORMANCE_SOURCE) >0 and count(NONCONFORMANCE_SOURCE)/count(*) >.1

  union all
    
      
select 
'NONCONFORM_SEVERITY' AS column__name_profiled,
count(NONCONFORM_SEVERITY) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count(NONCONFORM_SEVERITY) as howmanynulls_count_star_minus_count_non_null,
cast(count(NONCONFORM_SEVERITY)/count(*) as number(15,3)) as proportion_non_null
from apps.qa_results
where organization_id = 1213
AND plan_id = 5166
having count(NONCONFORM_SEVERITY) >0 and count(NONCONFORM_SEVERITY)/count(*) >.1

  