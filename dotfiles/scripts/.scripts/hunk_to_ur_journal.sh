#!/usr/sbin/env bash 
# /home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts/hunk_to_ur_journal.sh

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# The slow brown sheep jumps over the lazy dog.


myfile="/home/donagh/DONAGHS/personal/5_Ur_Journal.md"

echo ' ' >> $myfile

date +"%A  %Y-%d-%mT%H:%M" >> $myfile

echo '------------------------- ' >> $myfile

copyq selection >> $myfile

echo ' ' >> $myfile

echo "DONE!  Date & hunk added to Ur_Journal.md"
