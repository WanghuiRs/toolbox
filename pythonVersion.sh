#!/bin/bash
# 获取系统的python版本及位置

printf "%-18s %-30s %-50s\n" version location "soft link"
list=(0 2.7 2.8 3.5 3.6 3.7 3.8 3.9)
for version in ${list[@]}
do  
    if [ $version == 0 ]
    then 
        param=python
    else 
        param=python${version}
    fi
    ret=`which ${param}`
    if [ -n "${ret}" ];then
        soft_link=`ls -lh ${ret}`
        printf "%-18s %-30s %-50s\n" ${param} ${ret} $(echo $soft_link | awk '{printf $9 $10 $11}')
    fi
done