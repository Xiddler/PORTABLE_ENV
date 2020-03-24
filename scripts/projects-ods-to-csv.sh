#!/bin/bash


filen1='/home/donagh/TODO/PROJECTS.ods'

unoconv -f csv -o '/home/donagh/TODO/PROJECTS.csv' $filen1


fileCSV1='/home/donagh/TODO/PROJECTS.csv'

column -s, -t < $fileCSV1


