# This is a script to determine the file type
#!/bin/bash
#------------------------------------------#
# FileName:             type_file.sh
# Revision:             1.1.0
# Date:                 
# Author:               vinsent
# Email:                hyb_admin@163.com
# Website:              www.vinsent.cn
# Description:          This is a script to determine the file type 
#                       
#------------------------------------------#
# Copyright:            2017 vinsent
# License:              GPL 2+
#------------------------------------------#
#
for i in /var/* ;do	
    if [ -h $i ];then
        echo "$i is a link file"
    elif [ -d $i ];then
				echo "$i is a dir file"
    elif [ -f $i ];then
        echo "$i is a Ordinary file"
    elif [ -p $i ];then
        echo "$i is a Pip file"
    elif [ -S $i ];then
        echo "$i is a Socket file"
    else
        echo "$i is other file"
	  fi	
done
