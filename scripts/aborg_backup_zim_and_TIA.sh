#!/bin/bash


# the command borgz backs up the following folders to the USB on my RPi
# ----------------------------------------------------------------------
# 1. zim/Computer
# 2. Dropbox/org-mode/org/*

# Defunct: ~~CompTIA notes (Feb-Mar 2021)~~
# ----------------------------------------------------------------------

# alias to run this is set in .zsh_aliases
# -> % borgz

# declare variables
now=$(date +%Y_%m_%d_%H_%M)


S_zim_compu="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM/Computer"
S_zim_ORG="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM/ORG"
S_org="/home/donaghm/Dropbox/org-mode/org"


# create new borg backup of zim/Computer in ~/SAFE/SAFE_borg_backup
borg create --stats --progress --compression lz4 '/home/donaghm/SAFE/SAFE_borg_backup/::zim_compu-{now}' $S_zim_compu

# create new borg backup of org-mode/org in ~/SAFE/SAFE_borg_backup
borg create --stats --progress --compression lz4 '/home/donaghm/SAFE/SAFE_borg_backup/::org_all-{now}' $S_org

# create new borg backup of zim/ORG in ~/SAFE/SAFE_borg_backup
borg create --stats --progress --compression lz4 '/home/donaghm/SAFE/SAFE_borg_backup/::zim_ORG-{now}' $S_zim_ORG

# copy to RPi 
# option with no intervention
echo "1234" | sudo -S cp -r $HOME/SAFE/SAFE_borg_backup $HOME/cifs_share
echo ""
echo "Successfully compressed, encrypted and backed up $S_zim_compu and $S_org to ~/cifs_share which is the USB on the RPi"


# **************************************************************************************************************************************
# **************************************************************************************************************************************
# Removed from play - kept for the record
# The following is only required once
# S_zim_compuTXT="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM/Computer.txt"

# S_tia="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/EDUCATION/Courses_2021/CompTIA_2021"
# S_org="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/all_org" <-- this only backed up symlinks to files
# **************************************************************************************************************************************
# **************************************************************************************************************************************


