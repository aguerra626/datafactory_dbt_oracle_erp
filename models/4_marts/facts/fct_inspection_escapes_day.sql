--define business process: To track inspection escapes and its daily quantity of defects per inspector
-- declare the fact table granularity: One row per day per employee
-- identify the facts:  Defect Qtys
-- identify the dimensions: dim_item_master, dim_departments
SELECT
'inspection_escapes_day_emp_sk' AS inspection_escapes_day_emp_sk,
to_char(trunc(base."INSPECTION DATE"),'YYYYMMDD') AS "inspection_at_day_sk",
base."INSPECTED BY" AS "Inspected By",
SUM(TO_NUMBER(base.DD_Quantity)) AS "Defect Qtys",
-- dimensions to slice data on. Business keys:
rr_primary_item_id AS "rr_primary_item_id",
rr_department_id AS "rr_department_id"
FROM
{{ ref('Inspection_Escapes_Report_Modified') }} base
GROUP BY to_char(trunc(base."INSPECTION DATE"),'YYYYMMDD'), base."INSPECTED BY", rr_primary_item_id, rr_department_id