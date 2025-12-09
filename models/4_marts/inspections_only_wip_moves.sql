select *
from {{ ref('employee_wip_moves_365days') }}
where upper("Fm Op Description") like '%INSP%'