#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# navigate to directory that has the latest file
cd /home/donagh/samba/anonymous_shared_directory/MY_ZIM/Zipped_MY_ZIM_date

# lt | awk 'FNR==3 { print  $9 }' | sed 's/MY_ZIM_//g' | sed 's/[\.]zip//g'

myzimdate="$(ls -t | xargs -n1 | awk ' FNR==1 { print $0 }' | sed 's/MY_ZIM_//g' | sed 's/[\.]zip//g')"

# echo $myzimdate

##############################################################################
#                           MY_PRECIOUS_DATA to RPi                          #
##############################################################################

# Format  MY_PRECIOUS_DATA-2024-01-06.tar.gz

mypreciousdir='/home/donagh/MY_LOCKER'
cd $mypreciousdir

# echo 'dir: ' $mypreciousdir

myprecname='MY_PRECIOUS_DATA-'

# extract date from filename
mypreciousdate="$(ls -t | xargs -n1 | awk ' FNR==1 { print $0 }' | sed 's/MY_PRECIOUS_DATA-//g' | sed 's/[\.]tar[\.]gz//g')"

# echo $mypreciousdate

mypreciousfile=$mypreciousdir/$myprecname$mypreciousdate.tar.gz

echo $mypreciousdate
echo $mypreciousfile

# output
# 2024-01-06
# /home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-2024-01-06.tar.gz
#
send_file="/home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-$mypreciousdate.tar.gz"
echo $send_file
# output
# /home/donagh/MY_LOCKER/MY_PRECIOUS_DATA-2024-01-06.tar.gz

# Next step to scp this file into RPi 




