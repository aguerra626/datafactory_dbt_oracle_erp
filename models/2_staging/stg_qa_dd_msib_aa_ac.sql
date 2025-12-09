SELECT
    stg_qa_dd.*,
    src_msib.msib_segment1 AS assy,
    src_msib.msib_description AS assy_desc,
    src_msib_aa.msib_segment1 AS assy_affected,
    src_msib_aa.msib_description AS assy_affected_desc
FROM
    {{ ref('stg_qa_dd') }}
    stg_qa_dd
    JOIN {{ ref('src_inv_mtl_system_items_b') }}
    src_msib
    ON stg_qa_dd.dd_item_id = src_msib.msib_inventory_item_id
    AND stg_qa_dd.dd_organization_id = src_msib.msib_organization_id
    JOIN {{ ref('src_inv_mtl_system_items_b') }}
    src_msib_aa
    ON stg_qa_dd.dd_affected_assembly_material = src_msib_aa.msib_segment1
    AND stg_qa_dd.dd_organization_id = src_msib_aa.msib_organization_id
    JOIN {{ ref('src_inv_mtl_system_items_b') }}
    src_msib_ac
    ON stg_qa_dd.dd_comp_item = src_msib_ac.msib_segment1
    AND stg_qa_dd.dd_organization_id = src_msib_ac.msib_organization_id
WHERE
    SUBSTR (stg_qa_dd.dd_dt_defect_code, 1, 1) IN ( 'W', 'S', 'Q')
