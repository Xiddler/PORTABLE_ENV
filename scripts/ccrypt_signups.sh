#!/bin/bash

computer='/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM/Computer'
signups='11SignUps.txt'
today=$(date +%Y_%m_%d)



plainfile=$computer/$signups
# plainfile_copy='$HOME/Dropbox/zim/BU_$today_$signups'

plainfile_copy=$HOME/BU_$(date +%Y_%m_%d)_$signups 

# touch $HOME/BU_$(date +%Y_%m_%d)_$signups 
touch $plainfile_copy


# echo $plainfile_copy

cat $plainfile >> $plainfile_copy


ccencrypt $plainfile_copy





