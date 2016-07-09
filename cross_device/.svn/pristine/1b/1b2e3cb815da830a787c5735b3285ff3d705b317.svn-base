#!/usr/bin/env bash

ONE_DAY_AGO=`date +%Y-%m-%d --date="-6 day"`
ONE_DAY_AGO=$1

jar_dir=/home/wangyunjie/svn/cross_device/trunk/target
jar_name=hadoop_test-1.0-jar-with-dependencies.jar

class_name=com.mr.cross_device.YoyiCpPart3ExcludeCp

output_path=/mroutput/cross_device/YoyiCpPart3ExcludeCp/log_date=$ONE_DAY_AGO
candidate_file=/mroutput/cross_device/YoyiCpPart2JoiningMultiDay/log_date=$ONE_DAY_AGO
cp_device_file=/mroutput/cross_device/YoyiCpPart5CollectAndPredict

/usr/bin/hadoop fs -rmr -skipTrash $output_path
/usr/bin/hadoop jar $jar_dir/$jar_name $class_name $output_path $candidate_file $cp_device_file
