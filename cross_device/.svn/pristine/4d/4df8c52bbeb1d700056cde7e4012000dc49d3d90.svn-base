#!/usr/bin/env bash

ONE_DAY_AGO=`date +%Y-%m-%d --date="-6day"`
#FOUR_DAY_AGO=`date +%Y-%m-%d --date="-1 day"`
ONE_DAY_AGO=$1

jar_dir=/home/wangyunjie/svn/cross_device/trunk/target
jar_name=hadoop_test-1.0-jar-with-dependencies.jar

class_name=com.mr.cross_device.YoyiCpPart5CollectAndPredict

part="part-r-00000"

output_path=/mroutput/cross_device/YoyiCpPart5CollectAndPredict/log_date=$ONE_DAY_AGO/${part}_dir
basedata=/mroutput/cross_device/YoyiCpPart4ExtractData/log_date=$ONE_DAY_AGO
device_couple_device=/mroutput/cross_device/YoyiCpPart3ExcludeCp/log_date=$ONE_DAY_AGO/$part
dump=/mroutput/cross_device/file/dump.txt
feature_map=/mroutput/cross_device/file/feature_map

hadoop fs -rmr -skipTrash $output_path
hadoop jar $jar_dir/$jar_name $class_name $output_path $basedata $device_couple_device $dump $feature_map $ONE_DAY_AGO
