#!/bin/bash

# doom emacs
~/.emacs.d/bin/doom run && bg



# dropbox daemon
sudo echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p &&  ~/.dropbox-dist/dropboxd && bg

# zim
sudo /usr/sbin/zim





