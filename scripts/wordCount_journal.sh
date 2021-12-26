#!/bin/bash

# this script returns the total words typed for a specified month. The files are located in the folder on the next line.
# the command alias that calls this script is wcmj- then append the number of the month e.g. 03 for march. 
# The full command is thus
# ->% wcmj 03

# folder="/home/donagh/sd64/1donaghs-stuff/personal/journal/2020/$1"
# folder="/home/donagh/sd64/1donaghs-stuff/personal/journal/2021/$1"
folder="/home/donagh/DONAGHS/personal/journal/2021/$1"

cd $folder
echo "now in $folder"

sum=0

for afile in $(ls); do
    a=$(wc -w $afile)
    # echo $a # 145 04-03.md
    b=$(echo $a | cut -d' ' -f1) # 140
    sum=$(( $sum + $b ))
done

# Converts <mmm> out put to a two-digit number  
case "`date | awk '{print $3 }'`" in

        Jan) MON=01 ;;
        Feb) MON=02 ;;
        Mar) MON=03 ;;
        Apr) MON=04 ;;
        May) MON=05 ;;
        Jun) MON=06 ;;
        Jul) MON=07 ;;
        Aug) MON=08 ;;
        Sep) MON=09 ;;
        Oct) MON=10 ;;
        Nov) MON=11 ;;
        Dec) MON=12 ;;
esac

# echo $MON


# Converts the selected (at call time)  month's two digit number to a string
case "$1" in

        01) DAT='Jan' ;;
        02) DAT='Feb' ;;
        03) DAT='Mar' ;;
        04) DAT='Apr' ;;
        05) DAT='May' ;;
        06) DAT='Jun' ;;
        07) DAT='Jul' ;;
        08) DAT='Aug' ;;
        09) DAT='Sep' ;;
        10) DAT='Oct' ;;
        11) DAT='Nov' ;;
        12) DAT='Dec' ;;
esac

# echo $DAT

echo -n "Total words for $DAT = " $sum 

