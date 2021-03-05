#!/bin/bash

# alias to run this is set in .zsh_aliases
# borgz

# declare variables
now=$(date +%Y_%m_%d_%H_%M)

# S = Source

S_zim_compu="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM/Computer"
# The following is only required once
# S_zim_compuTXT="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM/Computer.txt"

S_tia="/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/EDUCATION/Courses_2021/CompTIA_2021"




borg create --stats --progress --compression lz4 '/home/donaghm/SAFE/SAFE_borg_backup/::zim_compu-{now}' $S_zim_compu
# borg create --stats --progress --compression lz4 '/home/donaghm/SAFE/SAFE_borg_backup/::zim_compuTXT-{now}' $S_zim_compuTXT
borg create --stats --progress --compression lz4 '/home/donaghm/SAFE/SAFE_borg_backup/::TIA_Notes-{now}' $S_tia

# copy to RPi 
# sudo cp -r $HOME/SAFE/SAFE_borg_backup $HOME/cifs_share
# option with no intervention
echo "1234" | sudo -S cp -r $HOME/SAFE/SAFE_borg_backup $HOME/cifs_share

echo "Zim_Computer successfully compressed, encrypted and backed up to ~/cifs_share which is the USB on the RPi"

