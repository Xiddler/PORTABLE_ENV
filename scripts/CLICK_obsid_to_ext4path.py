#!/usr/sbin/python3
# encoding: utf-8

'''
2021-12-19

transform Obsidian URL into a ext4 filepath. Currently for journal only.

'''

import click
import re
from os.path import exists

# ----------------------------------------------------------------------------
# transform Obsidian URL into a ext4 filepath

print(" ")
src = input("Paste the Obsidian URL here : ")
# sample: obsidian://open?vault=personal&file=journal%2F2021%2F01%2F13-01

pat = "obsidian://open\?vault\=(.*)\&file\=(.+)%2F(\d{4})%2F(\d{2})%2F(\d{2})-(\d{2})"
res = re.match(pat, src)

m = res.groups()

mypath = f'DONAGHS/{m[0]}/{m[1]}/{m[2]}/{m[3]}/{m[4]}-{m[5]}.md'

# ----------------------------------------------------------------------------
# check if file exists with option to open in vim

base_dir = '/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/'
my_file_path = base_dir + mypath

if exists(my_file_path):
    print("File exists!\n")
    edit = input("Do you want to edit this file in vim? Y/N ")

    if edit == 'Y' or 'y':
        click.edit(filename=my_file_path)
    else:
        print("This filepathname does not exist")

# END

