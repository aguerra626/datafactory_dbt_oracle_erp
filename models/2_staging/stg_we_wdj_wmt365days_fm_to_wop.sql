SELECT
    stg_base.*,
    fmwop.*,
    towop.*
FROM
    {{ ref('stg_we_wdj_wmt365days') }}
    stg_base
    JOIN {{ ref('src_wip_operations_from') }}
    fmwop
    ON stg_base.wmt_wip_entity_id = fmwop.wop_fm_wip_entity_id
    AND stg_base.wmt_fm_operation_seq_num = fmwop.wop_fm_operation_seq_num
    AND stg_base.wmt_organization_id = fmwop.wop_fm_organization_id
    JOIN {{ ref('src_wip_operations_to') }}
    towop
    ON stg_base.wmt_wip_entity_id = towop.wop_to_wip_entity_id
    AND stg_base.wmt_to_operation_seq_num = towop.wop_to_operation_seq_num
    AND stg_base.wmt_organization_id = towop.wop_to_organization_id
