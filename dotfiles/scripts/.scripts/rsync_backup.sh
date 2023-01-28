#!/bin/bash


# see cheat rsync or man rsync for help

# this script backs up the files and folders of value to 
#
########################################
#
# REM: after pressing enter for rsyncz (the alias for this script), zsh will prompt for sudo password, ignore and press Enter. Don't enter the # password.
#
########################################

# ignore this directory: --exclude '/home/donagh/cifs_share/RSYNCED/personal/.git/'

password=1234

# sudo -S <<< "password" command
# sudo -S <<< 1234  rsync 


# source directory on laptop is
#$HOME/BACKUPS/RSYNCED              (symlinked to ~/cifs_share/RSYNCED)

# destination is RPi/usb_128/RSYNCED

###############
### zim_ORG ###
###############

# To the HDD of the laptop 
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/BACKUPS/RSYNCED/zim_ORG && \
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/BACKUPS/RSYNCED/zim_ORG

# To the USB of the RPi 
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/cifs_share/RSYNCED/zim_ORG && \
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/cifs_share/RSYNCED/zim_ORG


# One-liner and enter password TO Laptop
# sudo rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/BACKUPS/RSYNCED/zim_ORG && sudo rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/BACKUPS/RSYNCED/zim_ORG

####################
### zim_Computer ### 
####################

# To the HDD of the laptop 
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/Computer ~/BACKUPS/RSYNCED/zim_Computer && \
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/Computer.txt ~/BACKUPS/RSYNCED/zim_Computer

# To the USB of the RPi 
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/Computer ~/cifs_share/RSYNCED/zim_Computer && \
sudo -S <<< $password rsync -a --delete ~/DONAGHS/MY_ZIM/Computer.txt ~/cifs_share/RSYNCED/zim_Computer

# One-liner and enter password TO Laptop
sudo rsync -a --delete ~/DONAGHS/MY_ZIM/Computer ~/BACKUPS/RSYNCED/zim_Computer && sudo rsync -a --delete ~/DONAGHS/MY_ZIM/Computer.txt ~/BACKUPS/RSYNCED/zim_Computer


#################
###  personal ###
#################

# To the HDD of the laptop 
sudo -S <<< $password rsync -a --exclude '/home/donagh/cifs_share/RSYNCED/personal/.git/' --delete ~/DONAGHS/personal/ ~/BACKUPS/RSYNCED/personal/

# To the USB of the RPi 
# sudo -S <<< $password rsync -a --exclude '/home/donagh/cifs_share/RSYNCED/personal/.git/' --delete ~/DONAGHS/personal/ ~/cifs_share/RSYNCED/personal/



###################
### all_orgmode ###
###################

# To the HDD of the laptop 
sudo -S <<< $password rsync -a --delete  ~/Dropbox/org-mode/org ~/BACKUPS/RSYNCED/all_org/


# To the USB of the RPi 
sudo -S <<< $password rsync -a --delete  ~/Dropbox/org-mode/org ~/cifs_share/RSYNCED/all_org/





