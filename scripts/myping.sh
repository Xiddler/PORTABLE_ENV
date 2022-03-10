#!/bin/bash

# This script will ping at intervals

HOST="8.8.8.8"
WAITFOR=5
TIMES=3

# ping $HOST -c $TIMES -i $WAITFOR &> /dev/null
ping $HOST -c $TIMES -i $WAITFOR 
pingReturn=$?

echo "----------------------"
echo $pingReturn

if [ $pingReturn -eq 0 ]; then
    # It works
    echo "Success!!!"
    exit 0
else
    # No access
    echo "Fail"
    exit 1
fi
