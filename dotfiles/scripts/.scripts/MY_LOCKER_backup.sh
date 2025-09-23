#!/usr/sbin/env bash 

# UPDATE 2025-08-26
# edited to reflect moving MY_ZIM from Win11 to Lenovo Chromebook running Arch -- nickneamed LenArch
# NOTE: MY_ZIM is copied from LenArch to /home/donagh/samba/anonymous_shared_directory/MY_ZIM/MY_ZIM daily using a cronjob on LenArch and samba_share
#
#/home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts
# see zim-wiki/PROTOCOLS/MY_LOCKER
#
# This script backsup my important folders to the Toshiba laptop at $HOME/MY_LOCKER
# Approx. size of $TARTARGET is 400MB
# It depends on the original folders being up-to-date. The danger item is MY_ZIM on Windows which depends on a Task Schedule script running on Win11
#
#############################################
# IMPORTANT SOURCE FOLDERS ON THE TOSHIBA LAPTOP BACKED UP BY THIS script
#############################################
# org-mode from Dropbox
# PORTABLE_ENV
# personal/
#
# Located on the LenArch
# MY_ZIM 
#
#############################################
# DESTINATION FOLDER/FILE
#/home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-$today.tar.gz"
#############################################
#
#############################################
# Frequency of backup
#############################################
# Backup weekly using a cronjob
# 05 19 * * 6 /home/donagh/.scripts/MY_LOCKER_backup.sh


set -eEuo pipefail # added -E on 2025-08-25 
trap "echo 'error: Script failed: see failed command above'" ERR

# check the last MY_ZIM_<DATE>.zip in /home/donagh/samba/anonymous_shared_directory/MY_ZIM/Zipped_MY_ZIM_date
# How can I avoid hard coding `today` here?
# Rem: MY_ZIM is copied from Win11 to Toshiba at 18:45 daily (so on a Friday before the MY_LOCKER backup)
# and MY_LOCKER is backed up on the Saturday morning at 5:19

# for MY_ZIM
yesterday=$(date  --date="yesterday" +"%Y-%m-%d")
# for MY_LOCKER
today=$(date +"%Y-%m-%d")

# Folders
all_org="/home/donagh/Dropbox/org-mode"
personal="/home/donagh/DONAGHS/personal"
# also on Github
PORTABLE_ENV="/home/donagh/PORTABLE_ENV"
# zipped file
# example: /home/donagh/samba/anonymous_shared_directory/MY_ZIM/Zipped_MY_ZIM_date/MY_ZIM_2023-10-03.zip
#
# 2025-08-25 
# Need to replace the following as MY_ZIM now on LenArch
# To read a Samba server from another Linux machine, you can use the smbclient command to list available shares with smbclient -L //server and then access a specific share using smbclient //server/share -U username. Make sure you have the necessary permissions and the Samba client installed.

MY_ZIM="/home/donagh/samba/anonymous_shared_directory/MY_ZIM/MY_ZIM"

# Target file i.e. destination
TARTARGET="/home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-$today.tar.gz"

# tar -czf $TARTARGET $all_org $personal $PORTABLE_ENV $MY_ZIM
tar -czf $TARTARGET $all_org $personal $PORTABLE_ENV $MY_ZIM






