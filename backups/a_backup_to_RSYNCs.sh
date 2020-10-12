#!/bin/bash

# This script allows to update changes to zim, org and Donaghs_Tmp so
# that the latest files are synced to BACKUPS/***_RSYNC. These _RSYNC
# directories in ~/BACKUPS directory can then be tarred and sent to external drive 
# like SDCARD or 128 GB USB

backups="$HOME/BACKUPS"
org="$HOME/all_org/org"
org_R="$backups/org_RSYNC"
zim="$HOME/MY_ZIM/zim"
zim_R="$backups/zim_RSYNC"
tmp="$HOME/Donaghs_Tmp"
tmp_R="$backups/Donaghs_Tmp_RSYNC"


rsync -avz $org $org_R

# rsync -avz $zim $zim_R

rsync -avz $tmp $tmp_R
