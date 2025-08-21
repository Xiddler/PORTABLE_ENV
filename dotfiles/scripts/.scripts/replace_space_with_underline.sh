#!/bin/env bash

set -e

echo "This script will replace a single space with a _ (the default)"

echo  "Paste in the item..." 

read  m

echo " "

echo "$m will now have it's spaces/dashes replaced with _ and then .md appended to create a markdown file"

echo " "

# echo "$m" | sed -e 's/\s/_/g' | xclip -selection clipboard
# the following works
# echo "$m.md" | sed -e 's/[ |-]/_/g'  > /tmp/clipped.txt && cat /tmp/clipped.txt
echo "$m" | tr ' ' '_' > /tmp/clipped.txt && cat /tmp/clipped.txt
# echo "$m.md" | sed -e 's/[-\s]/_/g'  > /tmp/clipped.txt && cat /tmp/clipped.txt
# echo "$m.md" | sed -e 's/[^a-zA-Z\s\.]/_/g'  > /tmp/clipped.txt && cat /tmp/clipped.txt
# extended to include replacing - as well as single space
# echo "$m.md" | sed -e 's/\s/_/g'  | cp {} /tmp/clipped.txt && cat /tmp/clipped.txt


# the-rise-and-fall-of-the-hanseatic-league
# ❯ echo $s | sed -e 's/[^a-zA-Z\s]/ /g'
# the rise and fall of the hanseatic league

# NOTE:  Could've used tr ' ' '_'
# added 2025-08-13



