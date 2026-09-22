#!/usr/sbin/env bash 
# /home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts                    

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.

# 2026-09-19 
# /home/donagh/BACKUPS/restic-repo
# env. variables
RESTIC_PASSWORD_FILE=/home/donagh/REPOS/SECURITY/restic_password_file.txt
RESTIC_PASSWORD='64-!-rEstic_bacKup_sep2026-!-64'
# alias restc() { restic -r ~/BACKUPS/restic-repo -p $RESTIC_PASSWORD_FILE $1 }
#
# zim-wiki LINUX:1Linux Live USB:01installed apps:restic — opened 2026-09-18
#

# BACKUP
restic -r /home/donagh/BACKUPS/restic-repo --verbose -p $RESTIC_PASSWORD_FILE backup /home/donagh/DONAGHS/personal /home/donagh/DONAGHS/all_org

# crontab set up on 2026-09-19 
# 15 6 * * * /home/donagh/.scripts/restic_backups.sh
