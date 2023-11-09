#!/usr/sbin/env bash 
# /home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts/list_all_git_repos.sh

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

printf "Date 2023-11-07
All git repos: Linux & Windows
"

printf "
LINUX
~/PORTABLE_ENV
~/Dropbox/org-mode/org
~/DONAGHS/personal
~/DONAGHS/all_org
~/DONAGHS/MY_ZIM/Computer
"

# WINDOWS
printf '
WINDOWS
C:\\Users\\don_l\\Win_PORTABLE_ENV 
C:\\Users\don_l\\Applications\\Zim_wiki\\MY_ZIM\Computer
'
