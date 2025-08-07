# FRONTMATTER
Opened
Filepath 

# exec in chained commands — often used with `find` 
# =============================================================================================================
# intro
bash commands which do similar things: xargs; -exec; parallel; 



    find . -exec cmd {} +
    find . -print0 | xargs -0 cmd

Both are meant to be reliable ways to run a command on the files found by find.

# ; and + 

Using ; (semicolon) or + (plus sign) is mandatory in order to terminate the shell commands invoked by -exec/execdir.

The difference between ; (semicolon) or + (plus sign) is how the arguments are passed into find's -exec/-execdir parameter. For example:

using ; will execute multiple commands (separately for each argument),

Example:

    $ find /etc/rc* -exec echo Arg: {} ';'
    Arg: /etc/rc.common
    Arg: /etc/rc.common~previous
    Arg: /etc/rc.local
    Arg: /etc/rc.netboot

        All following arguments to find are taken to be arguments to the command.

        The string {} is replaced by the current file name being processed.

using + will execute the least possible commands (as the arguments are combined together). It's very similar to how xargs command works, so it will use as many arguments per command as possible to avoid exceeding the maximum limit of arguments per line.

    Example:

    $ find /etc/rc* -exec echo Arg: {} '+'
    Arg: /etc/rc.common /etc/rc.common~previous /etc/rc.local /etc/rc.netboot


# see also

~/.cheat/exec.md (this file)
~/.cheat/parallel.md
~/.cheat/xargs.md 


# usage

two uses of -exec:

    with \; the {} will be replaced by a single item found
    with + the {} will be replaced by many items (as many as the commandline can hold).

## -exec command ;
       Execute command; true if 0 status is returned.
        All  following arguments  to  find  are  taken  to be arguments to the command until an argument consisting of ';' is encountered.  The string '{}'  is  replaced  by  the  current  file name being processed everywhere it occurs in the arguments to the command, not  just in  arguments  where  it is alone, as in some versions of find.  Both of these constructions might need to be  escaped  (with  a '\')  or  quoted  to  protect them from expansion by the shell.  See the EXAMPLES section for examples of the use of  the  -exec option.   The  specified  command  is run once for each matched file.  The command  is  executed  in  the  starting  directory.  There  are unavoidable security problems surrounding use of the -exec action; you should use the -execdir option instead.


## -exec command {} +
       This variant of the -exec action runs the specified command  on the  selected files, but the command line is built by appending each selected file name at the end; the total number of invoca‐ tions  of  the  command  will  be  much less than the number of matched files.  The command line is built in much the same  way that xargs builds its command lines.  Only one instance of '{}' is allowed within the command.  The command is executed in  the starting directory.

# examples / tips

    find . -type f -iname "*.cr2" | cp destination_directory

doesn't copy the files found, as cp doesn't read from standard input. 
You would have to use:

    find . -type f -iname "*.cr2" | xargs cp -t destination_directory

or to handle the paths with spaces:

    find . -type f -iname "*.cr2" -print0 | xargs -0 cp -t destination_directory

With about the same efficiency you could do:

    find . -type f -iname "*.cr2" -exec cp -t destination_directory {} +

the {} has to be at the end, before the + 

All of the above do not build the hierarchy under the target directory for that and out of long habit even if the source directory is flat, 
use cpio instead:

    find . -type f -iname "*.cr2" -print0 | cpio -pdmv0 destination_directory

which nicely lists what it is doing along the way.





# =============================================================================================================
# FOOTNOTES

