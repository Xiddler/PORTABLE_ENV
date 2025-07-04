# generic awk usage

->% awk /pattern/ {procedure} file

# sum integers from a file or stdin, one integer per line:

->%  printf '1\n2\n3\n' | awk '{ sum += $1} END {print sum}'

# wants.txt with two columns and items use _ to separate the words 

->%  awk -F" " '{ sum += $2 } END { print sum }'


# using specific character as separator to sum integers from a file or stdin

->%  printf '1:2:3' | awk -F ":" '{print $1+$2+$3}'

# print a multiplication table

    seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'
 
 
# Specify output separator character
printf '1 2 3' | awk 'BEGIN {OFS=":"}; {print $1,$2,$3}'

# A selection of Built in Variables
NR  :: No of lines Read to this point 
NF  :: No. of Fields ie columns
FS  :: Field Separator  :: Default = " "
FNR :: Field Number Record
OFS :: Output Field Separator :: Default = " " 
RS  :: Input Record Separator :: Default = " " 
ORS :: Output Record Separator :: Default = "\n"
FILENAME    :: Current Filename

# A selection of Built in String Operators

sub
gsub
length  :: gives the length of each line (includes <spaces> )
split
match

# Sample one-liner to extract balance from a csv file

->%  awk -F"," '/11-20/ { e=$6 } /11-11/ { l=$6 } END { print "You have spent " l-e } ' accounts.csv

# Column subtraction

->%  cat file | awk -F '\t' 'BEGIN {SUM=0} {SUM+=$3-$2} END{print SUM}'

# find multiple regex patterns in a file

->%  awk '/rat/ || /fox/' animals.txt
rat
fox

# sort file according to length of line - awk, perl, python

->%   awk ' { print length, $0 }' <filename>  | sort -n


example
->% cd  ~/REPOS/WORDS/

in awk

    awk ' { print length, $0 }' synonyms_amateur.txt  | sort -n

in perl

    cat synonyms_amateur.txt | perl -e 'print sort { length($a) <=> length($b) } <>'

in python 

    cat synonyms_amateur.txt | python -c 'import sys; sys.stdout.writelines(sorted(sys.stdin.readlines(), key=len))'



# Get element from row

1. The Data - eg list the latest files in the folder using my alias `lt`
ON Toshiba — donagh@donagh-satellitep50c 

❯ cd  ~/samba/anonymous_shared_directory/MY_ZIM/Zipped_MY_ZIM_date 
❯ lt
total 673532
-rw-r--r-- 1 donagh donagh       704 Jan 12 10:02 top8.txt
-rwxrwxr-- 1 donagh donagh 138237006 Jan 11 18:48 MY_ZIM_2024-01-11.zip

❯ --> <❯> 10095, Hex 276f, Octal 23557


2. Extract the filename at the end using awk
  lt | awk 'FNR==3 { print  $9 }' | sed 's/MY_ZIM_//g' | sed 's/[\.]zip//g'
_output_
2024-01-11

# Print decimal places

## celc.txt

❯ head -n17 celc.txt
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17

## awk CLI 

->% awk '{ printf "%d %0.1f %0.1f %0.1f \n", $1, 2*$1+30, 1.8*$1+32, $1*2-$1*2*0.1+32}' celc.txt 

## printout

C F*    F    F†
1 32.0 33.8 33.8
2 34.0 35.6 35.6
3 36.0 37.4 37.4
4 38.0 39.2 39.2
5 40.0 41.0 41.0
6 42.0 42.8 42.8
7 44.0 44.6 44.6
8 46.0 46.4 46.4
9 48.0 48.2 48.2
10 50.0 50.0 50.0
11 52.0 51.8 51.8
12 54.0 53.6 53.6
13 56.0 55.4 55.4
14 58.0 57.2 57.2
15 60.0 59.0 59.0
16 62.0 60.8 60.8
17 64.0 62.6 62.6

F* is "double C and add 30" quick and dirty
F† is "double C, subtract 10% and add 32"
