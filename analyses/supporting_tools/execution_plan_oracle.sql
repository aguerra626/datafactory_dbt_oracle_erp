explain plan for

{{myquery_placeholder}};

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY('plan_table',null,'all')); -- view all stat columns

-- format stat columns in hierarchy
select id , 
lpad(' ', 2*(level-1))||operation operation, 
options, 
object_name, 
object_alias,
position,
filter_predicates,
cpu_cost,
io_cost,
cost,
cardinality,
bytes
from plan_table 
start with id=0
connect by prior id = parent_id
order by id;
select * from plan_table;