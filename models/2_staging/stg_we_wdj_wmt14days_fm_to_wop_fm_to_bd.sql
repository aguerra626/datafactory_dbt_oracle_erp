SELECT
    stg_we_wdj_wmt_fm_to_wop.*,
    fmbd.*,
    tobd.*
    
FROM
    {{ ref('stg_we_wdj_wmt14days_fm_to_wop') }}
    stg_we_wdj_wmt_fm_to_wop
    JOIN {{ ref('src_bom_departments_from') }}
    fmbd
    ON stg_we_wdj_wmt_fm_to_wop.wmt_fm_department_id = fmbd.bd_fm_department_id
    JOIN {{ ref('src_bom_departments_to') }}
    tobd
    ON stg_we_wdj_wmt_fm_to_wop.wmt_to_department_id = tobd.bd_to_department_id
