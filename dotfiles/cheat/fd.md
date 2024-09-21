# fd utility

modern replacement for find but not as fully featured

# find filenames containing the pattern 'org'

 fd --regex -i 'org'

# go only 1 level deep

->%  fd  -d 1 <searchpattern>

# combine files into a single file

silly example: to combine all .py files into combined.py:

->%  fd -e py -X cat > combined.py
