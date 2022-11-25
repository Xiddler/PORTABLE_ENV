#!/bin/env bash
# created 2022-11-22
# the idea is to run this after a reboot to save me doing it manually -- but it might just be safer to do it manually...
# REM 
# echo "1234" | sudo -S command 

# QUICKLY AFTER a REBOOT 
# cifs_share
# sudo mount -t cifs //192.168.1.24/USB128_2 /mnt/cifs_share -o username=admin,password=admin,iocharset=utf8,vers=3.1.1
echo "1234" | sudo -S mount -t cifs //192.168.1.24/USB128_2 /mnt/cifs_share -o username=admin,password=admin,iocharset=utf8,vers=3.1.1
# rem: caffeine  (replaced by KDE power management option in Battery icon
# dropbox 
echo fs.inotify.max_user_watches=100000 | echo "1234" | sudo -S tee -a /etc/sysctl.conf; sudo sysctl -p && ~/.dropbox-dist/dropboxd
# python servers for LAN
# passwords
# alias -g s_passwords='python -m http.server 8088  --directory ~/DONAGHS/MY_ZIM/Computer --bind 0.0.0.0'
python -m http.server 8088  --directory ~/DONAGHS/MY_ZIM/Computer --bind 0.0.0.0
# s_passwords
# books
# alias -g s_books='python -m http.server 8089  --directory ~/REPOS/books --bind 0.0.0.0'
python -m http.server 8089  --directory ~/REPOS/books --bind 0.0.0.0
s_books
# zim - first mount the SD Card
echo "1234" | sudo -S /usr/sbin/zim 
