select * from {{ ref('fiscal_calendar_current_year_365days') }} base 
cross join {{ ref('int_densification_item_master') }} join1