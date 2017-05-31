#!/bin/csh
#六维表汇总
source ~/.cshrc
#直接运行脚本
#脚本跑完后在web上执行所需调度

cfg1=tpa_cm_lte_sum_new.cfg
cfg2=tpa_pm_lte_sum.cfg
cfg3=tpa_pm_lte_serv.cfg
cfg4=tpa_structureopt_lte_sum.cfg
gsmabc=tpa_six_dimension_sum.cfg

yesterday="`perl -e "use POSIX qw(strftime); print strftime '%Y-%m-%d' , localtime( time()-3600*24*1)"` 00:00:00"
today="`date +%Y-%m-%d` 00:00:00"

for cfg in $cfg1 $cfg2 $cfg3 $cfg4 $gsmabc;do
        perl $DB_PATH/ReportSum/bin/foa_tpa_sts_gsmabc_sum.pl -c $cfg -t -1 -s "$yesterday" -e "$today"
        done

perl $DB_PATH/ReportSum/bin/foa_tpa_sts_detail_sum.pl -c tpa_pm_lte_detail_sum.cfg -h 1 -s "$yesterday" -e "$today"
perl $DB_PATH/ReportSum/bin/foa_tpa_sts_detail_sum.pl -c tpa_mr_lte_detail_sum.cfg -h 1 -s "$yesterday" -e "$today"

#原汇总语句
#perl $DB_PATH/ReportSum/bin/foa_tpa_sts_gsmabc_sum.pl -c tpa_cm_lte_sum_new.cfg -t 1  -s "2017-04-27 00:00:00"   -e "2017-04-28 00:00:00";
#perl $DB_PATH/ReportSum/bin/foa_tpa_sts_detail_sum.pl -c tpa_pm_lte_detail_sum.cfg -h 1 -s "2017-04-27 00:00:00"   -e "2017-04-28 00:00:00";
#perl $DB_PATH/ReportSum/bin/foa_tpa_sts_detail_sum.pl -c tpa_mr_lte_detail_sum.cfg -h 1 -s "2017-04-27 00:00:00"   -e "2017-04-28 00:00:00";
#perl $DB_PATH/ReportSum/bin/foa_tpa_sts_gsmabc_sum.pl -c tpa_pm_lte_sum.cfg -t 1 -s "2017-04-27 00:00:00"   -e "2017-04-28 00:00:00";
#perl $DB_PATH/ReportSum/bin/foa_tpa_sts_gsmabc_sum.pl -c tpa_pm_lte_serv.cfg -t 1 -s "2017-04-27 00:00:00"   -e "2017-04-28 00:00:00";
#perl $DB_PATH/ReportSum/bin/foa_tpa_sts_gsmabc_sum.pl -c tpa_structureopt_lte_sum.cfg -t 1  -s "2017-04-27 00:00:00"   -e "2017-04-28 00:00:00";
#perl $DB_PATH/ReportSum/bin/foa_tpa_sts_gsmabc_sum.pl -c tpa_six_dimension_sum.cfg -t 1 -s "2017-04-27 00:00:00"   -e "2017-04-28 00:00:00";                                                                                                                                                  ~                                                                                                                                
