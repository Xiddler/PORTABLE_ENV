#!/usr/sbin/python3
# encoding: utf-8

'''
I am able to access my .md files through Obsidian which is an
Electron app that allows bi-directional file linking.
In Obsidian the files are referenced using Obsidian URl.
This script translates Obsidian URL to ext4 filepath strings.

# Note: if I right-click on a file in Obsidian it will allow me to copy
# the Obsidian URL. I would like to be able to open this in the terminal.

'''

import re


# What I want is to change:
# from --> obsidian://open?vault=personal&file=journal%2F2021%2F09%2F02-09
# to --> ~/DONAGHS/personal/journal/2021/09/02-09.md



# src = "obsidian://open?vault=personal&file=journal%2F2021%2F09%2F02-09"
# src = 'obsidian://open?vault=personal&file=journal%2F2020%2F08%2F17-08'

src = input("Paste the Obsidian URL here :")



pat = "obsidian://open\?vault\=(.*)\&file\=(.+)%2F(\d{4})%2F(\d{2})%2F(\d{2})-(\d{2})"

res = re.match(pat, src)

m = res.groups()
# print(m)

mypath = f'DONAGHS/{m[0]}/{m[1]}/{m[2]}/{m[3]}/{m[4]}-{m[5]}.md'
# print(type(mypath))
print('~/' + mypath)

# check if file exists:
from os.path import exists

base_dir = '/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/'
my_file_path = base_dir + mypath

file_exists = exists(my_file_path)
if file_exists:
    print("This file exists: " + my_file_path)

else:
    print("This filepathname does not exist")

edit = input("Do you wish to open this file? ( Y/N ) ")
if edit = 'N':
    print("Done")



# TODO
# 1. Ask for user input to paste in the Obs URL                        DONE
# 2. Provide option to open the file in vim
# 3. Refactor the whole script using the click library




