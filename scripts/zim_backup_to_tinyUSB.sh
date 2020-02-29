#!/bin/bash

# 2020-02-27 Manjaro

today=$(date +%Y-%m-%d)
# to HDD
tar -czf $HOME/sd64/zim_BU/zim_BU_$today.tar.gz $HOME/sd64/zim
cp -r $HOME/sd64/zim_BU/zim_BU_$today.tar.gz $HOME/Dropbox/zim/zim_backups

# to tinyUSB1 == db2bfe06-783d-4436-b9e7-1f989ae29310
# tar -czf /media/donagh/db2bfe06-783d-4436-b9e7-1f989ae29310/zim_BU/zim_BU_$today.tar.gz $HOME/sd35/zim

