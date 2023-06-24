#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR


while true; do

inotifywait -e modify,create,delete,move -r $1

done

