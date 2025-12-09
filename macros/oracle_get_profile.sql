{% macro oracle_get_profile(mytable,where_clause,alias) %}
    {{recommend_me_columns(mytable,where_clause,alias)}}
{% endmacro %}
