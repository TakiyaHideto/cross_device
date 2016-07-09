#!/usr/bin/env bash


ONE_DAY_AGO=`date +%Y-%m-%d --date="-1 day"`
period=7

script_dir="/home/wangyunjie/svn/cross_device/trunk/src/com/mr/cross_device/script"
sh ${script_dir}/YoyiCpPart1JoiningSingleDay.sh $ONE_DAY_AGO
sh ${script_dir}/YoyiCpPart2JoiningMultiDay.sh $ONE_DAY_AGO $period
sh ${script_dir}/YoyiCpPart3ExcludeCp.sh $ONE_DAY_AGO
sh ${script_dir}/YoyiCpPart4ExtractData.sh $ONE_DAY_AGO
sh ${script_dir}/YoyiCpPart5CollectAndPredict.sh $ONE_DAY_AGO
