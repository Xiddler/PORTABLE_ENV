#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

zArchive='/home/donagh/DONAGHS/personal/zArchive/'
dotgit='/home/donagh/DONAGHS/personal/.git/'
source='/home/donagh/DONAGHS/personal/'
destination='/home/donagh/BACKUPS/RSYNCED/personal/'

# original
# rsync -a --exclude '/home/donagh/DONAGHS/personal/zArchive' --exclude '/home/donagh/DONAGHS/personal/.git/' --delete /home/donagh/DONAGHS/personal/ /home/donagh/BACKUPS/RSYNCED/personal/

# edited 2024-07-02
rsync -a --exclude $zArchive --exclude $dotgit --delete  $source $destination

# NOTE
# rsync source destination
# -a is --archive which is short for -rlptgoD (see man rsync)
# Rsync by default has an additive nature. 
# To also delete a file in destination/ when the source file is deleted, pass the --delete option.


