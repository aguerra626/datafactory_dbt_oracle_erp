SELECT
stg_base.*,
join1.*

FROM
{{ ref('stg_boms_bcomp') }} stg_base
JOIN {{ ref('stg_we_wdj_wro') }} join1
on stg_base.bcomp_component_sequence_id = join1.wro_component_sequence_id