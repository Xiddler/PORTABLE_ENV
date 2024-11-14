#!/usr/sbin/env bash 
#
#/home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts
# see zim-wiki/PROTOCOLS/MY_LOCKER
#
# This script backsup my important folders to the Toshiba laptop at $HOME/MY_LOCKER
# Approx. size of $TARTARGET is 400MB
# Backup weekly

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# check the last MY_ZIM_<DATE>.zip in /home/donagh/samba/anonymous_shared_directory/MY_ZIM/Zipped_MY_ZIM_date
# How can I avoid hard coding `today` here?
# Rem: MY_ZIM is copied from Win11 to Toshiba at 18:45 daily (so on a Friday before the MY_LOCKER backup)
# and MY_LOCKER is backed up on the Saturday morning at 5:19

# for MY_ZIM
yesterday=$(date  --date="yesterday" +"%Y-%m-%d")
# for MY_LOCKER
today=$(date +"%Y-%m-%d")


# org_dir="/home/donagh/Dropbox/org-mode/org/"
# org_dest="/home/donagh/BACKUPS/orgmode_SNAPSHOTS/"



# Folders
all_org="/home/donagh/Dropbox/org-mode/org"
personal="/home/donagh/DONAGHS/personal"
# also on Github
# PORTABLE_ENV="/home/donagh/PORTABLE_ENV"
# zipped file
# example: /home/donagh/samba/anonymous_shared_directory/MY_ZIM/Zipped_MY_ZIM_date/MY_ZIM_2023-10-03.zip
MY_ZIM="/home/donagh/samba/anonymous_shared_directory/MY_ZIM/Zipped_MY_ZIM_date/MY_ZIM_$yesterday.zip"

# Target file
# TARTARGET="/home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-$today.tar.gz"
TARGET="/mnt/SHED_BU_28G_USB"

# tar -czf $TARTARGET $all_org $personal $PORTABLE_ENV $MY_ZIM

# NOTE
# Don't try to set ownership on the server. Use rsync -rltgoDv ... instead of rsync -av .... -a is equivalent to -rlptgoD; 
# leaving off the -p means it won't try to set ownership on the target files, it'll just store them all as the current (authenticated to server) user.

# personal
# rsync -a --exclude '$personal/.git/' --delete $personal $TARGET/personal

# rsync -rltgoDv --exclude '$personal/.git/' --delete $personal $TARGET/personal

# all_org
# rsync -a --exclude '$all_org/.git/' --delete $all_org/*.org $TARGET/all_org
rsync -a --exclude '$all_org/.git/' --delete $all_org/*.org $TARGET
# rsync -rltgoDv  --exclude '$all_org/.git/' --delete $all_org/*.org $TARGET/all_org

# rsync -av --no-perms --no-o --no-g --exclude '$all_org/.git/' --delete $all_org/*.org $TARGET/all_org

# ERROR MSG
# sending incremental file list
# contacts.org
# info.org
# org.org
# rsync: [receiver] mkstemp "/mnt/SHED_BU_28G_USB/all_org/.contacts.org.3VD4FU" failed: Permission denied (13)
# rsync: [receiver] mkstemp "/mnt/SHED_BU_28G_USB/all_org/.info.org.ZH9VoB" failed: Permission denied (13)
# rsync: [receiver] mkstemp "/mnt/SHED_BU_28G_USB/all_org/.org.org.94udZU" failed: Permission denied (13)
# todos.org
# rsync: [receiver] mkstemp "/mnt/SHED_BU_28G_USB/all_org/.todos.org.uQfDRV" failed: Permission denied (13)
# worksearch.org
# rsync: [receiver] mkstemp "/mnt/SHED_BU_28G_USB/all_org/.worksearch.org.cbwSby" failed: Permission denied (13)

# sent 470,213 bytes  received 111 bytes  940,648.00 bytes/sec
# total size is 469,740  speedup is 1.00
# rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1338) [sender=3.3.0]
# error: Script failed: see failed command above

