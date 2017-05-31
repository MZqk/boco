#!/bin/ksh
. /etc/profile
. $HOME/.profile

cd /home/oracle/jxwy/report/zhibiaobeifen

putfile="aaa.csv"

sqlplus  niosdb/Niosoptr@jxwydb <<EOF
@/home/oracle/zqk/zhibiaocell.sql 

EOF


sed '1i\
时间,地市,厂家名称,跟踪区码,CGI,E-RAB建立成功率(QCI=1),无线接通率(QCI=1),自_E-RAB掉线率(QCI=1)_Eutrancell,VoLTE用户切换成功率,eSRVCC切换成功率,eSRVCC切换中断时延-控制面,VoLTE语音上行每PRB平均吞吐量,VoLTE语音下行每PRB平均吞吐量,VoLTE语音上行每TTI占用RB数,VoLTE语音下行每TTI占用RB数,VoLTE业务下行iBLER,VoLTE业务上行iBLER,VoLTE下行平均时延,上行半持续调度次数占比,下行半持续调度次数占比,VoLTE语音总流量,VoLTE语音话务量,VoLTE语音峰值用户数,E-RAB建立成功率(QCI=2),无线接通率(QCI=2),E-RAB掉线率(QCI=2)(小区级),volte视频总流量,volte视频话务量,volte视频峰值用户数,RRC连接重建比率,自_QCI1上行丢包率_Eutrancell,自_QCI1下行丢包率_Eutrancell,eNB间X2切换出请求次数,eNB间X2切换出执行请求次数,eNB间X2切换出成功次数,eNB间S1切换出成功次数,E-RAB建立成功数（QCI=1）,E-RAB建立请求数（QCI=1）,RRC连接建立请求次数,RRC连接建立成功次数,RRC连接重建请求次数,eNB请求释放的E-RAB数（QCI=1）,正常eNB请求释放的E-RAB数（QCI=1）,切出失败的E-RAB数（QCI=1）,遗留E-RAB数（QCI=1）,切换入E-RAB数（QCI=1）,VoLTE用户eNB间S1切换出成功次数（QCI=1）,VoLTE用户eNB间X2切换出成功次数（QCI=1）,VoLTE用户eNB内切换出成功次数（QCI=1）,VoLTE用户eNB间S1切换出请求次数（QCI=1）,VoLTE用户 eNB间X2切换出请求次数（QCI=1）,VoLTE用户eNB内切换出请求次数（QCI=1）,切换至2G请求次数,切换至2G成功次数,切换至2G准备成功次数,切换至2G准备失败次数,E-RAB掉线率(QCI=1)(小区级),QCI2承载切换成功率,VoLTE用户eNB间X2切换出成功次数（QCI=2）,VoLTE用户eNB间S1切换出成功次数（QCI=2）,VoLTE用户eNB内切换出成功次数（QCI=2）,VoLTE用户eNB内切换出请求次数（QCI=2）,VoLTE用户eNB间S1切换出请求次数（QCI=2）,VoLTE用户eNB间X2切换出请求次数（QCI=2）,小区上行丢包数(QCI=1),小区上行包数(QCI=1),小区下行包数(QCI=1),小区下行丢包数(QCI=1)' $putfile>tmp.file



putfile="bak-cell-`date +"%Y%m%d"`.csv"

cp tmp.file $putfile
rm tmp.file
rm aaa.csv
