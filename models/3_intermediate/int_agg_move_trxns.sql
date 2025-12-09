SELECT
    int_base.we_wip_entity_id,
    int_base.we_wip_entity_name,
    TRUNC(
        int_base.wmt_transaction_date
    ) wmt_transaction_date_est,
    TO_DATE(
        TRUNC(
            from_tz(
                CAST(
                    int_base.wmt_transaction_date AS TIMESTAMP
                ),
                'America/New_York'
            ) AT TIME ZONE 'America/Chicago'
        ),
        'DD-MON-YY'
    ) AS wmt_transaction_date_cst,
    int_base.msib_segment1,
    int_base.msib_description,
    int_base.wmt_fm_operation_seq_num,
    int_base.wop_fm_description,
    int_base.wmt_to_operation_seq_num,
    int_base.wop_to_description,
    int_base.bd_fm_department_code,
    int_base.bd_to_department_code,
    SUM(
        int_base.wmt_transaction_quantity
    ) wmt_transaction_quantity,
    MIN(int_base.wmt_transaction_id) wmt_min_transaction_id_surrogate_key 
FROM
    {{ ref('stg_we_wdj_wmt_fm_to_wop_fm_to_bd_msib_mp') }}
    int_base
GROUP BY
    int_base.we_wip_entity_id,
    int_base.we_wip_entity_name,
    TRUNC(
        int_base.wmt_transaction_date
    ),
    TO_DATE(
        TRUNC(
            from_tz(
                CAST(
                    int_base.wmt_transaction_date AS TIMESTAMP
                ),
                'America/New_York'
            ) AT TIME ZONE 'America/Chicago'
        ),
        'DD-MON-YY'
    ),
    int_base.msib_segment1,
    int_base.msib_description,
    int_base.wmt_fm_operation_seq_num,
    int_base.wop_fm_description,
    int_base.wmt_to_operation_seq_num,
    int_base.wop_to_description,
    int_base.bd_fm_department_code,
    int_base.bd_to_department_code
