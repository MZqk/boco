select count(*) from tco_pro_eutrancell a,eutrancell b
where a.int_id=b.int_id
and a.latitude is null
--and a.cgi like'%

