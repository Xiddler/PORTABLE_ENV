#!/bin/bash


# declare variables
now=$(date +%Y_%m_%d_%H_%M)

# S = Source

S_zim_compu="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM/Computer"
S_zim_compuTXT="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM/Computer.txt"



borg create --stats --progress --compression lz4 '/home/donaghm/SAFE/SAFE_borg_backup/::zim_compu-{now}' $S_zim_compu
borg create --stats --progress --compression lz4 '/home/donaghm/SAFE/SAFE_borg_backup/::zim_compuTXT-{now}' $S_zim_compuTXT

echo "Zim_Computer successfully compressed, encrypted and backed up to SAFE"

