#!/usr/bin/python3
# encoding: utf-8

'''
This script iterates through all the .*.json files in ~/PORTABLE_ENV/autokey/ and
outputs keybindings and the associated action or output in tabular form
2021-12-03_15:11: Your code has been rated at 9.64/10 (previous run: 9.45/10, +0.18)
2021-12-03_18:08: Your code has been rated at 10.00/10 (previous run: 9.82/10, +0.18)
Thanks also to doom-emacs linting!
'''

import json
import os
from string import ascii_lowercase

from tabulate import tabulate



# required, iterate through full file list of .json files in BASE_DIR
BASE_DIR = '/home/donagh/PORTABLE_ENV/autokey/Donaghs/'

list_of_files = os.listdir(BASE_DIR) # all extensions

dot_files = [f for f in list_of_files if f.startswith('.')] #.sort() # .*.json
txt_files = [f for f in list_of_files if not f.startswith('.')] #.sort()  # .txt & .py files

txt_files.sort() # all the .txt & .py files in autokey/ SORTED
dot_files.sort() # all the .json files in autokey/ SORTED

compare = list(zip(txt_files, dot_files)) # list of e.g.('xmodmap.txt', '.xmodmap.json')

# separate out the pairs of py + .json and the .txt + .json
py_json_pairs = [] # .py files and their matching .json file
txt_json_pairs = [] # .txt files and their matching .json file
for ntuple in compare:
    if ntuple[0].endswith(".py"):
        py_json_pairs.append(ntuple)
    else:
        txt_json_pairs.append(ntuple)

# separate the .py autokeys into a.triggered by 'abbreviations' and
# b. triggered by 'modifiers + hotkeys'
py_hotk = [] # container for .py files trigged by 'hotks'
py_abbs = [] # container for .py files trigged by 'abbs'

LETTERS = ascii_lowercase # the alphabet

# py_hotk & py_abbs
# append filename and hotkeys & modifiers and action to the list py_hotk
for ntuple in py_json_pairs: # py_json_pairs comes from compare
    js_file = BASE_DIR+ntuple[1]
    py_file = BASE_DIR+ntuple[0]
    with open(js_file, encoding="utf8") as j:
        h = json.load(j)
        for_script = h['hotkey']['hotKey']
        mods = h['hotkey']['modifiers']
        desc = h['description']
        abb_cont = h['abbreviation']['abbreviations']
        if str(for_script) in LETTERS:
            py_hotk.append([ntuple[0], mods[0], mods[1],for_script, desc])
        elif len(abb_cont) > 0:
            # print(abb_cont)
            py_abbs.append([ntuple[0], abb_cont[0], desc])


txt_abbs = [] # container for .txt autos triggered by 'abbs'

# txt_abbs
# append filename, phrase-trigger & description and output to txt_abbs
for ntuple in txt_json_pairs:
    txt_file = BASE_DIR+ntuple[0]
    json_file = BASE_DIR+ntuple[1]
    with open(txt_file, encoding="utf8") as t:
        s = t.readlines()
    with open(json_file, encoding="utf8") as j:
        h = json.load(j)
        abb_cont = h['abbreviation']['abbreviations']
        desc = h['description']
        mods = h['hotkey']['modifiers']
        if len(mods) == 0:
            txt_abbs.append([ntuple[0],abb_cont[0], s[0]])


# KEEP THESE
ans = 'y'
while ans == 'y':
    print('=======================================================')
    print("HOTKEY-TRIGGERED AUTOS - .PY SCRIPTS")
    print (tabulate(py_hotk, headers=["File", "Mod 1", "Mod 2", "Hotkey", "Action"]))
    ans = input("Continue? (press y [Enter] to continue) ")
    print(ans)

    print('=======================================================')
    print('ABBS-TRIGGERED .PY SCRIPTS')
    print (tabulate(py_abbs, headers=["File", "Keys", "Output", "", ""]))
    ans = input("Continue? (press y [Enter] to continue) ")

    print('=======================================================')
    print("ABBS-TRIGGERED FROM .TXT FILES")
    print (tabulate(txt_abbs, headers=["File", "Keys", "Output", "", ""]))
    ans = input("Continue? (press y [Enter] to continue) ")
    ans = 'n'


