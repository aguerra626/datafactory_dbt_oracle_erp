SELECT
    calendar_date as bcal_calendar_date,
    next_date as bcal_next_date,
    seq_num as bcal_seq_num,
    next_seq_num as bcal_next_seq_num,
    CASE
        WHEN seq_num IS NULL THEN next_date
        ELSE calendar_date
    END as bcal_working_dates
FROM
    {{ source('bom', 'bom_calendar_dates') }}
WHERE
    calendar_code = 'NSS'
    AND calendar_date BETWEEN sysdate-30
    AND sysdate+30
