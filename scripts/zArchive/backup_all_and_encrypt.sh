#!/bin/bash

# This script will backup the following folders to another folder
# ORG
# PERSONAL
# ALL_ZIM

# The destination folders are:


# declare variables
today=$(date +%Y-%m-%d)

home="/home/donaghm"
dropbox="/home/donaghm/Dropbox"
backups="/home/donaghm/DONAGHS/BACKUPS"
safe="/home/donaghm/SAFE"
# tarred="/home/donaghm/BACKUPS/tarred"
pers="/home/donaghm/sd64/1donaghs-stuff/personal"
orghome="/home/donaghm/all_org"
zimhome="/home/donaghm/sd64/zim"

## ORG
rsync -avz $orghome/org $backups/org_RSYNC
# tar -cf $tarred/org_$today.tar $backups/org_RSYNC
7z a -p2nkfoo65FFDR!!dOJjklere $dropbox/org/org_$today.7z $tarred/org_$today.tar


## PERSONAL
rsync -avz $pers $backups/personal_RSYNC
tar -cf $tarred/personal_$today.tar $backups/personal_RSYNC
7z a -p2nkfoo65FFDR!!dOJjklere $dropbox/personal/personal_$today.7z $tarred/personal_$today.tar


## ALL_ZIM
rsync -avz $zimhome/org $backups/ALL_ZIM_RSYNC
tar -cf $tarred/ALL_ZIM_$today.tar $backups/ALL_ZIM_RSYNC
7z a -p2nkfoo65FFDR!!dOJjklere $dropbox/zim_BU/ALL_ZIM_$today.7z $tarred/ALL_ZIM_$today.tar

echo "ALL_ZIM, personal and org successfully compressed and encrypted and sent to Dropbox today: $today"

## Clear folders
# rsync - will sync the diffs in the $backups directory

# tarred
rm $tarred/*.tar

