{% test test_is_null_2(model, column_name) %}

with validation as (

    select distinct
        {{ column_name }} as value_field

    from {{ model }}

),

validation_errors as (

    select
        value_field

    from validation
    where value_field is not null or value_field != 2

)

select *
from validation_errors

{% endtest %}