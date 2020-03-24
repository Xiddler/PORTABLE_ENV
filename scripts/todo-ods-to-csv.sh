#!/bin/bash


filen='/home/donagh/TODO/TODO.ods'

# create a new csv file based on the name of the original
unoconv -f csv -o '/home/donagh/TODO/TODO.csv' $filen


fileCSV='/home/donagh/TODO/TODO.csv'

# prettified output to terminal
column -s, -t < $fileCSV


