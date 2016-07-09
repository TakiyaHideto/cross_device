#!/usr/bin/env bash


#for i in {29..1}
#do
ONE_DAY_AGO=`date +%Y-%m-%d --date="-1 day"`
ONE_DAY_AGO=$1

peroid=$2

jar_dir=/home/wangyunjie/svn/cross_device/trunk/target
jar_name=hadoop_test-1.0-jar-with-dependencies.jar

class_name=com.mr.cross_device.YoyiCpPart2JoiningMultiDay

output_path=/mroutput/cross_device/YoyiCpPart2JoiningMultiDay/log_date=$ONE_DAY_AGO
single_day_data=/mroutput/cross_device/YoyiCpPart1JoiningSingleDay/log_date=
/usr/bin/hadoop fs -rmr -skipTrash $output_path
/usr/bin/hadoop jar $jar_dir/$jar_name $class_name $output_path $single_day_data $ONE_DAY_AGO $peroid
#done