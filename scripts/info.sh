#!/bin/bash

# HDD of 1TB
echo "HDD usage is :" && df -h | grep sda2 | awk '{print $5}'
# next line: if the sum of CPU usage is > 5 then  print the processes
echo "CPU is currently used by :" && ps aux | awk '$4 > 5' | awk '{ print $11 "  " $4 }'
# next line: if the sum of RAM usage is > 5 then  print the processes
echo "RAM is currently used by :" && ps aux | awk '$3 > 5' | awk '{ print $11 "  " $3 }'
# Battery
echo "Battery health :" && acpi -i G design |  cut -d'=' -f2
