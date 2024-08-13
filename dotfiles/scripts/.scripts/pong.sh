#!/bin/bash

# edited 2024-07-03
# to include if statement

signal=$(ping -c2 1.1.1.1 | grep rtt )

echo "$signal" && echo "internet is up"

# if  $signal; then
#     echo "$signal" && echo "internet is up"
# else
#     echo "internet is down"
# fi

# signal=$(ping -c 4 1.1.1.1 | grep errors | cut -d ',' -f 4)
# tell=$(ping -c4 1.1.1.1)

# if $signal; then
# if $tell; then
    # echo $tell
    # echo "Internet is up"
# else
    # echo "Internet is down"
# fi

