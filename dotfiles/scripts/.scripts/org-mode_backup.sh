#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR


# personal
# rsync -a --exclude '/home/donagh/DONAGHS/personal/zArchive' --exclude '/home/donagh/DONAGHS/personal/.git/' --delete /home/donagh/DONAGHS/personal/ /home/donagh/BACKUPS/RSYNCED/personal/

org_dir="/home/donagh/Dropbox/org-mode/org/"
org_dest="/home/donagh/BACKUPS/orgmode_SNAPSHOTS/"

rsync -a --exclude '$org_dir/.git/' --delete $org_dir/*.org $org_dest


# rsync -a --exclude '/home/donagh/Dropbox/org-mode/org/.git/' --delete /home/donagh/BACKUPS/orgmode_SNAPSHOTS

