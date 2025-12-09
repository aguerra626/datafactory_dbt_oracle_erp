SELECT
    lookup_code,
    lookup_type,
    meaning
FROM {{ source('applsys','fnd_lookup_values') }} 