#!/bin/bash
#------------------------------------------#
# FileName:             host_ping.sh
# Revision:             1.1.0
# Date:                 2017-07-14 04:55:33
# Author:               vinsent
# Email:                hyb_admin@163.com
# Website:              www.vinsent.cn
# Description:          This script can achieve ssh password-free login, 
#                       and can be deployed in batches, configuration
#------------------------------------------#
# Copyright:            2017 vinsent
# License:              GPL 2+
#------------------------------------------#
read -p "Please enter a IPv4 address:" ip
ping -c1 -w 1 $ip &> /dev/null
if [ $? -eq 0 ];then 												
    echo "Presentation:The ip $1 address can access."
else
    echo "Presentation:The ip $1 address can't access"
fi
