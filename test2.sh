#!/bin/bash

# Architecture and kernel info
architecture=$(uname -a)
echo "#Architecture: $architecture"

# CPU physical count - using grep to count unique physical IDs
physical_cpu=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)
echo "#CPU physical : $physical_cpu"

# Virtual CPU count - counting processor entries
vcpu=$(grep "processor" /proc/cpuinfo | wc -l)
echo "#vCPU : $vcpu"

# Memory usage - using free and awk to calculate percentage
memory_usage=$(free -m | awk 'NR==2{printf "%d/%dMB (%.2f%%)", $3, $2, $3*100/$2}')
echo "#Memory Usage: $memory_usage"

# Disk usage - using df to get root partition usage
disk_usage=$(df -h / | awk 'NR==2{printf "%d/%dGb (%d%%)", $3, $2, $5}')
echo "#Disk Usage: $disk_usage"

# CPU load - using top in batch mode
cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f%%", $2}')
echo "#CPU load: $cpu_load"

# Last boot time - using who
last_boot=$(who -b | awk '{print $3 " " $4}')
echo "#Last boot: $last_boot"

# LVM check - using lsblk to detect logical volumes
if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then
    lvm_use="yes"
else
    lvm_use="no"
fi
echo "#LVM use: $lvm_use"

# TCP connections - counting ESTABLISHED connections
tcp_connections=$(netstat -ant | grep ESTABLISHED | wc -l)
echo "#Connections TCP : $tcp_connections ESTABLISHED"

# Logged users count
user_count=$(who | wc -l)
echo "#User log: $user_count"

# Network info - IP and MAC address
ip_address=$(hostname -I | awk '{print $1}')
mac_address=$(ip link | grep "link/ether" | awk '{print $2}' | head -n 1)
echo "#Network: IP $ip_address ($mac_address)"

# Sudo commands count - from auth.log
sudo_count=$(grep "sudo" /var/log/auth.log | wc -l)
echo "#Sudo : $sudo_count cmd"
