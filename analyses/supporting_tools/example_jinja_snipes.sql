{% for column in column_names %}
    {{ log(
        "Column: " ~ column,
        info = True
    ) }}
{% endfor %}

{{ log(
    "Data Types List: " ~ column_datatype,
    info = True
) }}
{{ log(
    "Results Table: \n " ~ cols_exec_query,
    info = True
) }}

{% set all_measures = [ "row_count", "not_null_proportion", "distinct_proportion", "distinct_count", "is_unique", "min", "max", "avg", "median", "std_dev_population", "std_dev_sample" ] %}
{{ log(
    "Data Profiler Calculating: " ~ all_measures,
    info = True
) }}
