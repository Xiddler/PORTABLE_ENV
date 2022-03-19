#!/bin/bash


# This script uses borg to back up the following items:
# ZIM_ALL
# all_org
# personal
# 2programming

# Generic create command
# borg create --stats --progress --compression lz4 '.::ZIM_ALL-{now}' /run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM

# to the following backup locations
rpi_USB_2='/home/donaghm/cifs_share/USB128_2_borg_backup'
Laptop_borg1='/home/donaghm/borg1'
Laptop_SAFE='/home/donaghm/SAFE/SAFE_borg_backup'
SDCard='/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68'

# ZIM_ALL
# cd $Laptop_borg1 && borg create ./::ZIM_ALL-{now} $SDCard/DONAGHS/MY_ZIM

#all_org
# cd $Laptop_borg1 && borg create ./::all_org-{now} $SDCard/DONAGHS/all_org

#personal
# cd $Laptop_borg1 && borg create ./::personal-{now} $SDCard/DONAGHS/personal

# TO RPi
cd $rpi_USB_2 
echo '1234' | sudo -S borg create ./::all_org-{now} $SDCard/DONAGHS/all_org


