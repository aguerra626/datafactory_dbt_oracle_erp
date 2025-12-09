SELECT 
stg_base.wpb_wip_entity_id,
stg_base.wpb_organization_id,
---------------------------
---------------------------
--variance not yet cleared
---------------------------
---------------------------
SUM(
    stg_base.wpb_pl_material_in -
        (stg_base.wpb_tl_material_out + stg_base.wpb_pl_material_out + stg_base.wpb_tl_material_var + stg_base.wpb_pl_material_var)
  ) cur_material_var,

SUM(
    stg_base.wpb_pl_material_overhead_in -
        (stg_base.wpb_tl_material_overhead_out + stg_base.wpb_pl_material_overhead_out + stg_base.wpb_tl_material_overhead_var + stg_base.wpb_pl_material_overhead_var)
  ) cur_moh_var,
SUM(
    (stg_base.wpb_tl_resource_in + stg_base.wpb_pl_resource_in) -
    (stg_base.wpb_tl_resource_out + stg_base.wpb_pl_resource_out + stg_base.wpb_tl_resource_var + stg_base.wpb_pl_resource_var)
    ) cur_resource_var,
SUM(
    stg_base.wpb_tl_outside_processing_in + stg_base.wpb_pl_outside_processing_in -
  stg_base.wpb_tl_outside_processing_out + stg_base.wpb_pl_outside_processing_out + stg_base.wpb_tl_outside_processing_var 
  + stg_base.wpb_pl_outside_processing_var
  ) cur_osp_var,
SUM(NVL(stg_base.wpb_tl_overhead_in, 0) + NVL(stg_base.wpb_pl_overhead_in, 0) 
  -(NVL(stg_base.wpb_tl_overhead_out, 0) + NVL(stg_base.wpb_pl_overhead_out, 0) + NVL(stg_base.wpb_tl_overhead_var, 0) + NVL(stg_base.wpb_pl_overhead_var, 0))
  ) cur_overhead_var,

( SUM(nvl(stg_base.wpb_pl_material_in, 0) -(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0) + nvl(stg_base.wpb_tl_material_var
  , 0) + nvl(stg_base.wpb_pl_material_var, 0))) + SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0) -(nvl(stg_base.wpb_tl_material_overhead_out, 0)
  + nvl(stg_base.wpb_pl_material_overhead_out, 0) + nvl(stg_base.wpb_tl_material_overhead_var, 0) + nvl(stg_base.wpb_pl_material_overhead_var, 0))
  ) + SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0) -(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out
  , 0) + nvl(stg_base.wpb_tl_resource_var, 0) + nvl(stg_base.wpb_pl_resource_var, 0))) + SUM(nvl(stg_base.wpb_tl_outside_processing_in, 0) + nvl(stg_base.wpb_pl_outside_processing_in
  , 0) -(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out, 0) + nvl(stg_base.wpb_tl_outside_processing_var
  , 0) + nvl(stg_base.wpb_pl_outside_processing_var, 0))) + SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in
  , 0) -(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0) + nvl(stg_base.wpb_tl_overhead_var, 0) + nvl(stg_base.wpb_pl_overhead_var, 0))) 
  ) cur_shop_cost_var,
---------------------------
---------------------------
-- Costs In: Total charges to job (Debit into WIP)
---------------------------
---------------------------
SUM(nvl(stg_base.wpb_pl_material_in, 0)) material_in,
SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0)) moh_in,
SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0)) resource_in,
SUM(nvl(stg_base.wpb_tl_outside_processing_in, 0) + nvl(stg_base.wpb_pl_outside_processing_in, 0)) osp_in,
SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in, 0)) overhead_in,
( SUM(nvl(stg_base.wpb_pl_material_in, 0)) + SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0)) + SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0)) + SUM(nvl(stg_base.wpb_tl_outside_processing_in
  , 0) + nvl(stg_base.wpb_pl_outside_processing_in, 0)) + SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in, 0)) 
  ) shop_cost_in, 
---------------------------
---------------------------
-- Costs Out: Charges liquidated upon job completion (Credit out of WIP)
---------------------------
--------------------------- 
SUM(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0)) material_out,
SUM(nvl(stg_base.wpb_tl_material_overhead_out, 0) + nvl(stg_base.wpb_pl_material_overhead_out, 0)) moh_out,
SUM(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out, 0)) resource_out,
SUM(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out, 0)) osp_out,
SUM(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0)) overhead_out,
( SUM(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0)) + SUM(nvl(stg_base.wpb_tl_material_overhead_out, 0) + nvl(stg_base.wpb_pl_material_overhead_out
  , 0)) + SUM(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out, 0)) + SUM(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out
  , 0)) + SUM(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0)) 
  ) shop_cost_out,
---------------------------
---------------------------
-- Original Variances
---------------------------
--------------------------- 
SUM(nvl(stg_base.wpb_pl_material_in, 0) -(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0))) material_var_orig,
SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0) -(nvl(stg_base.wpb_tl_material_overhead_out, 0) + nvl(stg_base.wpb_pl_material_overhead_out, 0))) moh_var_orig,
SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0) -(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out, 0))) resource_var_orig,
SUM(nvl(stg_base.wpb_tl_outside_processing_in, 0) + nvl(stg_base.wpb_pl_outside_processing_in, 0) -(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out, 0))
  ) osp_var_orig,
SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in, 0) -(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0))
  ) overhead_var_orig,
( SUM(nvl(stg_base.wpb_pl_material_in, 0) -(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0))) + SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0) -(nvl(stg_base.wpb_tl_material_overhead_out
  , 0) + nvl(stg_base.wpb_pl_material_overhead_out, 0))) + SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0) -(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out
  , 0))) + SUM(nvl(stg_base.wpb_tl_outside_processing_in, 0) + nvl(stg_base.wpb_pl_outside_processing_in, 0) -(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out
  , 0))) + SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in, 0) -(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0))) 
  ) shop_cost_var_orig,                 
---------------------------
---------------------------
-- Variances Relieved
---------------------------
--------------------------- 
SUM(nvl(stg_base.wpb_tl_material_var, 0) + nvl(stg_base.wpb_pl_material_var, 0)) mtl_var_rlvd,
SUM(nvl(stg_base.wpb_tl_material_overhead_var, 0) + nvl(stg_base.wpb_pl_material_overhead_var, 0)) mtl_ovhd_var_rlvd,
SUM(nvl(stg_base.wpb_tl_resource_var, 0) + nvl(stg_base.wpb_pl_resource_var, 0)) res_var_rlvd,
SUM(nvl(stg_base.wpb_tl_outside_processing_var, 0) + nvl(stg_base.wpb_pl_outside_processing_var, 0)) osp_var_rlvd,
SUM(nvl(stg_base.wpb_tl_overhead_var, 0) + nvl(stg_base.wpb_pl_overhead_var, 0)) ovhd_var_rlvd,
( SUM(+ nvl(stg_base.wpb_tl_material_var, 0) + nvl(stg_base.wpb_pl_material_var, 0)) + SUM(+ nvl(stg_base.wpb_tl_material_overhead_var, 0) + nvl(stg_base.wpb_pl_material_overhead_var
  , 0)) ) + SUM(+ nvl(stg_base.wpb_tl_resource_var, 0) + nvl(stg_base.wpb_pl_resource_var, 0)) + SUM(+ nvl(stg_base.wpb_tl_outside_processing_var, 0) + nvl(stg_base.wpb_pl_outside_processing_var
  , 0)) + SUM(+ nvl(stg_base.wpb_tl_overhead_var, 0) + nvl(stg_base.wpb_pl_overhead_var, 0)
  ) shop_cost_var_rlvd
FROM
{{ ref('src_wip_period_balances') }} stg_base
GROUP BY 
   stg_base.wpb_wip_entity_id,
   stg_base.wpb_organization_id