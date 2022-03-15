#!/bin/env bash

# 2022-03-10

# The following avoids having to input the password
# sudo -S <<< "password" command

# PASSWORDS & DROPBOX
# expose 11SignUps.txt on LAN and run the dropbox daemon for org files all in one shell
# found the following on Unix-Exchange of Stack Exchange
(trap 'kill 0' SIGINT; cd ~/DONAGHS/MY_ZIM/Computer && python3 -m http.server 5000 & echo fs.inotify.max_user_watches=100000 | sudo -S <<< 1234 tee -a /etc/sysctl.conf; sudo sysctl -p && ~/.dropbox-dist/dropboxd &)

# CIFS_SHARE
# mount the cifs_share to USB128 on the RPi
sudo -S <<< 1234 mount -t cifs //192.168.1.108/USB128_2 /mnt/cifs_share -o username=admin,password=admin,iocharset=utf8,vers=3.1.1 
