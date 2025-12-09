SELECT
    DISTINCT SUBSTR(
        base.wmt_source_code,
        1,
        15
    ),
    MAX(
        base.we_wip_entity_name
    )
FROM
    {{ ref('stg_we_wdj_wmt365days') }}
    base
WHERE
    base.wmt_transaction_date >= SYSDATE -365
    AND base.wmt_source_code NOT LIKE '%Job%'
    AND base.wmt_source_code NOT LIKE '%SCRAP%'
    AND base.wmt_organization_id = 1213
GROUP BY
    SUBSTR(
        base.wmt_source_code,
        1,
        15
    );

SELECT
    DISTINCT wdj.status_type,
    lu1.meaning AS "WIP JOB STATUS",
    wdj.job_type,
    lu3.meaning AS "WIP JOB TYPE",
    wdj.wip_supply_type,
    lu2.meaning AS "WIP SUPPLY TYPE"
FROM
    wip.wip_discrete_jobs wdj
    LEFT JOIN apps.fnd_lookup_values lu1
    ON wdj.status_type = lu1.lookup_code
    AND lu1.lookup_type = 'WIP_JOB_STATUS'
    LEFT JOIN apps.fnd_lookup_values lu2
    ON wdj.wip_supply_type = lu2.lookup_code
    AND lu2.lookup_type = 'WIP_SUPPLY'
    LEFT JOIN apps.fnd_lookup_values lu3
    ON wdj.job_type = lu3.lookup_code
    AND lu3.lookup_type = 'WIP_DISCRETE_JOB'
ORDER BY
    TO_NUMBER(
        wdj.status_type
    ) ASC;
SELECT
    DISTINCT SUBSTR(
        source_code,
        1,
        15
    ),
    MAX(wip_entity_id)
FROM
    apps.wip_move_transactions
WHERE
    transaction_date >= SYSDATE -365
    AND source_code NOT LIKE '%Job%'
    AND source_code NOT LIKE '%SCRAP%'
    AND organization_id = 1213
GROUP BY
    SUBSTR(
        wmt_source_code,
        1,
        15
    );

SELECT
    DISTINCT SUBSTR(
        source_code,
        1,
        18
    )
FROM
    apps.wip_move_transactions
WHERE
    transaction_date >= SYSDATE -365
    AND source_code NOT LIKE '%Job%'
    AND source_code NOT LIKE '%SCRAP%'
    AND source_code NOT LIKE '%CONTEXT190%';
SELECT
    DISTINCT source_code
FROM
    apps.wip_move_transactions
WHERE
    transaction_date >= SYSDATE -365
    AND source_code LIKE '%Job%';
    /*
    SOURCE_CODE include:
    CONTHDB133
    OA Transaction
    CONTEXT325
    CONTEXT299
    RCV
    QA-WIP Move for
    CONTEXT325-RR-A (looks like serial number)
    CONTEXT325-RR-H (looks like serial number)
    CONTEXT325-RR-F (looks like serial number)
    BAE AUTO MOVE:8---- (and more numbers unsure what they mean)
    CONTEXT190:5 (not for 1213)
    CONTEXT190:4 (not for 1213)
    CONTINT111
    QA WIP SCRAP
    BAE_CONTEXT083_
    
    */
