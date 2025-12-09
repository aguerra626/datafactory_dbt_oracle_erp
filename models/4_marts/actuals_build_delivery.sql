SELECT
    *
FROM
    {{ ref('actuals_build') }}

UNION ALL

SELECT
    *
FROM
    {{ ref('actuals_delivery') }}
