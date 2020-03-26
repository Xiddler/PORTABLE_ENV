#!/bin/bash

folder="/home/donagh/sd64/1donaghs-stuff/personal/journal/2020/$1"

cd $folder

sum=0

for afile in $(ls); do
    a=$(wc -w $afile)
    # echo $a # 145 04-03.md
    b=$(echo $a | cut -d' ' -f1) # 140
    sum=$(( $sum + $b ))
done

# printf $sum
echo "Total words for month = " $sum 

