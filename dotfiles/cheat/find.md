Opened 2024-10-09


See man find

# To find files by case-insensitive extension (ex: .jpg, .JPG, .jpG):
find . -iname "*.jpg"

# To find directories:
find . -type d

# To find files

find . -type f

# To find files by octal permission:
find . -type f -perm 777

# To find files with setuid bit set:
find . -xdev \( -perm -4000 \) -type f -print0 | xargs -0 ls -l

# To find files with extension '.txt' and remove them:
find ./path/ -name '*.txt' -exec rm '{}' \;

# To find files with extension '.txt' and look for a string inside them:
find ./path/ -name '*.txt' | xargs grep 'mystring'

# To find files with size bigger than 5 Mebibyte and sort them by size:
find . -size +5M -type f -print0 | xargs -0 ls -Ssh | sort -z

# To find files bigger than 2 Megabyte and list them:
find . -type f -size +200000000c -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'


# To find symlinks owned by a user and list file information
find . -type l --user=username -ls

# To search for and delete empty directories
find . -type d -empty -exec rmdir {} \;

# To search for directories named build at a max depth of 2 directories
find . -maxdepth 2 -name build -type d

# To search all files who are not in .git directory
find . ! -iwholename '*.git*' -type f

# To find all files that have the same node (hard link) as MY_FILE_HERE
find . -type f -samefile MY_FILE_HERE 2>/dev/null

# To find all files in the current directory and modify their permissions
find . -type f -exec chmod 644 {} \;

# Use find command to copy all files but excluding  directories .dir1/ and .dir4/ from its search.
find . -type f -not -path "./dir1/*" -not -path "./dir4/*" -exec cp '{}' /tmp \;

#DONAGHS - the cheat -e version
# To find files beginning with i in the current folder
 find . -maxdepth 1 -type f -name 'i*'

# list .txt files in directory with no prefix
find . -name \*.txt -type f -print | sed 's/\.\///g'

# using find instead of rg - why would you?
find . -name "*.txt" | xargs grep ping-pong

# find org file Modified in the last 10 minutes (mtime, atime, ctime)
find . -name \*.org -mtime -10

# find file modified (m) or changed (c) or accessed (a) in the last 10 minutes in the current directory
find . -maxdepth 1 -cmin -10

# find a book in books/ downloaded and saved in the last day
find ~/REPOS/books/ -maxdepth 4 -ctime -1 

# find .git repositories in the current directory
find . -type d -name '.git'  

# TIME 
# modified, changed, accessed 
# mtime     modified n*24 days so -mtime -3 is less than 3 days ago 
# mmin      modiivied n minutes ago so -mmin -3 is less than 3 minutes ago 
#
# To find files modified more than 7 days ago and list file information
find . -type f -mtime +7 -ls

# Find files modified less than 3 days ago and list them 
find . -type f -mtime -3 -ls # tested and this works, no 'd' after the -3 

# Find files modified less than 10 _minutes_ ago. Note -mmin not -mtime.
find . -type f -mmin -10 -ls

# Find files accessed less than 5 days ago
find . -type f -atime -5

# Find files changed less than 5 days ago
find . -type f -ctime -5

# Find files newer than 3 days old
find . -newermt $(date +%Y-%m-%d -d '3 day ago') -type f -print

# IGNORE DIRECTORY 
# SEE ~/files/sandbox_directory for tree and README.md
#
 ~/files/sandbox_directory 
tree
.
├── dir1
│   ├── dir2
│   │   └── dir3
│   │       └── file2
│   └── file1
├── dir4
│   └── file3
├── dir5
│   └── dir6
│       ├── dir4
│       │   └── file4
│       └── file4
└── README.md

# note -o is logial operator OR (in the next example you either prune or print to the STDOUT ...erm..?) 
# find all files except in dir4 
find . -path ./dir4 -prune -o -print


# For example, to skip the directory src/emacs and all files and directories under it, 
# and print the names of the other files found, do something like this:
find . -path ./src/emacs -prune -o -print


# in  /home/donagh/BACKUPS/SD64_BU/DONAGHS
# Find directories in the above directory modified in the last 7 days but ignore(prune) those inside the \(.. \) and list theem
find .  \( -name MY_ZIM -o -name zArchive -o -name all_org -o -name personal -o -name BACKUPS \) -prune -mtime -7 -o -ls

# find all files except those listed inside the \(...\) 
find .  \( -name MY_ZIM -o -name zArchive -o -name BACKUPS  -o -path ./personal/TestVault -o -path ./personal/self -o -path ./personal/.git \) -prune  -o -ls

# Some examples

Find config files that were modified in the last 10 minutes:
find /etc -type f -name "*.conf" -mmin -10 -printf "%t\t%p\n"

Change all files with 777 permissions to 644:
find . -type f -perm 0777 -print -exec chmod 644 {} \;

Remove empty directories:
find . -type d -empty -print -delete

Find duplicates of source_file.txt:
find . -samefile source_file.txt

Delete temporary files older than a day:
find /tmp -type f -mmin +24 -print -delete

Use -exec with find
find ~ -maxdepth 1 -name "*.txt" -print -exec ls -l {} \;
OUTPUT
/home/donagh/dropbox.txt
-rw------- 1 donagh donagh 120 Sep 13 22:29 /home/donagh/dropbox.txt
/home/donagh/util.txt
-rw-r--r-- 1 donagh donagh 801 Nov  1 18:21 /home/donagh/util.txt




# REM use fd - a modern alternative with regex!



