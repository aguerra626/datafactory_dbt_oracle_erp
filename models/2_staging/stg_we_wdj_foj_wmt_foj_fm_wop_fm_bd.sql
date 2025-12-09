SELECT
    stg_we_wdj_foj_wmt_foj_fm_wop.*,
    fmbd.*
FROM
    {{ ref('stg_we_wdj_foj_wmt_foj_fm_wop') }}
    stg_we_wdj_foj_wmt_foj_fm_wop
    JOIN {{ ref('src_bom_departments_from') }}
    fmbd
    ON stg_we_wdj_foj_wmt_foj_fm_wop.wmt_fm_department_id = fmbd.bd_fm_department_id
