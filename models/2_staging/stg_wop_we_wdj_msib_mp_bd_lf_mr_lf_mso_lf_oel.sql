SELECT
    stg_base.*,
    stg_join1.*,
    stg_join2.*,
    stg_join3.*
FROM
    {{ ref('stg_wop_we_wdj_msib_mp_bd') }}
    stg_base
    LEFT JOIN {{ ref('src_inv_mtl_reservations') }}
    stg_join1
    ON stg_base.wdj_wip_entity_id = stg_join1.mr_supply_source_header_id
    and stg_join1.mr_demand_source_type_id in (2, 8) -- Reservations for Sales Orders, Internal Order demand
    and stg_join1.mr_supply_source_type_id = 5 -- Reservations for WIP Jobs
    LEFT JOIN {{ ref('src_inv_mtl_sales_orders') }}
    stg_join2
    ON stg_join1.mr_demand_source_header_id = stg_join2.mso_sales_order_id
    LEFT JOIN {{ ref('src_oe_order_lines_all') }}
    stg_join3
    ON stg_join1.mr_demand_source_line_id = stg_join3.oel_line_id

