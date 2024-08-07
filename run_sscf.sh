#!/bin/bash

# 获取当前时间戳作为日志文件名
timestamp=`date +%Y%m%d%H%M%S`
logfile="Logs/${timestamp}.log"

# 删除旧的日志文件
#rm Logs/*.log
#rm test_results/ -rf 



bash scripts/AutoCon_beigang.sh   2>&1 | tee -a "${logfile}"
