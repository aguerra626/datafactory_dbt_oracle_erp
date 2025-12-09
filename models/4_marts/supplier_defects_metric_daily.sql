with metric_daily_all as (
  select
  base."Affected Assy Material",
  base."QA Creation Date",
  base."DD Quantity" quantity, 
  'Defects' feature
  from {{ ref('fct_supplier_caused_defects') }} base
  
  union all
  
  select
  base.*,
  'Completions'
  from {{ ref('fct_wip_assembly_completions') }} base
),
pivot__metric_daily_all as (
  select
  mda.*,
  case when feature = 'Defects' then mda.quantity else 0 end defect_qtys,
  case when feature = 'Completions' then mda.quantity else 0 end completions_qtys
  from metric_daily_all mda
)
select 
m."Affected Assy Material",
m."QA Creation Date",
sum(defect_qtys) defect_qtys,
sum(completions_qtys) completions_qtys
from pivot__metric_daily_all m
group by 
m."Affected Assy Material",
m."QA Creation Date"