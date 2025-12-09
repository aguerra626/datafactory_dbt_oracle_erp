select 
src_base.oeh_line_category_code,
count(*) rowcounts
from {{ ref('int_saasm_top_level_sales_lines_and_deliveries') }} src_base
where 1=1
group by src_base.oeh_line_category_code
order by rowcounts desc