#!/bin/bash
wall -n "#Architecture: $(uname -a)
#CPU physical: $(grep 'physical id' /proc/cpuinfo | uniq | wc -l)
#vCPU: $(grep 'processor' /proc/cpuinfo | wc -l)
#Memory Usage: $(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')
#Disk Usage: $(df -h | awk '$NF=="/"{printf "%s/%s (%s)", $3,$2,$5}')
#CPU Load: $(top -bn1 | grep load | awk '{printf "%.2f%%", $(NF-2)}')
#Last Boot: $(who -b | awk '{print $3, $4}')
#LVM Use: $(lsblk | grep lvm | awk '{if ($1) {print "yes"} else {print "no"}}')
#Connections TCP: $(ss -tun | grep ESTAB | wc -l)
#User Log: $(who | wc -l)
#Network: IP $(hostname -I) ($(ip link | grep ether | awk '{print $2}'))
"
