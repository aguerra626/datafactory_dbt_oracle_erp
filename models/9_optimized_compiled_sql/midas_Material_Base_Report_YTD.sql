
SELECT
    assembly,
    item_status,
    item_cat,
    class_code,
    round(SUM(base_matl),2) ytd_base_material,
    SUM(qty) ytd_units,
    round(unit_cost,2) unit_cost
FROM
    (
        SELECT
            msi.segment1                     assembly,
            msi.inventory_item_status_code   item_status,
            mcb.segment1                     item_cat,
            wdj.class_code,
            wt.transaction_quantity          base_matl,
            wt.transaction_quantity / wt.usage_rate_or_amount qty, --calculate qty
            wt.usage_rate_or_amount          unit_cost --use unit cost from transaction
        FROM
            apps.mtl_parameters             p,
            apps.wip_transaction_accounts   wta,
            apps.wip_transactions           wt,
            apps.wip_entities               we,
            apps.wip_discrete_jobs          wdj,
            apps.mfg_lookups                lu1,
            apps.mfg_lookups                lu2,
            apps.bom_resources              br,
            apps.mtl_system_items           msi,
            apps.mtl_item_categories        mic,
            apps.mtl_categories_b           mcb
        WHERE
            p.organization_code = 'NSS'
            AND p.organization_id = wt.organization_id
            AND wta.transaction_id = wt.transaction_id
            AND wta.organization_id = wt.organization_id
            AND we.wip_entity_id = wta.wip_entity_id
            AND wta.organization_id = we.organization_id
            AND wdj.wip_entity_id = wt.wip_entity_id
            AND wdj.organization_id = wt.organization_id
            AND lu1.lookup_type = 'WIP_TRANSACTION_TYPE'
            AND lu1.lookup_code = wt.transaction_type
            AND lu1.meaning = 'Resource transaction'
            AND br.resource_id = wta.resource_id
            AND br.resource_code = 'ConvOH'
            AND lu2.lookup_type = 'CST_ACCOUNTING_LINE_TYPE'
            AND lu2.lookup_code = wta.accounting_line_type
            AND lu2.meaning = 'WIP valuation'
            AND wdj.organization_id = msi.organization_id
            AND wdj.primary_item_id = msi.inventory_item_id
            AND msi.organization_id = mic.organization_id
            AND msi.inventory_item_id = mic.inventory_item_id
            AND mic.category_set_id = 43
            AND mic.category_id = mcb.category_id
            AND trunc(wt.transaction_date) >= trunc((
                SELECT
                    year_start_date
                FROM
                    gl.gl_periods
                WHERE
                    period_name = :PAR_PERIOD
                    AND period_set_name = 'BAE_CALENDAR'
            ))
            AND trunc(wt.transaction_date) <= trunc((
                SELECT
                    end_date
                FROM
                    gl.gl_periods
                WHERE
                    period_name = :PAR_PERIOD
                    AND period_set_name = 'BAE_CALENDAR'
            ))
    )
GROUP BY
    assembly,
    item_status,
    item_cat,
    class_code,
    unit_cost