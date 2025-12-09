select 
cost_type_id AS lu_cct_cost_type_id,
cost_type AS lu_cct_cost_type,
description AS lu_cct_description,
last_update_date AS lu_cct_last_update_date
from {{ source('bom', 'cst_cost_types') }}