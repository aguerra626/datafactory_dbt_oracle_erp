-- declare grain: one row per departmant
-- Colomn ordering: from high cardinality to lowest cardinality
-- Surrogate keys - Business keys - Major Descriptive Attributes - Date Attributes (when) - Minor Descriptive Attributes
select
standard_hash(base.bd_department_id, 'MD5') departments_from_sk,
base.bd_department_id,
base.bd_organization_id,
base.bd_department_code AS "Department",
base.bd_description,
base.bd_department_class_code
from {{ ref('src_bom_departments') }} base