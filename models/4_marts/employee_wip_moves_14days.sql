with base as (
select
    int_base.wmt_transaction_id,
    cast(to_char(cast(int_base.transacted_at_cst as date), 'DD-MON-YY') as date) AS "Transaction Date CST",
    cast(to_char(cast(int_base.transacted_at_cst as timestamp), 'DD-MON-YY HH12:MI:SS AM') as timestamp) AS "Transaction Datetime CST", 
    REPLACE(int_base.user_name, '.', ' ') AS "Employee Name",
    mp_description AS "Planner",
    int_base.msib_segment1 AS "Part Number",
    int_base.msib_description AS "Part Description",
    int_base.we_wip_entity_name AS "Job Number",
    int_base.wmt_fm_operation_seq_num AS "Fm Op Seq Num",
    int_base.wop_fm_description AS "Fm Op Description",
    int_base.wmt_fm_intraoperation_step_type AS "Fm Intraop Step Type",
    int_base.bd_fm_department_code AS "Fm Department",
    int_base.wmt_to_operation_seq_num AS "To Op Seq Num",
    int_base.wop_to_description AS "To Op Description",
    int_base.wmt_to_intraoperation_step_type AS "To Intraop Step Type",
    int_base.bd_to_department_code AS "To Department",
    int_base.transacted_at_cst AS "Transaction Datetimezone CST",
    int_base.wmt_transaction_quantity AS "Transaction Qty",
    ' ' AS blank__ -- tableau text pane blank space placeholder

 
from {{ ref('int_employee_wip_moves_14days') }} int_base
)
select * from base