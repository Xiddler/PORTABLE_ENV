#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.


#echo "Enter source directory : "
# i="/home/donagh/samba/anonymous_shared_directory/11SignUps"
# echo $i
# echo ' '

# a="aardvark"
# b="beaver"
# c=$a/$b
# echo $c



read -ep "Enter /path/to/src/dir/  > "  src_dir
read -ep "Enter filename  > " fname

read -ep "Enter /path/to/dest/dir/ > "  dest_dir

## echo "$d/$f.age"
DESTFILE="$dest_dir/$fname.age"
echo $DESTFILE

echo " "

recipient="/home/donagh/REPOS/encryption/recipient.txt"

# age -o "$F" -R $recipient "$I"



# read -ep "Enter input file name > "  input

# if [ -f $fname ] ; then
# if [ -f $F ] ; then
#     echo "meowww"
    # output="$dest_dir/$fname.age"
    # output="$dest_dir/$fname.age"
    # # case $fname in
    #     *.age)  echo "'$fname' is not a valid file — haha" ;;
    #     # *)  read -ep "Enter output file name with .age extension > " output  ;;
    #     *)  output="$dest_dir/$fname.age"
    # echo $output

    # esac

# else
        # echo "'$fname' is not a valid file — dummy"
        # echo "'$F' is not a valid file — dummy"
        # exit
# fi

SRCFILE="$src_dir$fname"
echo $SRCFILE
echo " "

age -o $DESTFILE -R $recipient $SRCFILE

