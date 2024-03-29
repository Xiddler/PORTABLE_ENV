# What does xargs do exactly?
# Answer: runs a given command on each line of input from a piped command 

# find all file name ending with .pdf and remove them
find -name *.pdf | xargs rm -rf

# if file name contains spaces you should use this instead 

    find -name *.pdf | xargs -I{} rm -rf '{}'

# xargs -I{}: on each line in the input, run the given command and replace {} with the contents of the line

# using grep - find all files that contain a line ending in sh to a maxdepth of 2
find -maxdepth 2 -name "*.*" -type f | xargs -I{} grep 'sh$' '{}'

# Will show every .pdf like:
#	&toto.pdf=
#	&titi.pdf=
# -n1 => One file by one file. ( -n2 => 2 files by 2 files )

    find -name *.pdf | xargs -I{} -n1 echo '&{}='

# If find returns no result, do not run rm
# This option is a GNU extension.
find -name "*.pdf" | xargs --no-run-if-empty rm

# open a book from the results of my booksearch command using okular
❯ echo $(booksearch interface) | xargs okular # it works!!

# display the line count in all the files in $HOME (2022-11-08)  
❯ lf | awk '{ print $NF }' | xargs wc -l
grep: warning: stray \ before -
   13 helix1.txt
   69 mdvile2.html
   66 mdvile.html
   35 p_vile.html
   23 p_vile.txt
   30 space_BU.txt
   76 space.txt
   12 testament.md
   56 vile.html
   36 vile.md
   23 vile.txt
   14 wants.txt
  453 total
(Note: lf is an alias for list (only) files )

# Easily handling arguments with whitespace 

  find . -type f -print | xargs wc -l

vs.

  find . -type f -print0 | xargs -0 wc -l

> If you have filenames with whitespace, the first will skip a bunch of files, the second won't.

# bottles on the wall

->% seq 10 -1 0 | xargs printf '%s bottles of beer on the wall…\n'

