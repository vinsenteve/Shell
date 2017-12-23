
##输入若干个数值存入数组中，采用冒泡算法进行升序或降序排序

#!/bin/bash
#------------------------------------------#
# FileName:             ssh_auto.sh
# Revision:             1.1.0
# Date:                 
# Author:               vinsent
# Email:                hyb_admin@163.com
# Website:              www.vinsent.cn
# Description:          
#                       
#------------------------------------------#
# Copyright:            2017 vinsent
# License:              GPL 2+
#------------------------------------------#
declare -a arry
declare -i i=0
declare -i j=0
declare -i t
until [[ "$num" =~ ^[1-9]([0-9]?)+$ ]];do 	# 判断书否输入的是整数
    read -p "pls enter a num: " num
done

while [ $i -lt $num ];do 				            # 给数组元素赋值
    arry[$i]=$RANDOM
    ((i++))
done

echo ${arry[@]} 						                # 先打印一遍数组
for i in `seq 0 $[${#arry[*]}-1] `;do
    for j in `seq 0 $[${#arry[*]}-1]`;do
				if [[ ${arry[j]} -gt ${arry[j+1]} ]];then 
						t=${arry[j]}
					  arry[j]=${arry[j+1]}
					  arry[j+1]=$t
        fi
    done
done
echo ${arry[@]}
