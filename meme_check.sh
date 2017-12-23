#!/bin/bash
#------------------------------------------#
# FileName:             meme_check.sh
# Revision:             1.1.0
# Date:                 2017
# Author:               vinsent
# Email:                hyb_admin@163.com
# Website:              www.vinsent.cn
# Description:          
#------------------------------------------#
# Copyright:            2017 vinsent
# License:              GPL 2+
#------------------------------------------#

mem_usef=80             # 内存使用超过80%则报警
disk='/dev/sda1'        # 需要监控的磁盘名
disk_space_used=80       # 磁盘空间使用超过80%则报警
function monitor_mem(){
    mem_total=`free |awk 'NR==2{print $2}'`
    mem_use=`free |awk 'NR==2{print $3}'`
    mem_per=`echo "scale=2;$mem_use/$mem_total" |bc -l|cut -d. -f2`
    if [ $mem_per -gt $mem_limit ]
        then
            msg="TIME:$(date +%F_%T)
                 HOSTNAME:$(hostname)
                 IPADDR:$(ifconfig |awk 'NR==2{print $2}')
                 MSG:Memory usage exceeds the limit,current value is ${mem_per}%"
           /usr/bin/mail $msg
    fi
}

function monitor_disk_space(){
    space_use=`df $disk |awk 'NR==2{print $5}'|cut -d% -f1`
    if [ $space_use -gt $disk_space_limit ]
        then
            msg="TIME:$(date +%F_%T)
                 HOSTNAME:$(hostname)
                 IPADDR:$(ifconfig |awk 'NR==2{print $2}')
                 MSG:Disk space usage exceeds the limit,current value is ${space_use}%"
            /usr/bin/mail $msg
    fi
}

fuction server_a(){

    server_use=`ps aux |grep nginx | grep -v 'grep'`
    server_use1=`ps aux |grep nfs | grep -v 'grep'`
    if [ -Z $server_use ]
        then
         msg="TIME:$(date +%F_%T)
                 HOSTNAME:$(hostname)
                 IPADDR:$(ifconfig |awk 'NR==2{print $2}')
                 MSG:Disk The nginx.server is stop!"
            /usr/bin/mail $msg
    fi

    if [ -Z $server_use1 ]
        then
         msg="TIME:$(date +%F_%T)
                 HOSTNAME:$(hostname)
                 IPADDR:$(ifconfig |awk 'NR==2{print $2}')
                 MSG:Disk The nfs.server is stop!"
            /usr/bin/mail $msg
    fi
}

monitor_mem &>> /tmp/monitor.log
monitor_disk_space &>> /tmp/monitor.log
server_a & >> /tmp/monitor.log
