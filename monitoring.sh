#!/bin/bash

#Architecture
ARCH=$(uname -a)

#CPU physical
CPU_F=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)

#vCPU
CPU_V=$(nproc)

#Memory Usage
RAM_US=$(free -m | awk 'NR==2{printf "%d/%dMB (%.2f%%)", $3, $     2, $3*100/$2}')

#Disk Usage
D_US=$(df -h --total | awk 'NR==2{printf "%d/%dG (%d%%)", $3, $2,        $5}')

#CPU load
CPU_L=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f%%", $2}')

#Last boot
LAST_B=$(who -b | awk '{print $3 " " $4}')

#LVM use
LVM_U=$(lsblk | grep lvm && echo "yes" || echo "no")

#Connections TCP
TCP_CON=$(netstat -t | grep -c ESTABLISHED)

#User log
USERS=$(who | wc -l)

#Network
IPv4_AD=$(hostname -T | awk '{print $1}')
MAC_AD=$(ip link | grep "link/ether" | awk '{print $2}' | head -n 1)

#Sudo
SUDO_N=$(grep COMMAND /var/log/sudo/sudo.log | wc -l && echo "cmd")

wall "
	#Architecture: $ARCH
	#CPU physical: ${CPU_F} 
	#vCPU: ${CPU_V}
	#Memory Usage: ${RAM_US}
	#Disk Usage: ${D_US}
	#CPU load: ${CPU_L}
	#Last boot: ${LAST_B}
	#LVM use: ${LVM_U}
	#Connections TCP: ${TCP_CON}
	#User log: ${USERS}
	#Network: ${IPv4_AD} (${MAC_AD})
	#Sudo : ${SUDO_N}
"
