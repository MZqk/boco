set trimspool on
set feedback off 
set heading off 
set pagesize 0
set term off 
set linesize 5000

SPOOL ./aaa.csv

select a.scan_start_time||','||
       c.city_name||','||
           c.scgi||','||
               upoctul||','||
                   upoctdl||','||
                       nvl(sfb_divfloat_1(PuschPrbTotUl_boco,PuschPrbTot_boco),0)||','||
                           nvl(sfb_divfloat_1(PdschPrbTotDl_boco,PdschPrbTot_boco),0)||','||
                               EffectiveConnMax||','||
                                   EffectiveConnMean||','||
                                       Connmax||','||
                                           ConnMean||','||
                                               Nbrsuccestab||','
                                            from tpa_eutrancell_ne a, eutrancell b,schoolcell c
                                            where a.scan_start_time >=TRUNC(sysdate - 1,'DD')
                                            and a.scan_start_time <=TRUNC(sysdate - 1) +23/(24)
                                            and a.int_id = b.int_id
                                            and b.cgi=c.scgi;


                                            SPOOL OFF

                                            quit;
