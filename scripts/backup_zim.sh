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

rsync -avz $zimhome/org $backups/ALL_ZIM_RSYNC
tar -cf $tarred/ALL_ZIM_$today.tar $backups/ALL_ZIM_RSYNC
7z a -p2nkfoo65FFDR!!dOJjklere $dropbox/zim_BU/ALL_ZIM_$today.7z $tarred/ALL_ZIM_$today.tar

echo "ALL_ZIM successfully compressed and encrypted and sent to Dropbox $today"

