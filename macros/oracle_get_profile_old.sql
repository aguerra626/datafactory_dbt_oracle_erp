{% macro oracle_get_profile_old(mytable,where_clause) %}
  {% if execute %}
  {% set columns_query %}
SELECT
  column_name,
  data_type
FROM
  sys.all_tab_columns
WHERE
  UPPER(table_name) = UPPER('{{ mytable }}') and data_type != 'CLOB'
  {% endset %}
  {% set cols_exec_query = run_query(columns_query) %} {# agate.table OBJECT #}
  {% set column_names = cols_exec_query.columns[0].values() %}
  {% set column_datatype = cols_exec_query.columns[1].values() %}
  {% set numeric_types = ['int', 'integer', 'float', 'double', 'number', 'decimal'] %}
  {% set date_types = ['date', 'datetime', 'timestamp'] %}
  {% set text_types = ['varchar', 'char', 'text', 'string','varchar2','clob'] %}
  {% set unknown_column_datatype = [] %}
  {#  {{ log("agate.Table: \n " ~ cols_exec_query, info = True) }} #}

    
  
{% set profile_sql %}
  {%- for column, datatype in zip_strict(column_names,column_datatype) -%}
    {# {{ log("Column Name: " ~ column ~ ", Data Type: " ~ datatype, info = True) }} #}
    {% if datatype | lower in numeric_types %}
      {# {{ log("This Column " ~ column ~ " evaluated to True for numeric_types\n", info = True) }} #}
select 
'{{column}}' AS column__name_profiled,
count({{column}}) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count({{column}}) as howmanynulls_count_star_minus_count_non_null,
cast(count({{column}})/count(*) as number(15,3)) as proportion_non_null
from apps.{{ mytable }}
{% if where_clause %}
  where {{ where_clause }}
{% endif %}

having count({{column}}) >0 and count({{column}})/count(*) >.1
    {% elif datatype | lower in date_types %}
      {# {{ log("This Column " ~ column ~ " evaluated to True for date_types\n", info = True) }} #}
select 
'{{column}}' AS column__name_profiled,
count({{column}}) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count({{column}}) as howmanynulls_count_star_minus_count_non_null,
cast(count({{column}})/count(*) as number(15,3)) as proportion_non_null
from apps.{{ mytable }}
{% if where_clause %}
  where {{ where_clause }}
{% endif %}
having count({{column}}) >0 and count({{column}})/count(*) >.1
    {% elif datatype | lower in text_types %}
      {# {{ log("This Column " ~ column ~ " evaluated to True for text_types\n", info = True) }} #}
select 
'{{column}}' AS column__name_profiled,
count({{column}}) AS count_non_null, 
count(*) AS count_star_total_rows, 
count(*) - count({{column}}) as howmanynulls_count_star_minus_count_non_null,
cast(count({{column}})/count(*) as number(15,3)) as proportion_non_null
from apps.{{ mytable }}
{% if where_clause %}
  where {{ where_clause }}
{% endif %}
having count({{column}}) >0 and count({{column}})/count(*) >.1
    {%- else -%}
      {{ log("Warning(): This Column " ~ column ~ " contains unrecognized data type\n", info = True) }}
      {%- do unknown_column_datatype.append(column) -%}
    {% endif %}

  {% if not loop.last %}union all{% endif %}
  
  {%- endfor -%}

  {% endset %}

   {{ log("For loop completed.\n", info=True) }}
   {{ log("Unknown column datatypes: " ~ unknown_column_datatype, info = True) }}
  {# {{ log(profile_sql, info = False) }} #}

   {# {{print(profile_sql)}} #}
   {# {% do return(profile_sql) %} #}
   {{ return(profile_sql)}}
   {% endif %}
{% endmacro %}
