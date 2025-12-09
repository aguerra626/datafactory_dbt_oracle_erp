select
qp_name,
qp_description,
qp_plan_id,
qpc_result_column_name,
qpc_prompt_sequence,
qpc_prompt,
qp_import_view_name,
qp_organization_id
from 
{{ ref('stg_qa_plan_and_chars') }}