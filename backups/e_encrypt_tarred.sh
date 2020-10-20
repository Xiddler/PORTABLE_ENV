#!/bin/bash

# NOTE: not working yet!!!!!!!


# This script allows to tar content of ***_RSYNC to the tarred directory

today="$(date +%Y-%m-%d)"

backups="$HOME/BACKUPS"
tarred="$HOME/BACKUPS/tarred"

org_R="$backups/org_RSYNC/org"
zim_R="$backups/zim_RSYNC/zim"
tmp_R="$backups/Donaghs_Tmp_RSYNC/Donaghs_Tmp"




tar -cf "$tarred/org_$today.tar" $org_R

tar -cf "$tarred/Donaghs_Tmp_$today.tar" $tmp_R

tar -cf "$tarred/zim_$today.tar" $zim_R
