
# Displays everything in the target directory
ls path/to/the/target/directory

# Displays everything including hidden files
ls -a

# Displays all files, along with the size (with unit suffixes) and timestamp
ls -lh 

# Display files, sorted by size
ls -S

# Display directories only

    ls -d */

# Display directories only, include hidden
    
    ls -d .*/ */

# List by date and reverse
ls -t
ls -tr

# List links
ls -al | awk '/^l/ { print $0 }'

# List directories / files (from ~/.zsh_aliases)
alias l.='ls -d .* --color=auto' # Show hidden files and directories
alias lh="ls -lad --color=auto *(D.)" # Show hidden files only ##
alias lr="ls -la | grep '\-'"  # Show only regular files (Donaghs!)
 alias lr='find . -maxdepth 1 -type f -ls' # Show only regular files
 alias lr='find . ! -name . -prune -type f -exec ls -ldi {} +' # Show only regular files (POSIXY)

     alias lr='ls -l -- *(D.)' # Show only regular files (zsh only)



 ~/DONAGHS/personal  main +22 !1 ?2                                                                                   donagh@donagh-satellitep50c
    
    alias ld='ls -la -d */' # show directories
 alias -g lh='ls | head'
alias lk='ls -1v'
alias ll='ls -la'
alias llk="ll | grep '^l.*'"
alias lls='ls | xargs -n1' # show ls in a single column
alias ls='ls --color=auto'
alias hp='ls --hide=*.py'
alias -g lf="ls | tr ' ' '\n'"

    alias -g latest='ls -lt  **/*(.om[1,20])' # list latest 20 files edited

 columns in output of -> % ls -la
-rwxrw-r--    1    root   root 2048    Jan 13 07:11 afile.exe
    filetype (-)        [ - means a regular file; d means directory; l means symbolic link ]
    file permissions (rwxrw-r--),
    number of (hard) links (1),
    owner name (root),
    owner group (root),
    file size in bytes (2048),
    time of last modification (Jan 13 07:11), and
    file/directory name (afile.exe)


    –:  A regular file.
    b: A block special file.
    c: A character special file.
    d: A directory.
    l: A symbolic link.
    n: A network file.
    p: A named pipe.
    s: A socket.

# ls with selected flags/options

ls -m 	Lists directory contents separated by a comma.
ls -Q 	Displays directory contents enclosed by quotation marks.
ls -l 	Displays files in a long-list format.
ls -lh 	Display file size in a human-readable format.
ls -g 	Omits group ownership column.
ls -F 	Adds a forward slash to directories.
ls -i 	Display inode number of files and directories.
ls -a 	Display all files including hidden files.

    ls *. 	Filters files according to the file extension.
ls -la 	Displays all files and directories in long list format.
ls -R 	Display files and directories recursively.
ls -r 	Sort Files in reverse.
ls -X 	Sort files alphabetically by file extension.
ls -tl 	Display files according to file creation date and time.
ls -n 	List UIDs and GIDs.



# Get list of files with latest edited date and  time

## Method 1 - using zsh ls

See ->% che zsh_ls 

Get list of latest 20 files

    ->% ls -lt  **/*(.om[1,20])

(In man zshexpn --> glob qualifiers, it is explained that `o` stands for sort order, up and `m` stands for last modification time.)

Aliased to `newest` and to `latest` in .zsh_aliases.

## Method 2 - using GNU find

See https://stackoverflow.com/questions/1404938/list-files-by-last-edited-date

COMMAND
->% find . -not -path "./.git*" -type f  -printf "%-.22T+ %M %n %-8u %-8g %8s %Tx %.8TX %p\n" | sort | cut -f 2- -d ' '

_output ( ignoring all .git/ and showing latest at the bottom)_
-rw-r--r-- 1 donagh   donagh       1980 06/05/24 18:28:06 ./journal/2024/05/05-05.md
-rw-r--r-- 1 donagh   donagh        682 07/05/24 11:45:02 ./assets.org
-rw-r--r-- 1 donagh   donagh       5365 08/05/24 08:53:47 ./journal/2024/05/07-05.md
-rw-r--r-- 1 donagh   donagh       2220 08/05/24 16:12:46 ./journal/2024/05/08-05.md
-rw-r--r-- 1 donagh   donagh     382871 09/05/24 13:26:44 ./bu_me.org
-rw-r--r-- 1 donagh   donagh     382871 09/05/24 13:27:09 ./me.org

# DONAGHS
 About grepping the output of ls
 see https://mywiki.wooledge.org/ParsingLs
