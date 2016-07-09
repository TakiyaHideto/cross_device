#!/usr/bin/env bash

ONE_DAY_AGO=`date +%Y-%m-%d --date="-1 day"`
period=$1

jar_dir=/home/wangyunjie/svn/cross_device/trunk/target
jar_name=hadoop_test-1.0-jar-with-dependencies.jar

class_name=com.mr.cross_device.GenerateTrueCpDevice

output_path=/mroutput/cross_device/GenerateTrueCpDevice/log_date=$ONE_DAY_AGO
baidu_cp=/user/ads/mid/user/day/userExtract

hadoop fs -rmr -skipTrash $output_path
hadoop jar $jar_dir/$jar_name $class_name $output_path $baidu_cp $ONE_DAY_AGO $period

cp_device_dir_cluster=/mroutput/cross_device/cp_device
hadoop fs -mkdir $cp_device_dir_cluster
cp_device_dir_cluster=/mroutput/cross_device/cp_device/log_date=$ONE_DAY_AGO
hadoop fs -mkdir $cp_device_dir_cluster
hadoop fs -rm ${cp_device_dir_cluster}/baidu*
cp_device_dir_local=/home/wangyunjie/svn/cross_device/file/cp_device/log_date=$ONE_DAY_AGO
mkdir $cp_device_dir_local
baidu_cp_file=${cp_device_dir_local}/baidu_cp_$ONE_DAY_AGO
hadoop fs -text ${output_path}/part* > $baidu_cp_file
hadoop fs -put $baidu_cp_file $cp_device_dir_cluster

#baidu_cp_drawbridge_file=${cp_device_dir_local}/baidu_cp_drawbridge_$ONE_DAY_AGO
#baidu_cp_jiaoda_file=${cp_device_dir_local}/baidu_cp_jiaoda_$ONE_DAY_AGO
#
#cat ${baidu_cp_file} | awk 'NR%100==1{print $0}' > $baidu_cp_drawbridge_file
#cat ${baidu_cp_file} | awk 'NR%5==1{print $0}' > $baidu_cp_jiaoda_file
#hadoop fs -put ${baidu_cp_drawbridge_file} $cp_device_dir_cluster
#hadoop fs -put ${baidu_cp_jiaoda_file} $cp_device_dir_cluster