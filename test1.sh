#!/bin/bash

# 1. OS Architecture and Kernel Version
ARCH=$(uname -m)
KERNEL=$(uname -r)
echo "Architecture: $ARCH"
echo "Kernel Version: $KERNEL"

# 2. Physical Processors (physical chips)
PHYSICAL_CPU=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
echo "Physical Processors: $PHYSICAL_CPU"

# 3. Virtual Processors (cores/threads)
VIRTUAL_CPU=$(nproc)
echo "Virtual Processors: $VIRTUAL_CPU"

# 4. RAM Information
RAM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
RAM_USED=$(free -m | awk '/Mem:/ {print $3}')
RAM_PERCENT=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
echo "Total RAM: ${RAM_TOTAL}MB"
echo "Used RAM: ${RAM_USED}MB"
echo "Utilization: ${RAM_PERCENT}%"

# 5. Storage Information (root partition)
STORAGE_TOTAL=$(df -m / | awk 'NR==2 {print $2}')
STORAGE_USED=$(df -m / | awk 'NR==2 {print $3}')
STORAGE_PERCENT=$(df / | awk 'NR==2 {print $5}')
echo "Total Storage: ${STORAGE_TOTAL}MB"
echo "Used Storage: ${STORAGE_USED}MB"
echo "Utilization: $STORAGE_PERCENT"

# 6. CPU Utilization
CPU_PERCENT=$(mpstat 1 1 | awk '/Average:/ {printf("%.2f"), 100 - $12}')
echo "CPU Usage: ${CPU_PERCENT}%"

# 7. Last Reboot
LAST_BOOT=$(who -b | awk '{print $3 " " $4}')
echo "Last Reboot: $LAST_BOOT"

# 8. LVM Status
LVM_ACTIVE=$(lsblk | grep -cq lvm && echo "Active" || echo "Inactive")
echo "LVM Status: $LVM_ACTIVE"

# 9. Active Connections
CONNECTIONS=$(netstat -tun | grep -c ESTABLISHED)
echo "Active Connections: $CONNECTIONS"

# 10. User Count
USERS=$(who | wc -l)
echo "Logged-in Users: $USERS"

# 11. Network Information
IP=$(ip -4 a | awk '/inet / {print $2}' | grep -v "127.0.0.1" | head -n 1)
MAC=$(ip link | awk '/link\/ether/ {print $2}' | head -n 1)
echo "IPv4 Address: ${IP%/*}"  # Remove CIDR notation
echo "MAC Address: $MAC"

# 12. Sudo Command Count
SUDO_COUNT=$(journalctl _COMM=sudo | grep -c "COMMAND=" || 
             grep -c "sudo:" /var/log/auth.log)
