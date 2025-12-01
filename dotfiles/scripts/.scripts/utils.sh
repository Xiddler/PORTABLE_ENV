#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.

# This script is to remind me of the utilities I have used and found useful but may not use that often


echo '===================================='
echo 'git:                  g_run; g_zim, g_org, g_poe, g_pers' # runs a git status check on my main git repos
echo 'github creds:         zim:00Home:0 MEMOS:1 PATs Github for github tokens'
echo 'kanata:               keyboard mapping utility'
echo 'copyparty:            serves the LenArch system to the LAN'
echo 'keepr:                secrets / password manager'
echo 'cryptomator:          (Windows) application for keeping Dropbox folder/files encrypted. An encrypted repository.'
echo 'dropboxd:             Daemon for keeping Dropbox connected to the Toshiba laptop'
echo 'Mega — NZ:            Cloud storage with My Precious Data'
echo 'zim:                  Personal Knowledge Base for computer / IT stuff'
echo 'doom emacs:           for all the .org files'
echo 'passout:              script to retrieve credentials'
echo 'Windows password:     M'
echo 'LenArch password:     '
echo 'Toshiba password:     '
echo 'RaspPi password:      left pinky'
echo 'xorg-oclock           desktop mini-clock top right'
echo ' '
echo 'Backups at:           Toshiba HDD ~/BACKUPS/RSYNCED;  ~/samba/anonymous_shared_directory/MY_ZIM/RSYNCED/MY_ZIM/'
echo 'Backups at:           RPI USB - /media/donagh/MyUSB/MY_LOCKER_RPi' 
echo 'Backups at:           Dropbox - ~/Dropbox/org-mode/org; Cryptomator vault;' 
echo 'Backups at:           Mega - Cryptomator vault @ MEGA/MY_MEGA'
echo 'Backups at:           github - xiddler@github.com PORTABLE_ENV/ & Arch_PORTABLE_ENV/'
echo ' '
echo '===================================='
echo 'IP Toshiba            192.168.1.86'
echo 'IP Windows            192.168.1.49'
echo 'IP LenArch            192.168.1.51'
echo 'IP RPi                192.168.1.24'
echo 'IP Oppo phone         192.168.1.104'
echo 'IP Huawei phone       192.168.1.162'
echo 'IP Galaxy tablet      192.168.1.199'
echo '===================================='

