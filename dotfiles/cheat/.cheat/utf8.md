# sample text file
Create a file sample.txt with multiple lines and non-ASCII characters in some lines:

$ cat sample_utf8_and_non.txt
Output

This is an article on finding non-ASCII characters on Baeldung
日本人 中國的 ~=[]()%+{}@;’#!$_&-  éè  ;∞¥₤€
We hopè you find it inform@tiv€
Thank You!

# find all non-utf8 characters in file:

## rg
->%  rg --color='auto' -n "[^[:ascii:]]" sample_utf8_and_non.txt

Output (in the terminal, all the non-ascii characters are shown in red)
3:日本人 中國的 ~=[]()%+{}@;’#!$_&-  éè  ;∞¥₤€
4:We hopè you find it inform@tiv€


## grep
->% grep --color='auto' -P -n "[\x80-\xFF]" sample_utf8_and_non.txt
Output
日本人 中國的 ~=[]()%+{}@;’#!$_&-  éè  ;∞¥₤€
We hopè you find it inform@tiv€


### also maybe...?

-> % grep -axv '.*' <filename>

where:
    -a, –text: Treats our FILE as text, hence preventing grep from aborting once it finds an invalid character.
    -x ‘.*’ (–line regexp): Matches a complete line containing any UTF-8 character.
    -v, –invert match: Inverts our output displaying lines not matched.
    <filename>: Represents the file we want to check for invalid characters.

## perl
->% perl -ne 'print if /[^[:ascii:]]/' sample_utf8_and_non.txt
日本人 中國的 ~=[]()%+{}@;’#!$_&-  éè  ;∞¥₤€
We hopè you find it inform@tiv

## iconv 

Automatically find and delete non-UTF-8 characters, use the iconv linux command. 

-> % iconv -f utf-8 -t utf-8 -c <filename> -o NEW_FILE

where:
    -f: Represents the original file format. We’ve defined it as utf-8 in our example above
    -t: Represents the target file format that we want to convert to.
    -c: Skips any invalid sequences
    -o: output to newly created new file (else output is written to stdin)
    <filename>: Represents the file we want to remove invalid characters from.

## sed
Replace all non-ASCII with a capital X

->% LC_ALL=C sed 's/[^\x0-\xB1]/X/g' sample_utf8_and_non.txt

[Note: LC_ALL=C: environment variable that overrides all other localization settings. Here, we’ve set it to the simplest C setting.]

Output
This is an article on finding non-ASCII characters on Baeldung
XXXXX XXXX ~=[]()%+{}@;X#!$_&-  XX  ;XXXX
We hopX you find it inform@tivX
Thank You

ALSO, using _decimal_ instead of hex for the character class, remove all non_ASCII characters from a file.

->% LC_ALL=C sed 's/[^\d0-\d127]//g' sample_utf8_and_non_DELETE.txt

This is an article on finding non-ASCII characters on Baeldung
  ~=[]()%+{}@;#!$_&-    ;
We hop you find it inform@tiv
Thank You

# insert a utf8 character in vim
e.g. ⁊ is U204A <-- the amperagus (as in P⁊T)



### EXAMPLE

Insert non-ascii character
eg an M dash —
Insert mode then Ctrl-V u 2014
⁊
The output of ga on that M dash is:

    —> 8212  Hex 2014 Oct 20024 Digr -M

    Search for Mdash
    Mdash —  \%u2014 to replace with [spc]-[spc] do
    :%s/\%u2014/ - /g


# Rifle

 ︻┳═一
