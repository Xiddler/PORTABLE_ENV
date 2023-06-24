#!/bin/bash


# 17 June 2023 
# see cheat rsync or man rsync for help

# This script backs up the files and folders of value to MyUSB while it is attached to the laptop.
# See (rsync_backup.sh) for backing up when MyUSB1 is attached to the RPI 
#
# Folders of value
# DONAGHS/personal
# zim_Computer
# all_org/org
# zim_ORG
#
########################################
#
# REM: after pressing enter for rsyncz (the alias for this script), zsh will prompt for sudo password, ignore and press Enter. Don't enter the # password.
#
########################################

# ----------------------------------------------------------------------------------------

# NOTES:
# 3 locations !!
# 1. the original
# 2. $HOME/BACKUPS/RSYNC to laptop HDD
# 3. MyUSB {128GB}  (can be attached to the RPI or the Laptop. This script is when it's attached to the laptop)

# ignore this directory: --exclude '/home/donagh/cifs_share/RSYNCED/personal/.git/'
#
# ----------------------------------------------------------------------------------------

password=1234

# sudo -S <<< "password" command
# sudo -S <<< 1234  rsync 


# source directory on laptop is
#$HOME/BACKUPS/RSYNCED              
# /mnt/cif_share is symlinked to ~/cifs_share/RSYNCED 

# destination is /run/media/donagh/MyUSB/USB128_2/RSYNCED

###############
### zim_ORG ###
###############

# Backed up to ~/BACKUPS/RSYNCED/zim_ORG and checked was success 
# Backed up to /run/media/donagh/MyUSB/USB128_2/RSYNCED/zim_ORG and checked was success 
# DATES:
# 2023-06-18

# To the HDD of the laptop  (ie home folder)
# sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/BACKUPS/RSYNCED/zim_ORG && \
# sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/BACKUPS/RSYNCED/zim_ORG
sudo -S <<< 1234 rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/BACKUPS/RSYNCED/zim_ORG && \
sudo -S <<< 1234 rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/BACKUPS/RSYNCED/zim_ORG

# To the USB attached to the Laptop
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/cifs_share/RSYNCED/zim_ORG && \
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/cifs_share/RSYNCED/zim_ORG


# One-liner and enter password TO Laptop
# sudo rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/BACKUPS/RSYNCED/zim_ORG && sudo rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/BACKUPS/RSYNCED/zim_ORG

####################
### zim_Computer ### 
####################

# Backed up to ~/BACKUPS/RSYNCED/zim_Computer and checked was success 
# Backed up to /run/media/donagh/MyUSB/USB128_2/RSYNCED and checked was success 
# DATES:
# 2023-06-18

# To the HDD of the laptop 
sudo -S <<< 1234 rsync -a --delete ~/DONAGHS/MY_ZIM/Computer ~/BACKUPS/RSYNCED/zim_Computer && \
sudo -S <<< 1234 rsync -a --delete ~/DONAGHS/MY_ZIM/Computer.txt ~/BACKUPS/RSYNCED/zim_Computer


# To the MyUSB attached to the Laptop i.e. /run/media/donagh/MyUSB/USB128_2/RSYNCED
sudo -S <<< 1234 rsync -a --delete ~/DONAGHS/MY_ZIM/Computer /run/media/donagh/MyUSB/USB128_2/RSYNCED/zim_Computer && \
sudo -S <<< 1234 rsync -a --delete ~/DONAGHS/MY_ZIM/Computer.txt /run/media/donagh/MyUSB/USB128_2/RSYNCED/zim_Computer

# One-liner and enter password TO Laptop
# sudo rsync -a --delete ~/DONAGHS/MY_ZIM/Computer ~/BACKUPS/RSYNCED/zim_Computer && sudo rsync -a --delete ~/DONAGHS/MY_ZIM/Computer.txt ~/BACKUPS/RSYNCED/zim_Computer


#################
###  personal ###
#################

# Backed up to ~/BACKUPS/RSYNCED/personal and checked was success 
# Backed up to /run/media/donagh/MyUSB/USB128_2/RSYNCED/personal and checked was success 
# DATES:
# 2023-06-18


# To the HDD of the laptop 
# sudo -S <<< $password rsync -a --exclude '/home/donagh/cifs_share/RSYNCED/personal/.git/' --delete ~/DONAGHS/personal/ ~/BACKUPS/RSYNCED/personal/
sudo -S <<< 1234 rsync -a --exclude '/home/donagh/cifs_share/RSYNCED/personal/.git/' --delete ~/DONAGHS/personal/ ~/BACKUPS/RSYNCED/personal/

# To the USB of the RPi 
# sudo -S <<< $password rsync -a --exclude '/home/donagh/cifs_share/RSYNCED/personal/.git/' --delete ~/DONAGHS/personal/ ~/cifs_share/RSYNCED/personal/
sudo -S <<< 1234 rsync -a --exclude '/home/donagh/cifs_share/RSYNCED/personal/.git/' --delete ~/DONAGHS/personal/ /run/media/donagh/MyUSB/USB128_2/RSYNCED/personal/


###################
### all_orgmode ###
###################

# Backed up to ~/BACKUPS/RSYNCED/all_org and checked was success 
# Backed up to /run/media/donagh/MyUSB/USB128_2/RSYNCED/all_org and checked was success 
# DATES:
# 2023-06-18

# Back up from Dropbox to ~/BACKUPS of the HDD of the laptop 
# sudo -S <<< $password rsync -a --delete  ~/Dropbox/org-mode/org ~/BACKUPS/RSYNCED/all_org/
sudo -S <<< 1234 rsync -a --delete  ~/Dropbox/org-mode/org ~/BACKUPS/RSYNCED/all_org/

# Back up from Dropbox to ~/cifs_share which is mounted to the USB of the RPi 
# sudo -S <<< $password rsync -a --delete  ~/Dropbox/org-mode/org ~/cifs_share/RSYNCED/all_org/
sudo -S <<< 1234 rsync -a --delete  ~/Dropbox/org-mode/org /run/media/donagh/MyUSB/USB128_2/RSYNCED/all_org/





