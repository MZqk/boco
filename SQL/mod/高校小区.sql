--create table schoolcell (scgi varchar2(128),city_name varchar2(255))
drop table schoolcell 
--select * from schoolcell for update
create table schoolcell as select * from tmp_schoolcell
create index INDEX_CGI on SCHOOLCELL (SCGI)

create table zqkschool as select scgi from schoolcell
create table tmp_schoolcell (scgi varchar2(128),city_name varchar2(255))

select * from tmp_schoolcell for update
select count(*) from schoolcell;

select count(*) from schoolcell where scgi not in (select addcgi from tmp_schoolcell)

/*select a.scan_start_time,
       c.city_name,
       c.scgi,
       upoctul,
       upoctdl,
       nvl(sfb_divfloat_1(PuschPrbTotUl_boco,PuschPrbTot_boco),0),
       nvl(sfb_divfloat_1(PdschPrbTotDl_boco,PdschPrbTot_boco),0),
       EffectiveConnMax,
       EffectiveConnMean,
       Connmax,
       ConnMean,
       Nbrsuccestab
from tpa_eutrancell_ne a, eutrancell b,schoolcell c
where a.scan_start_time >=
      to_date('2017-06-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
and a.scan_start_time <=
      to_date('2017-06-30 23:00:00', 'yyyy-mm-dd hh24:mi:ss')
and a.int_id = b.int_id
and b.cgi=c.scgi