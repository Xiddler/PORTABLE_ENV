#!/usr/sbin/env bash 
#
#/home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts
# see zim-wiki/PROTOCOLS/MY_LOCKER
#
# This script backsup my important folders to the Toshiba laptop at $HOME/MY_LOCKER
# Approx. size of $TARTARGET is 400MB
# Backup weekly

set -euo pipefail
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
MY_ZIM="/home/donagh/samba/anonymous_shared_directory/MY_ZIM/Zipped_MY_ZIM_date/MY_ZIM_$yesterday.zip"

# Target file
TARTARGET="/home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-$today.tar.gz"

tar -czf $TARTARGET $all_org $personal $PORTABLE_ENV $MY_ZIM





