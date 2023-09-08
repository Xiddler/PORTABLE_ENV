#!/bin/env bash

# dropbox
echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p && ~/.dropbox-dist/dropboxd

# cifs_share
# sudo mount -t cifs //192.168.1.108/USB128_2 /mnt/cifs_share -o username=admin,password=admin,iocharset=utf8,vers=3.1.1
