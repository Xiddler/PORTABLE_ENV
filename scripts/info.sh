#!/bin/bash

echo "Memory usage is :" && df -h | grep aufs | awk '{print $5}'
echo "CPU is currently used by :" && ps aux | awk '$3+$4> 5' | awk '{print $11 "  " $3+$4}'
echo "Try 1 or 2 "

read repo_author

read repo



cd $HOME/.vim/

mkdir -p $repo_author


repo="https://github.com/Xiddler/PORTABLE_ENV.git"

if [[ $repo =~  "Xiddler" ]];
if [[ $digit =~ [-9] ]]; then 
    echo "$digit is a digit" 
else 
    echo "oops" 
fi
