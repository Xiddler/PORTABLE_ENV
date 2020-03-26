#!/bin/bash

echo "Memory usage is :" && df -h | grep sda2 | awk '{print $5}'
echo "CPU is currently used by :" && ps aux | awk '$3+$4> 5' | awk '{print $11 "  " $3+$4}'
