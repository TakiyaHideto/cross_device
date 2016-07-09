#!/usr/bin/env bash

script_dir="/home/wangyunjie/svn/cross_device/trunk/src/com/mr/cross_device/script"
period=7
sh ${script_dir}/GenerateTrueCpDevice.sh $period
sh ${script_dir}/GenerateImitatedCpDevice.sh $period
sh ${script_dir}/CollectCpOriginDataForTraining.sh $period
sh ${script_dir}/CollectCpData.sh
