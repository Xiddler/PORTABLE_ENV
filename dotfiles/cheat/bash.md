# Webrefs

https://github.com/jlevy/the-art-of-command-line    《good for a freshen up  
https://wiki.bash-hackers.org/
https://mywiki.wooledge.org/BashFAQ  AND  https://mywiki.wooledge.org/BashGuide

# bash resources

https://github.com/onceupon/Bash-Oneliner # one-liners 

# Bash reference manual 

sudo pamac install  bash-docs --> /usr/share/docs/bash/*.html 

# To implement a for loop:

    for file in *;
    do 
        echo $file found;
    done

    for i in $(seq 1 10);
    do
        echo $i
    done

    for i in {20..30} ; do
        echo $i;
    done

# To implement a case command:

case "$1"
in
    0) echo "zero found";;
    1) echo "one found";;
    2) echo "two found";;
    3*) echo "something beginning with 3 found";;
esac

# Turn on debugging:

set -x

# Turn off debugging:

set +x

# Retrieve N-th piped command exit status

printf 'foo' | fgrep 'foo' | sed 's/foo/bar/'
echo ${PIPESTATUS[0]}  # replace 0 with N

# Lock file:

( set -o noclobber; echo > my.lock ) || echo 'Failed to create lock file'
  
# DONAGHS
# to filter the output of ls to include the files containing <pattern>

    stat --printf '%y\t%n\n' -- *<pattern>*


# Regex

pat='[^0-9]+([0-9]+)'
s='I am a string with some digits 1024'
[[ $s =~ $pat ]] # $pat must be unquoted
echo "${BASH_REMATCH[0]}"
echo "${BASH_REMATCH[1]}"

# Start bash scripts with the following:

    #!/usr/sbin/env bash

    set -euo pipefail
    trap "echo 'error: Script failed: see failed command above'" ERR


Note

    #!/usr/bin/env bash is more portable than #!/bin/bash

# Arrays

myIndexedArray=(one two three)      Note: spaces between items & parentheses

$ echo ${myIndexedArray[*]}

# using for loops and an array of filepaths
 Template: "${arrayName[@]}"

directories=( $porte $org $pers $comp $all_org )
for mydir in "${directories[@]}"; 
    do 
        # echo -e "$mydir";      # same as following
        printf '%s\n ' "$mydir"
done

# Arithmetic 
$((   )) # correct syntax 

# if statement
echo -n "Enter Number: "
read x

# if else statement

eg  check if number is even

if [ $((x%2)) == 0 ]; then
  echo "Number is Even"
else
  echo "Number is Odd"
fi

# Here doc 

    A "here document" allows redirection of multiple lines of input as if from a file:
        Example:
    cat <<EOF
    input
    on multiple lines
    EOF

# octal permissions of a file
$ stat -c '%A %a %n' pgn_2.txt | cut -d' ' -f2     
$ 644
# list all files with permission 755 in current folder

stat -c '%A %a %n' *.sh | grep 755
 alternatively 
find "$filename" -prune -printf '%m\n'


# date - see -> % cheat date 
 print yesterday's date (for my jounal)
date  --date="yesterday" +"%Y-%m-%d"
