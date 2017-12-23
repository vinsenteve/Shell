#!/bin/bash
#------------------------------------------#
# FileName:             matri.sh
# Revision:             1.1.0
# Date:                 
# Author:               vinsent
# Email:                hyb_admin@163.com
# Website:              www.vinsent.cn
# Description:          Print transpose matrix
#                         1 2 3   	  2 5 8
#                         1 4 7 ===>	7 8 9 
#                         4 5 6   	  3 6 9                      
#------------------------------------------#
# Copyright:            2017 vinsent
# License:              GPL 2+
#------------------------------------------#
declare -a arry
arry=([00]=1 [01]=2 [02]=3 [10]=4 [11]=5 [12]=6 [20]=7 [21]=8 [22]=9)
echo -e "  ${arry[*]:0:3}\n  ${arry[*]:3:3}\n  ${arry[*]: -3}"
for i in `seq 1 2`;do
	  for j in `seq 0 1`;do
				if [ $i -ne $j ];then
						t=${arry[$i$j]}
						arry[$i$j]=${arry[$j$i]}
						arry[$j$i]=$t
				fi
		done
done
echo -e " -------"
echo -e "  ${arry[*]:0:3}\n  ${arry[*]:3:3}\n  ${arry[*]: -3}"
