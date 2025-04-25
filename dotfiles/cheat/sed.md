# SED

## Replace all occurrences of "day" with "night" and write to stdout.  NO CHANGES MADE.

No changes are made to the file - it's a trial.

sed 's/day/night/g' file.txt

## Replace all occurrences of "day" with "night" within file.txt. CHANGES MADE.

Changes are made to the file. 

sed -i 's/day/night/g' file.txt

## Replace all occurrences of "day" with "night" on stdin:
echo 'It is daytime' | sed 's/day/night/g'

## Remove leading spaces
sed -i -r 's/^\s+//g' file.txt

## Remove empty lines and print results to stdout:
sed '/^$/d' file.txt

## Replace newlines in multiple lines
sed ':a;N;$!ba;s/\n//g'  file.txt

## Insert a line before a matching pattern:
sed '/Once upon a time/i\Chapter 1'

## Add a line after a matching pattern:
sed '/happily ever after/a\The end.'

## Get a numbered line from a file - the following command will display the 122nd line
sed -n '122{p;q}'  f4_lichess_I_Wobble.txt
 Explanations: the p is print that line. the q means quit and sed does no more processing
 This will display the 3rd line
sed -n 3p 0text.md
 -n, --quiet, --silent suppress automatic printing of pattern space.  With the "p" flag will cause the modified line to be printed.

 substitution with captures
echo "123 abc" | sed 's/[0-9][0-9]*/& &/'             ->> 123 123 abc  
echo "123 abc" | sed 's/\([a-z]*\) \([0-9]*\)/\2 \1/' ->> abc 123


 If I don't want ANSI codes in the output, then I can just pipe it through 
sed 's/\x1b\[[;[:digit:]]*m//g'

 every fifth line 
sed -n '0~5p' numbers.txt
 where numbers, for example, has the number 1 to 27 on a separate line


5
10
15
20
25


## Print lines from another file into this buffer

->%  sed -n 1,2P stylua.toml
_output_
indent_type = "Spaces"
indent_width = 2

NOTE: in vim you can do this:
:r! sed -n 3,55p somefile.txt
to copy lines 3-55 from somefile.txt into the current buffer



