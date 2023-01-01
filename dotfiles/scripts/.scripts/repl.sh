#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

s=2
t='a'
u=$s+$t
echo $u



