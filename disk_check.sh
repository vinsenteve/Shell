#!/bin/bash
Inodeused=`df -i | egrep "^/dev/s[ah]" | tr -s " " "%" | cut -d% -f5 | sort -n |head 1` 
Diskused=`df | egrep "^/dev/sda" | tr -s " " "%" | cut -d% -f5 | sort -rn | tail -1`
[[ "$Inodeused" -ge 80 ]] || [[ "$Diskused" -ge 80 ]] && wall "The disk space is full"
