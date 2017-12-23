#!/bin/bash
#------------------------------------------#
# FileName:             ssh_auto.sh
# Revision:             1.1.0
# Date:                 2017-07-14 04:50:33
# Author:               vinsent
# Email:                hyb_admin@163.com
# Website:              www.vinsent.cn
# Description:          This script can achieve ssh password-free login, 
#                       and can be deployed in batches, configuration
#------------------------------------------#
# Copyright:            2017 vinsent
# License:              GPL 2+
#------------------------------------------#
[ ! -f /root/.ssh/id_rsa.pub ] && ssh-keygen -t rsa -P '' &>/dev/null  # 密钥对不存在则创建密钥
while read line;do
        ip=`echo $line | cut -d " " -f1`             # 提取文件中的ip
        user_name=`echo $line | cut -d " " -f2`      # 提取文件中的用户名
        pass_word=`echo $line | cut -d " " -f3`      # 提取文件中的密码
expect <<EOF
        spawn ssh-copy-id -i /root/.ssh/id_rsa.pub $user_name@$ip   # 复制公钥到目标主机
        expect {
                "yes/no" { send "yes\n";exp_continue}     # expect 实现自动输入密码
                "password" { send "$pass_word\n"}
        }
        expect eof
EOF
 
done < /root/host_ip.txt      # 读取存储ip的文件
 
pscp.pssh -h /root/host_ip.txt /root/your_scripts.sh /root     # 推送你在目标主机进行的部署配置
pssh -h /root/host_ip.txt -i bash /root/your_scripts.sh        # 进行远程配置，执行你的配置脚本


#主机信息文件
~]# cat host_ip.txt 
172.18.14.123 root 123456
172.18.254.54 root 123456
...
