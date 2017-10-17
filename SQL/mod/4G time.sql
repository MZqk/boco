select id,count(*) from tmp_zqk0612
group by id
having count(*)>1

select b.id,b.time,substr(a.ENBID,-6,6),a.NETACCESS_TIME from Tco_pro_enodeb a,tmp_zqk0612 b
where b.id=substr(a.ENBID,-6,6)

select substr(ENBID,-6,6),count(*) from Tco_pro_enodeb
group by substr(ENBID,-6,6)
having count(*)>1

update Tco_pro_enodeb
   set NETACCESS_TIME = (select time
                           from tmp_zqk0612
                          where id = substr(Tco_pro_enodeb.ENBID, -6, 6)
                            and id not in (select id, count(*)
                                             from tmp_zqk0612
                                            group by id
                                           having count(*) > 1))
 where substr(ENBID, -6, 6) in (select id from tmp_zqk0612)
   and substr(ENBID, -6, 6) not in
       (select substr(ENBID, -6, 6), count(*)
          from Tco_pro_enodeb
         group by substr(ENBID, -6, 6)
        having count(*) > 1)


update Tco_pro_enodeb a
   set a.NETACCESS_TIME = (select b.time
                             from tmp_zqk0612 b
                            where b.id = substr(a.ENBID, -6, 6)
                            and b.id not in (select id, count(*)
                                             from tmp_zqk0612
                                            group by id
                                           having count(*) > 1) )
 where substr(ENBID, -6, 6) not in
       (select substr(ENBID, -6, 6), count(*)
          from Tco_pro_enodeb
         group by substr(ENBID, -6, 6)
        having count(*) > 1)
        
        
update Tco_Pro_Enodeb
set netaccess_time=(select time from tmp_zqk0612 
                    where id=substr(tco_pro_enodeb.enodeb_id,-6,6)
                    and id not in 
                               (
                               select id from tmp_zqk0612
                               group by id 
                               having count(*)>1)
                               )
where substr(enbid,-6,6) in (select id from tmp_zqk0612)
                            and substr(enbid,-6,6) not in 
                            (select substr(enbid,-6,6) from tco_pro_enodeb
                            group by substr(enbid,-6,6)
                            having count(*)>1
                            )
        