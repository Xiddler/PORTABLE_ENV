#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.

#NOTE
# Using a zsh_alias
# ->% sourcevenv <folder> 


# source /home/donagh/.virtualenvs/beauty-http-server/bin/activate
# echo "browse to http://192.168.1.86:8080/"
# source ~/.virtualenvs/beauty-http-server/bin/activate

# sleep 5

# echo "activating beauty-http-server venv"

