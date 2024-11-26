#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# Purpose
# I want to avoid having to type ->% dict when looking up a word
# and since I have a dedicated terminal for dict I thought I 
# might be able to conjure up a script to do this. This is my attempt. 
# date 2024-11-22 
# author Donagh McCarthy 

while true; do
echo "Enter word to look up: ";
read n;
definition=$(dict  $n):
# if $("$n='clear'"); then
if [ $n == "clear" ]; then
    clear
    # printf "\033c";
    # echo "$n was entered"
else
    echo $definition;
    # echo "works!";
fi

# if loop for incorrect spelling -- can't get it to work
# if [ 'echo "$definition";' = true ]; then 
#     echo $definition
# else
#     echo "Enter correct spelling"
# fi

done;

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.
#
# if command ; then
    # echo "Command succeeded"
# else
    # echo "Command failed"
# fi


