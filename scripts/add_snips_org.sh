#!/bin/bash
# 2022-01-16

# a script to run on the CLI to append a new snippet to snips.org
snipsorg="$HOME/DONAGHS/personal/ideas/snips.org"

read -p "Paste in or type the snippet to be added : " snip

today=$(date "+%Y-%m-%d")

org_format="*** $today"

new_snip="$org_format 
$snip"

# append date and snippet to snips.org
echo "$new_snip" >> "$snipsorg"

