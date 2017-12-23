#!/bin/bash 		
#
read -p "Please enter a IPv4 address:" ip
ping -c1 -w 1 $ip &> /dev/null
if [ $? -eq 0 ];then 												
    echo "Presentation:The ip $1 address can access."
else
    echo "Presentation:The ip $1 address can't access"
fi
