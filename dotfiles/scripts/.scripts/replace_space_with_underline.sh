#!/bin/env bash

set -e

echo "This script will replace a single space with a _ for use when making filenames in Linux"

echo  "Paste in the item..." 

read  m

echo " "

echo "$m will now have it's spaces replaced with _ and .md appended to create a markdown file"

echo " "

# echo "$m" | sed -e 's/\s/_/g' | xclip -selection clipboard
echo "$m.md" | sed -e 's/\s/_/g'  > /tmp/clipped.txt && cat /tmp/clipped.txt
# echo "$m.md" | sed -e 's/\s/_/g'  | cp {} /tmp/clipped.txt && cat /tmp/clipped.txt




