select omc_id,to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tpd_eutrancell_1_q 
where scan_start_time>=to_date('2017-04-12 03:00:00','yyyy-mm-dd hh24:mi:ss')
and scan_start_time<=to_date('2017-04-12 03:15:00','yyyy-mm-dd hh24:mi:ss')
group by omc_id,to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
having count(*)>1000
order by omc_id,to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')