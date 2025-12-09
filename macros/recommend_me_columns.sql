{% macro recommend_me_columns(mytable,where_clause,alias) %}
  {% if execute %}
  {% set columns_query %}
  SELECT column_name, data_type FROM sys.all_tab_columns
  WHERE
    UPPER(table_name) = UPPER('{{ mytable }}') AND data_type != 'CLOB' AND data_type != 'RAW' AND column_name NOT LIKE '%#%' 
  {% endset %}
    {% set cols_exec_query = run_query(columns_query) %} {# agate.table OBJECT #} 
    {% set column_names = cols_exec_query.columns [0].values() %}
    {% set column_datatype = cols_exec_query.columns [1].values() %}
    {% set unknown_column_datatype = [] %}
  {% set profile_sql %}
    {%- for column,datatype in zip_strict(column_names,column_datatype) -%}
        SELECT '{{column}}' AS column_name FROM apps.{{ mytable }}
      {% if where_clause %}
        WHERE {{ where_clause }}
      {% endif %}
        HAVING COUNT({{ column }}  ) > 0  AND COUNT({{ column }}) / COUNT(*) >.1 
      {% if not loop.last %}  UNION ALL
      {% endif %}
    {%- endfor -%}
  {% endset %}
    {{ log(  "For loop completed.\n",  info = True) }}
    {{ log(  "Unknown column datatypes: " ~ unknown_column_datatype,  info = True) }} 

  {%- set src_query_exec = run_query(profile_sql) -%}
  {%- set src_query_template -%}
  SELECT
    {% for src_column in src_query_exec.columns [0].values() %}
      {{ src_column }} AS {{ alias }}_{{ src_column }}
      {%- if not loop.last -%},
      {%- endif -%}
    {%- endfor %}
  FROM
    apps.{{ mytable }}
    {% if where_clause %}
    WHERE
      {{ where_clause }}
    {% endif %}

    {% endset %}
    {{ return(src_query_template) }}
  {% endif %}
{% endmacro %}
