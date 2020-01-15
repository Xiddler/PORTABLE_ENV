#!/bin/bash

# usage $def <word_sought> where def is aliased in .zshrc as: alias def='~/.scripts/get_defs.sh '
string=$1
#origingal
# first=`echo $string|cut -c1|tr [a-z] [A-Z]`
# my method
first=`echo "${string:0:1}" | tr '[:lower:]' '[:upper:]'`
second=`echo $string|cut -c2-`
myword=$first$second
echo $myword
# the following line works so keep it safe
cat /media/donagh/3520-FD13/1donaghs-stuff/Dictionaries/Oxford_English_Dictionary/oxford_dict.txt | grep `echo $myword`

# line=`cat /media/donagh/3520-FD13/1donaghs-stuff/Dictionaries/Oxford_English_Dictionary/oxford_dict.txt`
# echo $line | grep  `'^Film\s'`
# echo $line | grep  $myword
#
#
#
#
#
#
#
#
#
#
#
#
# the following will spit out the definitions of all words in a file it has a def for from the oxford_dict.txt file.
# usage ./get_defs <filename>
# while IFS='' read -r line || [[ -n "$line" ]]; do
# while IFS='' read  line || [[ -n "$line" ]]; do
#     cat /media/donagh/3520-FD13/1donaghs-stuff/Dictionaries/Oxford_English_Dictionary/oxford_dict.txt | grep ^$line
# done < "$1"
# # 
# 
