#!/usr/sbin/env bash 
# aliased to ->% strlen

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

echo -n "Type in / paste in the string and then press Enter: "

read str

length=$(expr length "$str")
echo "Length of string is $length"

