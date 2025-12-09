SELECT
    FROM_TZ(CAST(NVL(int_base.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' 
            AS transacted_at_cst,
    FROM_TZ(CAST(NVL(int_base.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE '-06:00' 
            AS transacted_at_cst_offset,
    CAST(NVL(int_base.wmt_transaction_date,sysdate) AS TIMESTAMP) 
            AS transacted_at_est,
    FROM_TZ(CAST(NVL(int_base.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'UTC'
            AS transacted_at_utc,
    FROM_TZ(CAST(NVL(int_base.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE '-04:00' 
            AS shift_start_at,
    CASE
        WHEN int_base.msib_segment1 LIKE '987-7173-%' THEN 'NavStorm'
        WHEN int_base.msib_segment1 LIKE '822-2347-%' THEN 'NavStorm'
        WHEN int_base.msib_segment1 LIKE '983-9834-%' THEN 'NavFire'
        WHEN int_base.msib_segment1 LIKE '822-2904-%' THEN 'NavFire'
        WHEN int_base.msib_segment1 LIKE '822-1600-137%' THEN 'NavStrike'
        WHEN int_base.msib_segment1 LIKE '822-1600-138%' THEN 'NavStrike'
        WHEN int_base.msib_segment1 LIKE '822-3078-002%' THEN 'ASR 3.7'
        WHEN int_base.msib_segment1 LIKE '822-3396-%' THEN 'NavStrike M'
        WHEN int_base.msib_segment1 LIKE '822-1873-%' THEN 'DAGR'
        WHEN int_base.msib_segment1 LIKE '822-3527-%' THEN 'DIGAR'
    END AS part_number_group,
    int_base.msib_segment1,
    int_base.msib_description,
    NVL(int_base.wmt_fm_operation_seq_num,int_base.wop_fm_operation_seq_num) nvl_wmt_wop_fm_operation_seq_num,
    int_base.wop_fm_description,
    NVL(int_base.wmt_transaction_quantity,0) nvl_wmt_0_transaction_quantity,
    int_base.we_wip_entity_name
FROM
    {{ ref('stg_from_wop_we_wdj_msib_lf_wmt') }}
    int_base
WHERE
    int_base.wdj_organization_id = 1213
    AND NVL(int_base.wmt_transaction_date,sysdate) >= SYSDATE - 1
    AND (
        int_base.msib_segment1 LIKE '822-1600-137%'
        OR int_base.msib_segment1 LIKE '822-1600-138%'
        OR int_base.msib_segment1 LIKE '822-3396-%'
        OR int_base.msib_segment1 LIKE '822-2904-%'
        OR int_base.msib_segment1 LIKE '983-9834-%'
        OR int_base.msib_segment1 LIKE '822-2347-%'
        OR int_base.msib_segment1 LIKE '987-7173-%'
        OR int_base.msib_segment1 LIKE '822-3078-002%'
        OR int_base.msib_segment1 LIKE '822-1873-003%'
        OR int_base.msib_segment1 LIKE '822-3527-%'
    )
