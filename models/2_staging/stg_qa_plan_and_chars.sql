select 
join1.qp_name,
join1.qp_description,
base.*
from {{ ref('src_qa_plan_chars') }} base
join {{ ref('src_qa_plans') }} join1
on base.qpc_plan_id = join1.qp_plan_id