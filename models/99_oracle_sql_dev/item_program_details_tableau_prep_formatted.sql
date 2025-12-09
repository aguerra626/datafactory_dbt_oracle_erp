WITH dbt__cte__src_inv_mtl_item_categories__ AS (
    SELECT
        inventory_item_id AS mic_inventory_item_id,
        organization_id AS mic_organization_id,
        category_set_id AS mic_category_set_id,
        category_id AS mic_category_id,
        last_update_date AS mic_last_update_date,
        last_updated_by AS mic_last_updated_by,
        creation_date AS mic_creation_date,
        created_by AS mic_created_by,
        last_update_login AS mic_last_update_login,
        request_id AS mic_request_id,
        program_application_id AS mic_program_application_id,
        program_id AS mic_program_id,
        program_update_date AS mic_program_update_date
    FROM
        apps.mtl_item_categories
    WHERE
        organization_id = 1213
),
dbt__cte__src_inv_mtl_category_sets_b__ AS (
    SELECT
        user_creation_allowed_flag AS mcs_user_creation_allowed_flag,
        raise_item_cat_assign_event AS mcs_raise_item_cat_assign_event,
        raise_alt_cat_hier_chg_event AS mcs_raise_alt_cat_hier_chg_event,
        raise_catalog_cat_chg_event AS mcs_raise_catalog_cat_chg_event,
        zd_edition_name AS mcs_zd_edition_name,
        zd_sync AS mcs_zd_sync,
        category_set_id AS mcs_category_set_id,
        structure_id AS mcs_structure_id,
        validate_flag AS mcs_validate_flag,
        control_level AS mcs_control_level,
        default_category_id AS mcs_default_category_id,
        last_update_date AS mcs_last_update_date,
        last_updated_by AS mcs_last_updated_by,
        creation_date AS mcs_creation_date,
        created_by AS mcs_created_by,
        last_update_login AS mcs_last_update_login,
        mult_item_cat_assign_flag AS mcs_mult_item_cat_assign_flag
    FROM
        apps.mtl_category_sets_b
),
dbt__cte__src_inv_mtl_category_sets_tl__ AS (
    SELECT
        zd_edition_name AS mcst_zd_edition_name,
        zd_sync AS mcst_zd_sync,
        category_set_id AS mcst_category_set_id,
        LANGUAGE AS mcst_language,
        source_lang AS mcst_source_lang,
        category_set_name AS mcst_category_set_name,
        description AS mcst_description,
        last_update_date AS mcst_last_update_date,
        last_updated_by AS mcst_last_updated_by,
        creation_date AS mcst_creation_date,
        created_by AS mcst_created_by,
        last_update_login AS mcst_last_update_login
    FROM
        apps.mtl_category_sets_tl
),
dbt__cte__src_inv_mtl_categories_b__ AS (
    SELECT
        zd_edition_name AS mc_zd_edition_name,
        zd_sync AS mc_zd_sync,
        category_id AS mc_category_id,
        structure_id AS mc_structure_id,
        description AS mc_description,
        disable_date AS mc_disable_date,
        segment1 AS mc_segment1,
        segment2 AS mc_segment2,
        summary_flag AS mc_summary_flag,
        enabled_flag AS mc_enabled_flag,
        last_update_date AS mc_last_update_date,
        last_updated_by AS mc_last_updated_by,
        creation_date AS mc_creation_date,
        created_by AS mc_created_by,
        last_update_login AS mc_last_update_login
    FROM
        apps.mtl_categories_b
),
dbt__cte__src_fnd_lookup_values__ AS (
    SELECT
        lookup_code,
        lookup_type,
        meaning
    FROM
        apps.fnd_lookup_values
),
dbt__cte__stg_mtl_mic_mcs_mcst_mc__ AS (
    SELECT
        src_mic.*,
        src_mcs.*,
        src_mcst.*,
        src_mc.*
    FROM
        dbt__cte__src_inv_mtl_item_categories__ src_mic
        INNER JOIN dbt__cte__src_inv_mtl_category_sets_b__ src_mcs
        ON src_mic.mic_category_set_id = src_mcs.mcs_category_set_id
        INNER JOIN dbt__cte__src_inv_mtl_category_sets_tl__ src_mcst
        ON src_mcs.mcs_category_set_id = src_mcst.mcst_category_set_id
        AND src_mcst.mcst_language = userenv('LANG') -- pk mcst.language
        INNER JOIN dbt__cte__src_inv_mtl_categories_b__ src_mc
        ON src_mic.mic_category_id = src_mc.mc_category_id
        INNER JOIN dbt__cte__src_fnd_lookup_values__ lu1
        ON src_mcs.mcs_control_level = lu1.lookup_code
        AND lu1.lookup_type = 'ITEM_CONTROL_LEVEL_GUI'
    WHERE
        src_mic.mic_organization_id = 1213
        AND src_mcst.mcst_category_set_name IN ('PROGRAM_DEFAULT')
),
dbt__cte__src_inv_mtl_system_items_b__ AS (
    SELECT
        inventory_item_id AS msib_inventory_item_id,
        organization_id AS msib_organization_id,
        description AS msib_description,
        buyer_id AS msib_buyer_id,
        segment1 AS msib_segment1,
        end_assembly_pegging_flag AS msib_end_assembly_pegging_flag,
        inventory_item_status_code AS msib_inventory_item_status_code,
        planner_code AS msib_planner_code,
        planning_make_buy_code AS msib_planning_make_buy_code,
        full_lead_time AS msib_full_lead_time,
        program_application_id AS msib_program_application_id
    FROM
        apps.mtl_system_items_b
    WHERE
        organization_id = 1213
),
dbt__cte__src_inv_mtl_planners__ AS (
    SELECT
        planner_code AS mp_planner_code,
        organization_id AS mp_organization_id,
        description AS mp_description
    FROM
        apps.mtl_planners
    WHERE
        organization_id = 1213
),
dbt__cte__stg_msib_lf_mp__ AS (
    SELECT
        src_msib.*,
        src_mp.*
    FROM
        dbt__cte__src_inv_mtl_system_items_b__ src_msib
        LEFT JOIN dbt__cte__src_inv_mtl_planners__ src_mp
        ON src_msib.msib_planner_code = src_mp.mp_planner_code
        AND src_msib.msib_organization_id = src_mp.mp_organization_id
),
dbt__cte__int_item_program_details__ AS (
    SELECT
        int_base.mic_inventory_item_id,
        int_base.mic_organization_id,
        int_base.mcst_category_set_name,
        int_base.mcst_description,
        int_base.mc_segment1,
        int_base.mc_segment2,
        stg_join1.msib_organization_id,
        stg_join1.msib_inventory_item_id,
        stg_join1.msib_segment1,
        stg_join1.msib_end_assembly_pegging_flag,
        stg_join1.msib_inventory_item_status_code,
        stg_join1.msib_planner_code,
        stg_join1.msib_planning_make_buy_code,
        stg_join1.msib_full_lead_time,
        stg_join1.mp_planner_code,
        stg_join1.mp_description
    FROM
        dbt__cte__stg_mtl_mic_mcs_mcst_mc__ int_base
        JOIN dbt__cte__stg_msib_lf_mp__ stg_join1
        ON int_base.mic_inventory_item_id = stg_join1.msib_inventory_item_id
        AND int_base.mic_organization_id = stg_join1.msib_organization_id
    WHERE
        stg_join1.msib_planning_make_buy_code = 1
)
SELECT
    base.mcst_category_set_name,
    base.mcst_description,
    base.mc_segment1 AS "Program",
    base.mc_segment2,
    base.msib_inventory_item_id,
    base.msib_segment1 AS "Part Number",
    base.msib_end_assembly_pegging_flag AS "End Assy Pegging Flag",
    base.msib_inventory_item_status_code AS "Item Status",
    base.msib_planning_make_buy_code AS "Make Buy Code",
    base.msib_full_lead_time AS "Full Lead Time",
    base.mp_planner_code AS "Planner Code",
    base.mp_description AS "Planner"
FROM
    dbt__cte__int_item_program_details__ base
