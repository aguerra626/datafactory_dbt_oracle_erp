--define business process: To track inspection escapes and its daily quantity of defects per inspector
-- declare the fact table granularity: One row per day per employee
-- identify the facts:  Defect Qtys
SELECT
'inspection_escapes_day_emp_sk' AS inspection_escapes_day_emp_sk,
to_char(trunc(base."INSPECTION DATE"),'YYYYMMDD') AS "inspection_at_day_sk",
base."INSPECTED BY" AS "Inspected By",
SUM(TO_NUMBER(base.DD_Quantity)) AS "Defect Qtys"
FROM
{{ ref('Inspection_Escapes_Report_Modified') }} base
GROUP BY to_char(trunc(base."INSPECTION DATE"),'YYYYMMDD'), base."INSPECTED BY"