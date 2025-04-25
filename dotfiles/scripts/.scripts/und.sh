#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.
#
# PURPOSE
# Author: Donagh McCarthy 
# Date: 2025-04-17
# Script takes the title of an article copied from the web — it will have spaces between the words — and replaces the 
# spaces with _ and then opens a new file in vim to allow pasting in the article complete with correct article name

# aliased to undpdf

# Enter the title of the article 
echo "Enter the string"

read myvar

# replace the spaces with underscores
mynew=${myvar// /_}

# set the file path
mydest=/home/donagh/REPOS/books/Articles/Articles_downloaded/$mynew.md

# edit the file in the appropriate directory using vim
vim $mydest




