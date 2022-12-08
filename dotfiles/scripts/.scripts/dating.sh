#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

TODAY=`date +%d-%m-%Y`
TODAYR=`date +%u`
if [ ${TODAYR} -eq 5 ]
        then
        DD2=`TZ="GMT-72" date +'%d'`
else
        DD2=`TZ="GMT-24" date +'%d'`
fi

echo $TODAYR
echo "$DD2"
# if [ ${DD} -gt ${DD2} ]
# then
# echo "is ok?"

