#!/usr/sbin/env bash 
# 2026-02-21 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.
echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p

sleep 20

nohup ~/.dropbox-dist/dropboxd&




