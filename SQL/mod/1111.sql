select a.scan_start_time,c.region_name,b.name ,b.cgi,NbrMeanEstab_1,NbrPktUl_1,NbrPktDl_1,NbrPktLossUl_1,NbrPktLossDl_1
from tpa_eutrancell_ne a,tcc_eutrancell b,region_city c
where  a.scan_start_time >=to_date('2017-06-24 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
   and a.scan_start_time <=to_date('2017-06-24 23:00:00', 'yyyy-mm-dd hh24:mi:ss')
and b.scan_start_time =to_date('2017-06-24 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
and a.int_id=b.int_id
and a.ne_type=8105
and a.sum_level=0
and b.city_id=c.city_id
and nvl(NbrMeanEstab_1,0)<>0
and nvl(NbrPktUl_1,0)=0
and nvl(NbrPktDl_1,0)=0 
and nvl(NbrPktLossUl_1,0)=0
and nvl(NbrPktLossDl_1,0)=0
