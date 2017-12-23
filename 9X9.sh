#!/bin/bash
#------------------------------------------#
# FileName:             9X9.sh
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
for i in `seq 1 9`;do
    for j in `seq $i` ;do
        let sum=$i*$j
        echo -e "${j}x${i}=$sum \c"
		done
				echo 
done                            
unset i
unset j
