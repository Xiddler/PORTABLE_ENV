#!/bin/bash


# declare variables
today=$(date +%Y-%m-%d)

home="/home/donagh"
dropbox="/home/donagh/Dropbox"
backups="/home/donagh/BACKUPS"
tarred="/home/donagh/BACKUPS/tarred"
pers="/home/donagh/sd64/1donaghs-stuff/personal"
orghome="/home/donagh/all_org"

rsync -avz $orghome/org $backups/org_RSYNC
tar -cf $tarred/org_$today.tar $backups/org_RSYNC
# 7z a -p2nkfoo65FFDR!!dOJjklere $dropbox/org/org_$today.7z $tarred/org_$today.tar

echo "org successfully compressed and encrypted and sent to Dropbox $today"

