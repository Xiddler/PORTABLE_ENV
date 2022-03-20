#!/bin/bash









# the following will spit out the definitions of all words in a file it has a def for from the oxford_dict.txt file.
# usage ./get_defs <filename>
# while IFS='' read -r line || [[ -n "$line" ]]; do
while IFS='' read  line || [[ -n "$line" ]]; do
    # cat /media/donagh/3520-FD13/1donaghs-stuff/Dictionaries/Oxford_English_Dictionary/oxford_dict.txt | grep ^$line
    dict $line
done < "$1"
