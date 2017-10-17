#!/bin/bash
#本脚本用来下载厂家数据
#
#运行示例 sh download.sh 2017-03-08         后面跟随的为日期格式
#
#配置文件为 load.conf 请勿随意修改
#/opt/lte_files_wget.pl 为下载向导文件

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:
export PATH

        ztetime=$1
        perl /home/boco/lte_files_wget.pl -v 7 -o 107061 -s $ztetime -i 100.92.250.61:21 -u zteltemr  -p Zte_1234  -d  /datafile/sharedata/MR/MRO

        timedate=`echo ${ztetime} | sed 's/-//g'`

cat /home/boco/load.conf | while read line

do 

    omcid=`echo ${line} | awk -F ' ' ' {print $1}'`
    fip=`echo ${line} | awk -F ' ' ' {print $2}'`
    user=`echo ${line} | awk -F ' ' ' {print $3}'`
    pwssad=`echo ${line} | awk -F ' ' ' {print $4}'`
    file=`echo ${line} | awk -F ' ' '{print $5}'`
    int=`echo ${line} | awk -F ' ' ' {print $6}'`

    perl /home/boco/lte_files_wget.pl -v $int -o $omcid  -i $fip -u $user  -p $pwssad  -d $file -s $timedate

done 
