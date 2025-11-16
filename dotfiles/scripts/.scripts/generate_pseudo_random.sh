#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here
# hex2dec $(upper  $(cat /proc/sys/kernel/random/uuid | sed 's/-//g'))

a=$(cat /proc/sys/kernel/random/uuid)
# echo $a

b=$(echo $a | sed 's/-//g')
# echo $b
c=$(echo $b | tr '[:lower:]' '[:upper:]') 
echo $c

# d=$(hex2dec $c)
# echo $d



# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.


