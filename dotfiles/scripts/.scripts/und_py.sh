#!/usr/sbin/env python

# NOTE: This has been replaced by und.sh on 2025-04-17

# Author: Donagh McCarthy 
# Date: 2025-04-12

# Purpose
# SUMMARY: This is a python program run in the shell to replace spaces with underscore in the title of articles
#
# NOTE: The problem I needed to overcome was that I couldn't get clipboard to work in the ssh ie DISPLAY null when I tried to use xclip, xsel etc.
#
# When I want to save an online article I open a markdown file using vim and paste the contents of the article into the vim buffer
# But first I need to name the file 
# The article usually has spaces between the words and I want my file names to have _ instead of spaces. It's not Windows!
# That is the purpose of this script
# The zsh_alias is und()

import subprocess

d = input("Enter the string: ")

# replace spaces with underscores
n = d.replace(" ", "_")
# append .md for markdown filename
n = n.rstrip('_') + ".md "


# create a file to temporarily store stuff
und_store = "/tmp/underscore_store.txt"

# write the title to the temporary file
with open(und_store, "w") as f:
    f.write(n)


print("-------------------------------------------")

# create list — I tried not using and it caused 'issues'
c = []

with open("/tmp/underscore_store.txt", "r") as g:
    m = g.read()
    c.append(m)


# strip trailing space
j = c[0].rstrip(' ')

k = "/home/donagh/REPOS/books/Articles/Articles_downloaded/" + j

print("You have created the file", k)


# Open markdown file using vim in the Articles_downloaded directory
subprocess.run(['vim', k])



