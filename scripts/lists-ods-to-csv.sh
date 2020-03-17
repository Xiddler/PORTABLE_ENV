#!/bin/bash


filen1='/home/donagh/TODO/LISTS.ods'

unoconv -f csv -o '/home/donagh/TODO/LISTS.csv' $filen1

# sleep 4



fileCSV1='/home/donagh/TODO/LISTS.csv'

column -s, -t < $fileCSV1


