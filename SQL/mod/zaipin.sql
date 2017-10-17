--华为omcip  地市  载频个数 厂家
select a.omc_id,a.time_stamp,c.region_name,count(*)  from trx a,cell b,region_city c
where a.related_cell=b.int_id
and b.city_id=c.city_id
group by a.omc_id,c.region_name,a.time_stamp

select omc_id,count(*) from trx
group by omc_id

select a.trx_id,a.name,a.freq,b.bcch_feq,b.mcc from trx a,cell b,region_city c
where a.related_cell=b.int_id
and b.city_id=c.city_id
and a.omc_id=108909
and b.int_id=1666451323

select * from cell

