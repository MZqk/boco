#!/bin/csh
source ~/.cshrc
#++++脚本运行格式++++
#sh tpd_eutrancell.sh 03
#脚本后数字参数为所需时间点，请补采一个时间点汇总

hour=$1
daytime=`date +%Y-%m-%d`
perl /opt/BOCO.NPM/DB/ReportSum/bin/Tpa_eutrancell_hour_sum.pl -c Tpa_eutrancell.cfg -s "$daytime ${hour}:00:00" -e "$daytime ${hour}:59:59">>tpd_eutrancell.sh.log 


# 如果数据缺失发生在前一天，则第二天采集汇总后需重新进行天粒度汇总（不加时间默认p汇总前一天的数据）
#perl $DB_PATH/ReportSum/bin/foa_tpa_td_sum_day.pl -c Tpa_eutrancell.cfg -s "$starttime" -e "$endtime"

#以下为prb汇总

perl /opt/BOCO.NPM/DB/ReportSum/bin/Tpa_lte_hour_ne.pl -c Tpa_eutr_prb_yunnan.cfg -s "$start"  -e "$end"
perl /opt/BOCO.NPM/DB/ReportSum/bin/Tpa_lte_hour_sum.pl -c Tpa_eutr_prb_yunnan.cfg -s "$start"  -e "$end"

