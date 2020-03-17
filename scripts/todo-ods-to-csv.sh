#!/bin/bash


filen='/home/donagh/TODO/TODO.ods'

unoconv -f csv -o '/home/donagh/TODO/TODO.csv' $filen

# sleep 4



fileCSV='/home/donagh/TODO/TODO.csv'

column -s, -t < $fileCSV


