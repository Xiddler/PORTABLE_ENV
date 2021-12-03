#!/usr/bin/python3
# encoding: utf-8

# this iterates through all the .*.json files in ~/PORTABLE_ENV/autokey directory and displays
# keybindings and the associated action or output

import json
import os
from os.path import exists
from tabulate import tabulate
import string




# required, iterate through full file list of .json files in base_dir
base_dir = '/home/donaghm/PORTABLE_ENV/autokey/'

list_of_files = os.listdir(base_dir) # all extensions

dot_files = [f for f in list_of_files if f.startswith('.')] #.sort() # .*.json
txt_files = [f for f in list_of_files if not f.startswith('.')] #.sort()  # .txt & .py files

txt_files.sort() # all the .txt & .py files in autokey/ SORTED
dot_files.sort() # all the .json files in autokey/ SORTED

compare = list(zip(txt_files, dot_files)) # list of e.g.('xmodmap.txt', '.xmodmap.json')

# separate out the pairs of py + .json and the .txt + .json
py_json_pairs = []
txt_json_pairs = []
for ntuple in compare:
    if ntuple[0].endswith(".py"):
        py_json_pairs.append(ntuple)
    else:
        txt_json_pairs.append(ntuple)

# separate the .py autokeys into a.triggered by 'abbreviations' and b. triggered by 'modifiers + hotkeys'
py_hotk = [] # container for .py files trigged by 'hotks'
py_abbs = [] # container for .py files trigged by 'abbs'
txt_abbs = [] # container for .txt autos triggered by 'abbs'
letters = string.ascii_lowercase # the alphabet

# py_hotk & py_abbs
# append filename and hotkeys & modifiers and action to the list py_hotk
for ntuple in py_json_pairs: # py_json_pairs comes from compare
    js_file = base_dir+ntuple[1]
    py_file = base_dir+ntuple[0]
    with open(js_file) as j:
        h = json.load(j)
        for_script = h['hotkey']['hotKey']
        mods = h['hotkey']['modifiers']
        desc = h['description']
        abb_cont = h['abbreviation']['abbreviations']
        if str(for_script) in letters:
            py_hotk.append([ntuple[0], mods[0], mods[1],for_script, desc])
        elif len(abb_cont) > 0:
            # print(abb_cont)
            py_abbs.append([ntuple[0], abb_cont[0], desc])


# append filename (both .txt and .py), phrase and output to py_abbs
for ntuple in txt_json_pairs:
    txt_file = base_dir+ntuple[0]
    json_file = base_dir+ntuple[1]
    with open(txt_file) as t:
        s = t.readlines()
    with open(json_file) as j:
        h = json.load(j)
        abb_cont = h['abbreviation']['abbreviations']
        desc = h['description']
        mods = h['hotkey']['modifiers']
        if len(mods) == 0:
            txt_abbs.append([ntuple[0],abb_cont[0], s[0]])


# KEEP THESE
print('=======================================================')
print("HOTKEY-TRIGGERED AUTOS - .PY SCRIPTS")
print (tabulate(py_hotk, headers=["File", "Mod 1", "Mod 2", "Hotkey", "Action"]))

print('=======================================================')
print('ABBS-TRIGGERED .PY SCRIPTS')
print (tabulate(py_abbs, headers=["File", "Keys", "Output", "", ""]))

print('=======================================================')
print("ABBS-TRIGGERED FROM .TXT FILES")
print (tabulate(txt_abbs, headers=["File", "Keys", "Output", "", ""]))


