#!/bin/bash

# This script allows to compress the content of $HOME/BACKUPS/tarred and send to $HOME/BACKUPS/compressed

today="$(date +%Y-%m-%d)"

backups="$HOME/BACKUPS"
tarred="$HOME/BACKUPS/tarred"
compressed="$HOME/BACKUPS/compressed"


org_tar="$tarred/org_$today.tar"
org_comp="$compressed/org_$today.tar.gz"

zim_tar="$tarred/zim_$today.tar"
zim_comp="$compressed/zim_$today.tar.gz"

tmp_tar="$tarred/Donaghs_Tmp_$today.tar"
tmp_comp="$compressed/Donaghs_Tmp_$today.tar.gz"

tar -czf "$org_comp" $org_tar

tar -czf "$zim_comp" $zim_tar

tar -czf "$tmp_comp" $tmp_tar
