#!/usr/bin/env bash 

# Filepath /home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts/scp_precious_data_to_RPI_USB.sh

# /home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts/scp_precious_data_to_RPI_USB.sh

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR


# PURPOSE OF FILE
# To copy MY_PRECIOUS_DATA_mydate_.tar.gz from Toshiba to RPi USB Stick ie /media/donagh/MYUSB1/MY_LOCKER


# LISTING 
# find the correct date for MY_PRECIOUS_DATA-2024-01-06.tar.gz using progamming and set to mydate below


# get required file from Toshiba /home/donagh/MY_LOCKER
myfile="$(ssh -i ~/.ssh/id_rsa_toshiba donagh@192.168.1.86 'ls -t /home/donagh/MY_LOCKER | awk "FNR==1 { print $NR }" ')"
echo $myfile
# Worked --> output /home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-2024-01-06.tar.gz

# Destination directory on the RPi: /media/donagh/MYUSB1/MY_LOCKER/MY_LOCKER_RPi'
RPI_dest_dir='/media/donagh/MyUSB1/MY_LOCKER_RPi'

# donagh@raspberrypi ~
scp -i ~/.ssh/id_rsa_toshiba donagh@192.168.1.86:/home/donagh/MY_LOCKER/$myfile $RPI_dest_dir
# THIS WORKED. 

# Now set up a cronjob to do this weekly





