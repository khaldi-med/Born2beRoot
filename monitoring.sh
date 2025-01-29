#!/bin/bash

#Architecture
ARCH=$(uname -a)

#CPU physical
CPU_F=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)

#vCPU
CPU_V=$(grep "processor" /proc/cpuinfo | wc -l)

#Memory Usage
	#RAM TOTAL
RAM_T=$(free --mega | grep Mem | awk '{print $2}')
	#RAM USED
RAM_U=$(free --mega | grep Mem | awk '{print $3}')
	#RAM %
RAM_P=$(echo "scale=2; $RAM_U / $RAM_T * 100" | bc)

#Disk Usage
	#Disk Total
	D_T=$(df -h --total | grep total | awk '{print $2}')
	#Disk Used
	D_U=$(df -h --total | grep total | awk '{print $3}')
	#Disk %
	D_P=$(df -k --total | grep total | awk '{print $5}')

wall "

----------------------------------------------------
	#Architecture: $ARCH
	#CPU physical: ${CPU_F} 
	#vCPU: ${CPU_V}
	#Memory Usage: ${RAM_U}/${RAM_T}MB (${RAM_P}%)
	#Disk Usage: ${D_U}/${D_T} (${D_P})
-----------------------------------------------------"
