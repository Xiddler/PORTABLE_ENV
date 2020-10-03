#!/bin/bash


# declare variables
today=$(date +%Y-%m-%d)

home="/home/donagh"
dropbox="/home/donagh/Dropbox"
backups="/home/donagh/BACKUPS"
tarred="/home/donagh/BACKUPS/tarred"
pers="/home/donagh/sd64/1donaghs-stuff/personal"
orghome="/home/donagh/all_org"
zimhome="/home/donagh/sd64/zim"

## ORG
rsync -avz $orghome/org $backups/org_RSYNC
tar -cf $tarred/org_$today.tar $backups/org_RSYNC
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
















echo "org successfully compressed and encrypted and sent to Dropbox $today"

