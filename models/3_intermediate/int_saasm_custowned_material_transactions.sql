SELECT
    int_base.mil_subinventory_code,
    int_base.mil_inventory_item_id,
    int_base.msib_segment1,
    int_base.mil_inventory_location_id,
    int_base.mil_segment1,
    int_base.mil_location_current_units,
    int_base.custowned_transaction_quantity,
    int_base.custowned_transaction_id,
    int_base.custowned_transaction_type_id,
    int_base.custowned_locator_id,
    int_base.custowned_subinventory_code,
    int_base.custowned_transaction_reference,
    int_base.custowned_reason_id,
    int_base.lu_mtl_tt_transaction_type_name,
    int_base.lu_mtl_tt_description,
    int_base.lu_mtl_tr_reason_name,
    int_base.lu_mtl_tr_description,    
    FROM_TZ(CAST(NVL(int_base.custowned_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' 
            AS transacted_at_cst
FROM
    {{ ref('stg_msib_lf_mp_mt_custowned_mil') }}
    int_base
WHERE
    int_base.msib_segment1 LIKE '%-CO'
    AND int_base.mil_segment1 NOT IN (
        'A-01-01-CO',
        'COCAB1-1-1'
    )
    and (lu_mtl_tr_reason_id != 615 -- GCP TRANSACTIONS
    or lu_mtl_tr_reason_id is null)
