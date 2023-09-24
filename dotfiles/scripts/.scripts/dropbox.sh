#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR


# to open dropbox for online 

#  one liner
# echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p && ~/.dropbox-dist/dropboxd


#  this will put the dropbox in the background

echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p

# allow the previous command to finish
sleep 5

nohup ~/.dropbox-dist/dropboxd& 
