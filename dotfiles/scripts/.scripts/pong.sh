#!/bin/bash

# edited 2024-07-03
# to include if statement

signal=$(ping -c 4 1.1.1.1 | grep errors | cut -d ',' -f 4)

if $signal; then
    echo "Internet is up"
else
    echo "Internet is down"
fi

