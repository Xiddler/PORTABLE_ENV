#!/bin/env bash

# 2022-03-10

# sudo -S <<< "password" command

# (trap 'kill 0' SIGINT; cd ~/DONAGHS/MY_ZIM/Computer && python3 -m http.server 5000 ; fg)
(trap 'kill 0' SIGINT; cd ~/DONAGHS/MY_ZIM/Computer && python3 -m http.server 5000 & echo fs.inotify.max_user_watches=100000 | sudo -S <<< 1234 tee -a /etc/sysctl.conf; sudo sysctl -p && ~/.dropbox-dist/dropboxd &)

