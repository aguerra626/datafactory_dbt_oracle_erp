SELECT
    FROM_TZ(CAST(NVL(int_base.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' 
            AS transacted_at_cst,
    FROM_TZ(CAST(NVL(int_base.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE '-05:00' 
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
        WHEN int_base.msib_segment1 = '987-2434-300' THEN 'SABR'
        WHEN int_base.msib_segment1 = '987-2094-004' THEN 'IGAS'
        WHEN int_base.msib_segment1 = '822-3255-001+TL' THEN 'ASM'
        WHEN int_base.msib_segment1 = '822-3697-001+TL' THEN 'SAJE'
        WHEN int_base.msib_segment1 = '987-9705-012+TL' THEN 'Mgram-012'
        WHEN int_base.msib_segment1 = '987-9705-112' THEN 'Mgram-112'
        WHEN int_base.msib_segment1 = '987-8760-002+TL' THEN 'Link'
        WHEN int_base.msib_segment1 = '987-9658-001+TL' THEN 'Mgram M'
        WHEN int_base.msib_segment1 = '987-2618-021+TL' THEN 'MPEM-021'
        WHEN int_base.msib_segment1 = '987-2618-121+TL' THEN 'MPEM-121'
        WHEN int_base.msib_segment1 = '987-2618-221+TL' THEN 'MPEM-221'
        WHEN int_base.msib_segment1 = '987-2618-321+TL' THEN 'MPEM-321'
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
    AND NVL(int_base.wmt_transaction_date,sysdate) >= SYSDATE - 2
    AND (
        int_base.msib_segment1 = '987-2434-300' 
        OR int_base.msib_segment1 = '987-2094-004' 
        OR int_base.msib_segment1 = '822-3255-001+TL' 
        OR int_base.msib_segment1 = '822-3697-001+TL' 
        OR int_base.msib_segment1 = '987-9705-012+TL' 
        OR int_base.msib_segment1 = '987-9705-112' 
        OR int_base.msib_segment1 = '987-8760-002+TL' 
        OR int_base.msib_segment1 = '987-9658-001+TL' 
        OR int_base.msib_segment1 = '987-2618-021+TL' 
        OR int_base.msib_segment1 = '987-2618-121+TL' 
        OR int_base.msib_segment1 = '987-2618-221+TL' 
        OR int_base.msib_segment1 = '987-2618-321+TL' 
    )

