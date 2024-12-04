#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.
echo 'Enter no. of command :-   \
    1. SELECT * FROM words;  \
    2. DELETE FROM words WHERE id= ' ;

read cmd;


case $cmd in
    1) sqlite3 /run/media/donagh/USB128GB/REPOSITORIES/2programming/python/1python_projects/dict_cli/donaghs_words.db "SELECT * FROM words;"
        ;;
    2) echo 'Enter id number for row to delete';
        read idn;
        sqlite3 /run/media/donagh/USB128GB/REPOSITORIES/2programming/python/1python_projects/dict_cli/donaghs_words.db \
            "DELETE FROM words WHERE id=$idn;"
        ;;
    *) 
        ;;
 esac 

