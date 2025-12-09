SELECT
    stg_base.*,
    stg_join1.*
FROM
    {{ ref('stg_wop_we_wdj_msib') }}
    stg_base
    JOIN {{ ref('src_bom_departments_from') }}
    stg_join1
    ON stg_base.wop_fm_department_id = stg_join1.bd_fm_department_id