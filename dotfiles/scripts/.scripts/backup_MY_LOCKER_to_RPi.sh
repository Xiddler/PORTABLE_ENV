#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# MY_PRECIOUS_DATA-2024-01-06.tar.gz
sourcefile="/home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-2024-01-06.tar.gz"
dest_folder="/home/donagh/BACKUPS_From_TOSHIBA_Laptop/"

scp -i ~/.ssh/id_rsa_rpi $sourcefile donagh@192.168.1.25:$dest_folder
