#!/bin/bash


# see cheat rsync or man rsync for help

# this script backs up the files and folders of value to 
# ~/BACKUPS/RSYNCED which is symlinked to ~/cifs_share/RSYNCED linked to the RPi
# ln -s ~/cifs_share/RSYNCED ~/BACKUPS/RSYNCED

# password=1234

# sudo -S <<< "password" command
# sudo -S <<< 1234  rsync 


# source directory on laptop is
#$HOME/BACKUPS/RSYNCED              (symlinked to ~/cifs_share/RSYNCED)

# destination is RPi/usb_128/RSYNCED

# zim_ORG
sudo rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/BACKUPS/RSYNCED/zim_ORG && \
sudo rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/BACKUPS/RSYNCED/zim_ORG

# zim_Computer
sudo rsync -a --delete ~/DONAGHS/MY_ZIM/Computer ~/BACKUPS/RSYNCED/zim_Computer && \
sudo rsync -a --delete ~/DONAGHS/MY_ZIM/Computer.txt ~/BACKUPS/RSYNCED/zim_Computer

# personal
sudo rsync -a --delete ~/DONAGHS/personal/ ~/BACKUPS/RSYNCED/personal/

# all_orgmode
sudo rsync -a --delete  ~/Dropbox/org-mode/org ~/BACKUPS/RSYNCED/all_org/


