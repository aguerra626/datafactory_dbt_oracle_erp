-- one row per affected assy material per day
select
base."Affected Assy Material",
to_date(trunc(base."QA Creation Date")) "QA Creation Date",
sum(base."DD Quantity") "DD Quantity"
from {{ ref('int_supplier_caused_defects') }} base

group by 
base."Affected Assy Material",
to_date(trunc(base."QA Creation Date"))