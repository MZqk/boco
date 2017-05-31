#!/bin/csh
source ~/.cshrc
#++++++++运行脚本格式为+++++++++
#csh average.sh 01 02 03 04 
#脚本后的数字参数为需要补采的时间


file1="/opt/BOCO.NPM/DB/ReportSum/bin/tpa_mr_ltehubei.pl"
file2="/opt/BOCO.NPM/DB/ReportSum/bin/tpa_mr_lte_servhubei.pl"
cfg="tla_averagehubei.cfg"
#获取前一天的时间格式
daydate=`perl -e "use POSIX qw(strftime); print strftime '%Y-%m-%d' , localtime( time()-3600*24*1) "`

for hour in $@ ;do
                perl $file1 -c $cfg -u 0 -s "$daydate ${hour}:00:00" -e "$daydate ${hour}:59:59"
                perl $file2 -c $cfg -u 0 -s "$daydate ${hour}:00:00" -e "$daydate ${hour}:59:59"
		done
#以下为汇总天粒度
perl $file1 -c $cfg -u 1 -s "$daydate 00:00:00" -e "$daydate 23:59:59"
perl $file2 -c $cfg -u 1 -s "$daydate 00:00:00" -e "$daydate 23:59:59"

#原语句
#perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_mr_ltehubei.pl -c tla_averagehubei.cfg -u 1 -s "2017-05-22 00:00;00" -e "2017-05-22 23:59:59"
#perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_mr_lte_servhubei.pl -c tla_averagehubei.cfg -u 1 -s "2017-05-22 00:00;00" -e "2017-05-22 23:59:59"
#perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_mr_ltehubei.pl -c tla_averagehubei.cfg -u 0 -s "2017-05-22  00:00:00" -e "2017-05-22 00:59:59"
#perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_mr_lte_servhubei.pl -c tla_averagehubei.cfg -u 0 -s "2017-05-22 00:00:00" -e "2017-05-22 00:59:59
