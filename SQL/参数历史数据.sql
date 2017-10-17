/*历史数据*/
select (select count(*) from tcc_cell where scan_start_time=TRUNC(sysdate,'DD')) tcc_cell  from taa_onerow
union all
select (select count(*) from tcc_trx where scan_start_time=TRUNC(sysdate,'DD')) tcc_trx  from taa_onerow
union all
select (select count(*) from tcc_adjacent where scan_start_time=TRUNC(sysdate,'DD')) tcc_adjacent  from taa_onerow
union all
select (select count(*) from tcc_adjacent_td where scan_start_time=TRUNC(sysdate,'DD')) tcc_adjacent_td  from taa_onerow
union all
select (select count(*) from tcc_utrancell where scan_start_time=TRUNC(sysdate,'DD')) tcc_utrancell  from taa_onerow
union all
select (select count(*) from tcc_carrier where scan_start_time=TRUNC(sysdate,'DD')) tcc_carrier  from taa_onerow
union all
select (select count(*) from tcc_utranrelation where scan_start_time=TRUNC(sysdate,'DD')) tcc_utranrelation  from taa_onerow
union all
select (select count(*) from tcc_gsmrelation where scan_start_time=TRUNC(sysdate,'DD')) tcc_gsmrelation  from taa_onerow
union all
select (select count(*) from tcc_enodeb where scan_start_time=TRUNC(sysdate,'DD')) tcc_enodeb  from taa_onerow
union all
select (select count(*) from tcc_eutrancell where scan_start_time=TRUNC(sysdate,'DD')) tcc_eutrancell  from taa_onerow
union all
select (select count(*) from tcc_eutrancell_para1 where scan_start_time=TRUNC(sysdate,'DD')) tcc_eutrancell_para1  from taa_onerow
union all
select (select count(*) from tcc_eutrancell_para2 where scan_start_time=TRUNC(sysdate,'DD')) tcc_eutrancell_para2  from taa_onerow
union all
select (select count(*) from tcc_eutranrelationtdd where scan_start_time=TRUNC(sysdate,'DD')) tcc_eutranrelationtdd  from taa_onerow
union all
select (select count(*) from tcc_utranrelationtdd where scan_start_time=TRUNC(sysdate,'DD')) tcc_utranrelationtdd  from taa_onerow
union all
select (select count(*) from tcc_gsmrelationtdd where scan_start_time=TRUNC(sysdate,'DD')) tcc_gsmrelationtdd from taa_onerow
union all
select (select count(*) from tcc_managedelement where scan_start_time=TRUNC(sysdate,'DD')) tcc_managedelement from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_ENBAlgSwitch where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_ENBAlgSwitch from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_DRX where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_DRX from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_RRCCONSTIMER where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_RRCCONSTIMER from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_CELLDPDSCHPA where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_CELLDPDSCHPA from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_CELLALGOSWIT where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_CELLALGOSWIT from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_INTRFREQHOGP where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_INTRFREQHOGP from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_INTFREQHOGP where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_INTFREQHOGP from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_INTRATHOCOMM where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_INTRATHOCOMM from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_eutrancell1 where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_eutrancell1 from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_CEHOPARACFG where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_CEHOPARACFG from taa_onerow
union all
select (select count(*) from tcc_thw_par_tdl_cnoperahocfg where scan_start_time=TRUNC(sysdate,'DD')) tcc_thw_par_tdl_cnoperahocfg from taa_onerow
union all
select (select count(*) from tcc_tzx_par_tdl_eutrancell1 where scan_start_time=TRUNC(sysdate,'DD')) tcc_tzx_par_tdl_eutrancell1 from taa_onerow
union all
select (select count(*) from tcc_tzx_par_tdl_UeTimerTDD where scan_start_time=TRUNC(sysdate,'DD')) tcc_tzx_par_tdl_UeTimerTDD from taa_onerow
union all
select (select count(*) from tcc_tzx_par_tdl_PowerContrDL where scan_start_time=TRUNC(sysdate,'DD')) tcc_tzx_par_tdl_PowerContrDL from taa_onerow
union all
select (select count(*) from tcc_tzx_par_tdl_PowerContrUL where scan_start_time=TRUNC(sysdate,'DD')) tcc_tzx_par_tdl_PowerContrUL from taa_onerow
union all
select (select count(*) from tcc_tzx_par_tdl_eutrcellmeas where scan_start_time=TRUNC(sysdate,'DD')) tcc_tzx_par_tdl_eutrcellmeas from taa_onerow
union all
select (select count(*) from tcc_tzx_par_tdl_ueeutranmeas where scan_start_time=TRUNC(sysdate,'DD')) tcc_tzx_par_tdl_ueeutranmeas from taa_onerow
union all
select (select count(*) from tcc_tzx_par_tdl_ecellequifun where scan_start_time=TRUNC(sysdate,'DD')) tcc_tzx_par_tdl_ecellequifun from taa_onerow
union all
select (select count(*) from tcc_tnk_par_tdl_enodeb1 where scan_start_time=TRUNC(sysdate,'DD')) tcc_tnk_par_tdl_enodeb1 from taa_onerow
union all
select (select count(*) from tcc_tnk_par_tdl_eutrancell1 where scan_start_time=TRUNC(sysdate,'DD')) tcc_tnk_par_tdl_eutrancell1 from taa_onerow
union all
select (select count(*) from tcc_tnk_par_tdl_eutrancell3 where scan_start_time=TRUNC(sysdate,'DD')) tcc_tnk_par_tdl_eutrancell3 from taa_onerow
union all
select (select count(*) from tcc_tnk_par_tdl_eutrancell4 where scan_start_time=TRUNC(sysdate,'DD')) tcc_tnk_par_tdl_eutrancell4 from taa_onerow
union all
select (select count(*) from tcc_tal_par_tdl_ActivatServ where scan_start_time=TRUNC(sysdate,'DD')) tcc_tal_par_tdl_ActivatServ from taa_onerow
union all
select (select count(*) from tcc_tal_par_tdl_TraffBasReCo where scan_start_time=TRUNC(sysdate,'DD')) tcc_tal_par_tdl_TraffBasReCo from taa_onerow
union all
select (select count(*) from tcc_tal_par_tdl_PoweOffsetCfg where scan_start_time=TRUNC(sysdate,'DD')) tcc_tal_par_tdl_PoweOffsetCfg from taa_onerow
union all
select (select count(*) from tcc_tal_par_tdl_ULPowContrCo where scan_start_time=TRUNC(sysdate,'DD')) tcc_tal_par_tdl_ULPowContrCo from taa_onerow
union all
select (select count(*) from tcc_tal_par_tdl_repconfeutra where scan_start_time=TRUNC(sysdate,'DD')) tcc_tal_par_tdl_repconfeutra from taa_onerow;
/*地名*/
select a.scan_start_time,b.region_name,count(a.int_id) from tcc_eutrancell a ,region_city b
where a.scan_start_time=TRUNC(sysdate,'DD')
and a.city_id=b.city_id
group by a.scan_start_time,b.region_name
order by a.scan_start_time,b.region_name
