#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR


# cifs_share
sudo mount -t cifs //192.168.1.24/USB128_2 /mnt/cifs_share -o username=admin,password=admin,iocharset=utf8,vers=3.1.1

# no password
# sudo -S <<< 1234 mount -t cifs //192.168.1.24/USB128_2 /mnt/cifs_share -o username=admin,password=admin,iocharset=utf8,vers=3.1.1
sleep 2

# no password 

# zim 
sudo /usr/sbin/zim
