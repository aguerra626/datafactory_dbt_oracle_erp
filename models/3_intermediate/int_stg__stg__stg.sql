
/*
1. business process: tracking wip qty in queue, quality rejects, and quality reroutes 
2. declare grain: one row per WIP ENTITY ID per OP SEQ NUM per OP DESC per ORGANIZATION ID
3. identify dimensions: 
    dim_wip_jobs, 
    dim_wip_jobs_and_operations,
    dim_reservations_on_sales_orders,
    dim_departments_from,
    dim_item_master,
    dim_quality_results,
    dim_quality_rejects,
    dim_quality_reroutes
*/
