#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR


# open 4 panes in tmux as follows:
# 1. ZIM -  sudo /usr/sbin/zim for workspace 2
# 2. DROPBOX - echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p && ~/.dropbox-dist/dropboxd
# 3. BOOKS - s_books
# 4. PASSWORDS - s_passwords


# To make a new session
# tmux new -s tmux_servers
#
# To detach
# Ctrl-A D

tmux attach-session -t tmux_servers

