select a.scan_start_time,b.cgi,b.name,b.city_id 
from tpa_eutrancell_ne a,tcc_eutrancell b
where a.int_id=b.int_id
and NbrMeanEstab_1<>0
and NbrPktUl_1=0 or NbrPktUl_1=null
and NbrPktDl_1=0 or NbrPktDl_1=null
and NbrPktLossUl_1=0 or NbrPktLossUl_1=null
and NbrPktLossDl_1=0 or NbrPktLossDl_1=null
and a.scan_start_time >=
      to_date('2017-06-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
and a.scan_start_time <=
      to_date('2017-06-22 23:00:00', 'yyyy-mm-dd hh24:mi:ss')
      
      