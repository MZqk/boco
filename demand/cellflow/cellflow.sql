set trimspool on
set feedback off 
set heading off 
set pagesize 0
set term off 
set linesize 5000

SPOOL ./aaa.csv 

select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 00:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 01:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 02:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 03:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 04:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 05:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 06:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 07:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 08:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 09:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 10:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 11:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 12:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 13:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 14:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 15:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 16:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 17:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 18:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 19:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 20:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 21:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 22:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id
union all
select  scan_start_Time||','||b.cgi||','||zh_name||','||UpOctUl/1024||','||UpOctDl/1024||',' from tpa_eutrancell_ne a,zqk0527 b,eutrancell c where a.scan_start_time=to_date('2017-05-15 23:00:00','yyyy-mm-dd hh24:mi:ss') and b.cgi=c.cgi and a.int_id=c.int_id;



SPOOL OFF
