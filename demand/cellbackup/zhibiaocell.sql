set trimspool on
set feedback off 
set heading off 
set pagesize 0
set term off 
set linesize 5000

SPOOL ./aaa.csv

select 
tcc_eutrancell.scan_start_time||','||
REGION_CITY.REGION_NAME||','||
         (CASE tcc_eutrancell.VENDOR_ID
           WHEN 12 THEN
            '贝尔'
           WHEN 9 THEN
            '大唐'
           WHEN 201 THEN
            '新邮通'
           WHEN 8 THEN
            '华为'
           WHEN 203 THEN
            '普天'
           WHEN 1 THEN
            '爱立信'
           WHEN 7 THEN
            '中兴'
           WHEN 202 THEN
            '烽火'
           WHEN 4 THEN
            '诺西'
           ELSE
            ''
         END)||','||
         tcc_eutrancell.TAC||','||
         tcc_eutrancell.CGI||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_1),
                      0,
                      0,
                      SUM(TPA_eutrancell_OTH_NE.NBRSUCCESTAB_1) /
                      SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_1)),
               6)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_1),
                      0,
                      0,
                      SUM(TPA_eutrancell_OTH_NE.NBRSUCCESTAB_1) /
                      SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_1)) *
               DECODE(SUM(TPA_eutrancell_OTH_NE.ATTCONNESTAB),
                      0,
                      0,
                      SUM(TPA_eutrancell_OTH_NE.SUCCCONNESTAB) /
                      SUM(TPA_eutrancell_OTH_NE.ATTCONNESTAB)),
               6)||','||
         ROUND((DECODE((SUM(TPA_eutrancell_OTH_NE.NBRSUCCESTAB_1)),
                       0,
                       0,
                       ((SUM(TPA_eutrancell_OTH_NE.NBRREQRELENB_1)) -
                       (SUM(TPA_eutrancell_OTH_NE.NBRREQRELENB_NORMAL_1)) +
                       (SUM(TPA_eutrancell_OTH_NE.HOFAIL_1))) /
                       (SUM(TPA_eutrancell_OTH_NE.NBRSUCCESTAB_1)))),
               6)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.ATTOUTINTERENBS1_1 +
                          TPA_eutrancell_OTH_NE.ATTOUTINTERENBX2_1 +
                          TPA_eutrancell_OTH_NE.ATTOUTINTRAENB_1),
                      0,
                      0,
                      (SUM(TPA_eutrancell_OTH_NE.SUCCOUTINTERENBS1_1 +
                           TPA_eutrancell_OTH_NE.SUCCOUTINTERENBX2_1 +
                           TPA_eutrancell_OTH_NE.SUCCOUTINTRAENB_1)) /
                      (SUM(TPA_eutrancell_OTH_NE.ATTOUTINTERENBS1_1 +
                           TPA_eutrancell_OTH_NE.ATTOUTINTERENBX2_1 +
                           TPA_eutrancell_OTH_NE.ATTOUTINTRAENB_1))),
               6)||','||
         ROUND(ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.ATTOUTGERAN),
                            0,
                            0,
                            SUM(TPA_eutrancell_OTH_NE.SUCCOUTGERAN) /
                            SUM(TPA_eutrancell_OTH_NE.ATTOUTGERAN)),
                     4),
               6)||','||
         ROUND(AVG(TPA_eutrancell_OTH_NE.AVGTIMEOUTGERAN), 6)||','||
         ROUND(ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.DTCHPRBASSNTOTALUL_1),
                            0,
                            0,
                            (SUM(TPA_eutrancell_OTH_NE.UPOCTUL_1 * 8)) /
                            SUM(TPA_eutrancell_OTH_NE.DTCHPRBASSNTOTALUL_1)),
                     4),
               6)||','||
         ROUND(ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.DTCHPRBASSNTOTALDL_1),
                            0,
                            0,
                            (SUM(TPA_eutrancell_OTH_NE.UPOCTDL_1 * 8)) /
                            SUM(TPA_eutrancell_OTH_NE.DTCHPRBASSNTOTALDL_1)),
                     4),
               6)||','||
         ROUND(ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.TTITOTUL),
                            0,
                            0,
                            SUM(TPA_eutrancell_OTH_NE.DTCHPRBASSNTOTALUL_1) /
                            SUM(TPA_eutrancell_OTH_NE.TTITOTUL)),
                     3),
               6)||','||
         ROUND(ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.TTITOTDL),
                            0,
                            0,
                            SUM(TPA_eutrancell_OTH_NE.DTCHPRBASSNTOTALDL_1) /
                            SUM(TPA_eutrancell_OTH_NE.TTITOTDL)),
                     3),
               6)||','||
         ROUND(1 - ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRINITTBDL_1),
                                0,
                                0,
                                (SUM(TPA_eutrancell_OTH_NE.NBRSUCCINITTBDL_QPSK_1 +
                                     TPA_eutrancell_OTH_NE.NBRSUCCINITTBDL_16QAM_1 +
                                     TPA_eutrancell_OTH_NE.NBRSUCCINITTBDL_64QAM_1)) /
                                SUM(TPA_eutrancell_OTH_NE.NBRINITTBDL_1)),
                         4),
               6)||','||
         ROUND(1 - ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRINITTBUL_1),
                                0,
                                0,
                                (SUM(TPA_eutrancell_OTH_NE.NBRSUCCINITTBUL_QPSK_1 +
                                     TPA_eutrancell_OTH_NE.NBRSUCCINITTBUL_16QAM_1 +
                                     TPA_eutrancell_OTH_NE.NBRSUCCINITTBUL_64QAM_1)) /
                                SUM(TPA_eutrancell_OTH_NE.NBRINITTBUL_1)),
                         4),
               6)||','||
         ROUND(AVG(ROUND(TPA_eutrancell_OTH_NE.UPPKTDELAYDL_1_BOCO, 6)), 6)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRTBUL_1),
                      0,
                      0,
                      SUM(TPA_eutrancell_OTH_NE.NBRSPSTBUL_1) /
                      SUM(TPA_eutrancell_OTH_NE.NBRTBUL_1)),
               6)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRTBDL_1),
                      0,
                      0,
                      SUM(TPA_eutrancell_OTH_NE.NBRSPSTBDL_1) /
                      SUM(TPA_eutrancell_OTH_NE.NBRTBDL_1)),
               6)||','||
         ROUND((SUM(TPA_eutrancell_OTH_NE.UPOCTUL_1 +
                    TPA_eutrancell_OTH_NE.UPOCTDL_1)) / 1000,
               6)||','||
         NVL(SUM(ROUND(TPA_eutrancell_OTH_NE.NBRMEANESTAB_1, 6)), 0)||','||
         NVL(SUM(ROUND(TPA_eutrancell_OTH_NE.VOLTE_VOICE_MAX_USERNUM, 6)),
             0)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_2),
                      0,
                      0,
                      SUM(TPA_eutrancell_OTH_NE.NBRSUCCESTAB_2) /
                      SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_2)),
               6)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_2),
                      0,
                      0,
                      SUM(TPA_eutrancell_OTH_NE.NBRSUCCESTAB_2) /
                      SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_2)) *
               DECODE(SUM(TPA_eutrancell_OTH_NE.ATTCONNESTAB),
                      0,
                      0,
                      SUM(TPA_eutrancell_OTH_NE.SUCCCONNESTAB) /
                      SUM(TPA_eutrancell_OTH_NE.ATTCONNESTAB)),
               6)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRLEFT_2 +
                          TPA_eutrancell_OTH_NE.NBRSUCCESTAB_2 +
                          TPA_eutrancell_OTH_NE.NBRHOINC_2),
                      0,
                      0,
                      (SUM((TPA_eutrancell_OTH_NE.NBRREQRELENB_2 -
                           TPA_eutrancell_OTH_NE.NBRREQRELENB_NORMAL_2) +
                           TPA_eutrancell_OTH_NE.HOFAIL_2)) /
                      (SUM(TPA_eutrancell_OTH_NE.NBRLEFT_2 +
                           TPA_eutrancell_OTH_NE.NBRSUCCESTAB_2 +
                           TPA_eutrancell_OTH_NE.NBRHOINC_2))),
               6)||','||
         ROUND((SUM(TPA_eutrancell_OTH_NE.UPOCTUL_2 +
                    TPA_eutrancell_OTH_NE.UPOCTDL_2)) / 1000,
               6)||','||
         NVL(SUM(ROUND(TPA_eutrancell_OTH_NE.NBRMEANESTAB_2, 6)), 0)||','||
         NVL(SUM(ROUND(TPA_eutrancell_OTH_NE.VOLTE_VIDEO_MAX_USERNUM, 6)),
             0)||','||
         ROUND(NVL(DECODE(SUM(TPA_eutrancell_OTH_NE.ATTCONNREESTAB +
                              TPA_eutrancell_OTH_NE.ATTCONNESTAB),
                          0,
                          0,
                          SUM(TPA_eutrancell_OTH_NE.ATTCONNREESTAB) /
                          (SUM(TPA_eutrancell_OTH_NE.ATTCONNREESTAB +
                               TPA_eutrancell_OTH_NE.ATTCONNESTAB))),
                   0),
               6)||','||
         ROUND((DECODE((SUM(TPA_eutrancell_OTH_NE.NBRPKTUL_1)),
                       0,
                       0,
                       (SUM(TPA_eutrancell_OTH_NE.NBRPKTLOSSUL_1)) /
                       (SUM(TPA_eutrancell_OTH_NE.NBRPKTUL_1)))),
               6)||','||
         ROUND((DECODE((SUM(TPA_eutrancell_OTH_NE.NBRPKTDL_1)),
                       0,
                       0,
                       (SUM(TPA_eutrancell_OTH_NE.NBRPKTLOSSDL_1)) /
                       (SUM(TPA_eutrancell_OTH_NE.NBRPKTDL_1)))),
               6)||','||
         NVL(SUM(NVL(TPA_eutrancell_OTH_NE.ATTOUTINTERENBX2, 0)), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.ATTOUTEXECINTERENBX2), 0)||','||
         NVL(SUM(NVL(TPA_eutrancell_OTH_NE.SUCCOUTINTERENBX2, 0)), 0)||','||
         NVL(SUM(NVL(TPA_eutrancell_OTH_NE.SUCCOUTINTERENBS1, 0)), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRSUCCESTAB_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRATTESTAB_1), 0)||','||
         NVL(SUM(NVL(TPA_eutrancell_OTH_NE.ATTCONNESTAB, 0)), 0)||','||
         NVL(SUM(NVL(TPA_eutrancell_OTH_NE.SUCCCONNESTAB, 0)), 0)||','||
         NVL(SUM(NVL(TPA_eutrancell_OTH_NE.ATTCONNREESTAB, 0)), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRREQRELENB_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRREQRELENB_NORMAL_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.HOFAIL_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRLEFT_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRHOINC_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.SUCCOUTINTERENBS1_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.SUCCOUTINTERENBX2_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.SUCCOUTINTRAENB_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.ATTOUTINTERENBS1_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.ATTOUTINTERENBX2_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.ATTOUTINTRAENB_1), 0)||','||
         NVL(SUM(NVL(TPA_eutrancell_OTH_NE.ATTOUTGERAN, 0)), 0)||','||
         NVL(SUM(NVL(TPA_eutrancell_OTH_NE.SUCCOUTGERAN, 0)), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.SUCCPREPOUTGERAN), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.FAILPREPOUTGERAN), 0)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.NBRLEFT_1 +
                          TPA_eutrancell_OTH_NE.NBRSUCCESTAB_1 +
                          TPA_eutrancell_OTH_NE.NBRHOINC_1),
                      0,
                      0,
                      (SUM((TPA_eutrancell_OTH_NE.NBRREQRELENB_1 -
                           TPA_eutrancell_OTH_NE.NBRREQRELENB_NORMAL_1) +
                           TPA_eutrancell_OTH_NE.HOFAIL_1)) /
                      (SUM(TPA_eutrancell_OTH_NE.NBRLEFT_1 +
                           TPA_eutrancell_OTH_NE.NBRSUCCESTAB_1 +
                           TPA_eutrancell_OTH_NE.NBRHOINC_1))),
               6)||','||
         ROUND(DECODE(SUM(TPA_eutrancell_OTH_NE.ATTOUTINTERENBS1_2 +
                          TPA_eutrancell_OTH_NE.ATTOUTINTERENBX2_2 +
                          TPA_eutrancell_OTH_NE.ATTOUTINTRAENB_2),
                      0,
                      0,
                      (SUM(TPA_eutrancell_OTH_NE.SUCCOUTINTERENBS1_2 +
                           TPA_eutrancell_OTH_NE.SUCCOUTINTERENBX2_2 +
                           TPA_eutrancell_OTH_NE.SUCCOUTINTRAENB_2)) /
                      (SUM(TPA_eutrancell_OTH_NE.ATTOUTINTERENBS1_2 +
                           TPA_eutrancell_OTH_NE.ATTOUTINTERENBX2_2 +
                           TPA_eutrancell_OTH_NE.ATTOUTINTRAENB_2))),
               6)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.SUCCOUTINTERENBX2_2), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.SUCCOUTINTERENBS1_2), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.SUCCOUTINTRAENB_2), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.ATTOUTINTRAENB_2), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.ATTOUTINTERENBS1_2), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.ATTOUTINTERENBX2_2), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRPKTLOSSUL_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRPKTUL_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRPKTDL_1), 0)||','||
         NVL(SUM(TPA_eutrancell_OTH_NE.NBRPKTLOSSDL_1), 0) AS C75
    from tcc_eutrancell 
    left join (select * from TPA_eutrancell_OTH_NE where  scan_start_time=TRUNC(sysdate - 1, 'DD') and   sum_level = 1 ) TPA_eutrancell_OTH_NE
    on TPA_eutrancell_OTH_NE.int_id=tcc_eutrancell.int_id 
    LEFT OUTER JOIN REGION_CITY 
    ON  TCC_EUTRANCELL.CITY_ID = REGION_CITY.CITY_ID 
    where tcc_eutrancell.scan_start_time=TRUNC(sysdate - 1, 'DD')
    GROUP BY tcc_eutrancell.scan_start_time,REGION_CITY.REGION_NAME,tcc_eutrancell.VENDOR_ID,tcc_eutrancell.CGI,tcc_eutrancell.TAC;


SPOOL OFF

quit
