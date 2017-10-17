/*tpa_eutrancell_ne*/
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tpa_eutrancell_ne
where scan_start_time>=TRUNC(sysdate-1,'DD')
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss');

/*tpa_eutr_prb_ne*/
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tpa_eutr_prb_ne
where scan_start_time>=TRUNC(sysdate-1,'DD')
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
having count(*)>1000
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss');

/*tpd_sts_cell*/
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tpd_sts_cell
where scan_start_time>=TRUNC(sysdate-1,'DD')
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss');

/*tpa_sts_cell_ne*/
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tpa_sts_cell_ne 
where scan_start_time>=TRUNC(sysdate-1,'DD')
and sum_level=0
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss');

/*tap_ao_ids_eutrancell*/
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tap_ao_ids_eutrancell
where scan_start_time>=TRUNC(sysdate-1,'DD')
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss');

/*tpa_eutrancell_oth_ne*/
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tpa_eutrancell_oth_ne
where scan_start_time>=TRUNC(sysdate-1,'DD')
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss');