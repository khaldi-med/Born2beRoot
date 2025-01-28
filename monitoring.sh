#!/bin/bash

#Architecture
arch=$(uname -a)

#CPU physical
cpuf=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)

#vCPU
cpuv=$(grep "processor" /proc/cpuinfo | wc -l)

#Memory Usage
ramtotal=$(free --mega | awk '$1 == "Mem:"{print $2}')
ramused=$(free --mega | awk '$1 == "Mem:"{print $3}')
ramP=$(echo "scale=2; $ramused / $ramtotal * 100" | bc) 

#Disk Usage

wall "
	cpuf ${cpuf} 
	vcpu ${cpuv}
	ramtot ${ramtotal}
	RAM Usage Percentage: $ramused/$ramtotal"MB" (${ramP}%)
"
