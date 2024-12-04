#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

shopt -s nocasematch
# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.

echo "Enter name of a month"

read month

case $month in

  February)
    echo "28/29 days in $month"
    ;;

  April | June | September | November)
    echo "30 days in $month"
    ;;

  January | March | May | July | August | October | December)
    echo "31 days in $month"
    ;;

  *)
    echo "Unknown month: $month"
    ;;

esac

