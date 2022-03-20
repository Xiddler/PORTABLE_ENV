#!/bin/bash

filen='/home/donagh/TODO/TODO.ods'

# create a new csv file based on the name of the original
unoconv -f csv -o '/home/donagh/TODO/CSV/TODO.csv' $filen


fileCSV='/home/donagh/sd64/TODO/CSV/TODO.csv'

# prettified output to terminal
# column -s, -t < $fileCSV

# using the Rich library for prettification
python /home/donagh/PORTABLE_ENV/scripts/mytasks.py




