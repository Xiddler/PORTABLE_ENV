#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

rsync -a --exclude '/home/donagh/DONAGHS/personal/zArchive' --exclude '/home/donagh/DONAGHS/personal/.git/' --delete /home/donagh/DONAGHS/personal/ /home/donagh/BACKUPS/RSYNCED/personal/


