#!/usr/bin/env bash

ONE_DAY_AGO=`date +%Y-%m-%d --date="-1 day"`
#FOUR_DAY_AGO=`date +%Y-%m-%d --date="-1 day"`

jar_dir=/home/wangyunjie/svn/cross_device/trunk/target
jar_name=hadoop_test-1.0-jar-with-dependencies.jar

class_name=com.mr.cross_device.CollectCpData

output_path=/mroutput/cross_device/CollectCpData/log_date=$ONE_DAY_AGO
basedata=/mroutput/cross_device/CollectCpOriginData/log_date=$ONE_DAY_AGO
truePath=/share_data/cross_platform/log_date=${ONE_DAY_AGO}/true_cp_${ONE_DAY_AGO}
falsePath=/share_data/cross_platform/log_date=${ONE_DAY_AGO}/false_cp_${ONE_DAY_AGO}

hadoop fs -rmr -skipTrash $output_path
hadoop jar $jar_dir/$jar_name $class_name $output_path $basedata $truePath $falsePath $ONE_DAY_AGO

