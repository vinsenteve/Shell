#!/bin/bash
#------------------------------------------#
# FileName:             systeminfo.sh
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
echo "My Computer's Massage:"
echo "HostName is : `hostname`"
c=`ifconfig | egrep -o "([0-9]{1,3}[.]){3}[0-9]{1,3}" | head -n 1`
echo "The IPv4 is : $c"
echo "The Systerm Version is :`cat /etc/centos-release`"
echo "The Kenel is :`uname -r`"
echo "The CPU Massage : `lscpu | grep "Model name" | tr -s " " | cut -d " " -f3,4,5,6,7,8`"
echo "The Mem size is : `free -h | tr -s " " | grep "Mem" | cut -d" " -f2 `"
#echo The df :`df | grep -o "^\/dev\/sd[a-z]\+[0-9]\+"`
echo -e "The disk size is :`lsblk | grep "^sd" | tr -s " " | cut -d " " -f 1,4`"
