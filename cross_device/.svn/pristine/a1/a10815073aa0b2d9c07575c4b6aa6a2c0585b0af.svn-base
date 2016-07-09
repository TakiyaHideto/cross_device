#!/usr/bin/env bash

ONE_DAY_AGO=`date +%Y-%m-%d --date="-1 day"`
CP_DATA="/mroutput/cross_device/CollectCpData/log_date=${ONE_DAY_AGO}"

py_script_dir="/home/wangyunjie/svn/cross_device/trunk/src/com/mr/eval_python"
xgboost_dir="/home/wangyunjie/svn/cross_device/xgboost"

hadoop fs -text ${CP_DATA}/part* > ${xgboost_dir}/dataset
python ${py_script_dir}/HandleOriginDataForXgboost.py ${xgboost_dir}/dataset ${xgboost_dir}/feature_mapping
cat ${xgboost_dir}/dataset_XgFormat | awk '{if(NR%5!=1)print $0}' > ${xgboost_dir}/training
cat ${xgboost_dir}/dataset_XgFormat | awk '{if(NR%5==1)print $0}' > ${xgboost_dir}/testing

while true
do
    echo -e "\e[1;32m tunning params (press any key) \e[0m"
    read xxx
    vim ${xgboost_dir}/cp_configuration.conf
    echo -e "\e[1;32m Input out model name: \e[0m"
    read model_name
    ${xgboost_dir}/xgboost ${xgboost_dir}/cp_configuration.conf model_out=${xgboost_dir}/$model_name
    ${xgboost_dir}/xgboost ${xgboost_dir}/cp_configuration.conf task=pred model_in=${xgboost_dir}/$model_name name_pred=${xgboost_dir}/pred.txt
    cat ${xgboost_dir}/testing | awk '{print $1}' > ${xgboost_dir}/true_label
    echo -e "\e[1;32m precision / recall / accuracy \e[0m"
    python ${py_script_dir}/calPrecisionAndRecall.py ${xgboost_dir}
    echo -e "\e[1;32m continue tunning params? (y/n): \e[0m"
    read ctn
    if [ $ctn == "n" ]
        then break
    fi
done

`hadoop fs -rmr -skipTrash /mroutput/cross_device/file/*`

hadoop fs -put ${xgboost_dir}/feature_mapping /mroutput/cross_device/file/
${xgboost_dir}/xgboost ${xgboost_dir}/cp_configuration.conf task=dump model_in=${xgboost_dir}/$model_name name_dump=${xgboost_dir}/dump.txt
hadoop fs -put ${xgboost_dir}/dump.txt /mroutput/cross_device/file/
