## System

uname           Displays Linux system information
uname -r        Displays kernel release information
uptime          Displays how long the system has been running including
                load average
hostname        Shows the system hostname
hostname -i     Displays the IP address of the system
last reboot     Shows system reboot history
date            Displays current system date and time
timedatectl     Query and change the System clock
cal             Displays the current calendar month and day
w               Displays currently logged in users in the system
whoami          Displays who you are logged in as
finger username Displays information about the user



## General

su              Switches user.
                - <user> Switches to user.
                - Switches to root.
man             Help on commands.
                <s ection>       Section numbers: 1. Programs, 2.
                                 System calls, 3. Library calls, 4. Special
                                 files, 5. File formats, 7. Miscellaneous, 8.
                                 System administration commands
echo            Prints passed text.
                -n                 Does not add newline at the end.
                -e                 Enables interpretation of backslashed
                                   letters.
xargs <cmd> Passes output from one command to arguments of
            another:
            'echo -a | xargs ls`'
            -t          Echoes the command before executing it.
            -p          Echoes command and asks for confirmation
                        before execution.
            -0          Input items are separated by null character
                        instead of space.
tee <file>  Sends output of a program to specified file and to
            standard output:
            '`<cmd_1> | tee out_1.txt | <cmd_2>`'
            /dev/tty     Sends output to terminal and to standard
                         output
expr        Evaluates passed expression.
            1 + 1      Prints '`2`'.
bc          Evaluates input. It's basically a calculator, but also
            provides some control commands.
            echo 1 + 1 | bc                 Prints '`2`'.
            echo "scale=5;3/4" | bc         Prints '`.75000`'.
sh          Runs command interpreter (shell). Can run a script even if
            not executable.
            -c '<commands>'             Starts new
                                        non-interactive shell and
                                        reads commands from
                                        arguments instead of
                                        '`stdin`'.
                                        To append lines to
                                        system configuration file
                                        run:
                                                  '`sudo sh -c 'echo
                                                  "<text>" >> <file>'`'
bash            Runs bash command interpreter (shell).
                -c                    Reads commands from
                                      arguments instead of '`stdin`'.
                -n <script>           Checks script for errors.
                -x                    Prints commands before
                                      execution. Useful for debugging.
gcc             Gnu C compiler. Run '`g++`' for C++ code.
                -w                 Supresses warnings (Only prints
                                   errors).
                -Wall              All warnings.
                -g                 Compile for debugging.
                -std=<std>         Sets the standard. Suported
                                   standards for C are:
                                   '`c90`', '`gnu90`', '`c99`', '`gnu99`', '`c11`'
                                   and '`gnu11`'.
                                   Suported standarts for C++ are:
                                   '`c++98`', '`gnu++98`', '`c++11`' and
                                   '`gnu++11`'.
                                   '`gnu90`' and '`gnu++98`' are the
                                   default options.
                -O<level>          Optimization level. '`0`': Reduce
                                   compilation time (default), '`1-3`': -
                                   Level of optimization, '`s`' -
                                   Optimize for size, '`g`' - Optimize
                                   debugging experience.
run-parts <dir> Runs all scripts or programs in a directory.
date            Tells and sets date and time.
                -s <string>                    Sets date.
                +%T -s "10:13:13"              Sets time.
timedatectl     Controls the system time and date.
                set-timezone CET         Sets timezone.
cal             Calendar
xclip           Copies to clipboard.
mkfifo <pipe>   Creates named pipe during that shell session.
mkisofs         Creates a DVD/CD image.
genisoimage     Creates a DVD/CD image (Debian).
cdrecord        Writes to a CD/DVD.
acpi            Checks battery.
fdisk -l (sudo) Shows partitions.
shutdown        Closes down the system at a given time.
                now                Takes you to the single user
                                   mode.
                -h now             Begins the shutdown procedure,
                                   same as '`halt`' and '`poweroff`'.
                -h 11:50           At 11:50.
                -r now             Same as '`reboot`'.
make            Utility that maintains groups of programs.
                -q               Doesn't run any commands, just returns '`0`'
                                 exit code if everything is up to date or
                                 non-zero otherwise.
                -B               Unconditionally makes all targets.
## Files

ls
      -d               List directory names instead of contents
      -S               Sort by size
      -t               Sort by time
      -1               One file per line
      ./*              Ls one level deep
      -i               Get inode number of file (file id). Use
                       '`sudo find / -inum <number>`' to find
                       all links that point to same file.
cp
      -i                   Interactive (Prompts before
                           overwrite)
      -v                   Verbose (Explains what is being
                           done)
      -R                   Copy directories recursively
      -p                   Preserve mode, ownership and
                           timestamps
      --preserve=all Also preserves context, links and
                           xattr
rm
      -i                    Interactive (Prompts before every
                            removal)
      -v                    Verbose (Explains what is being
                            done)
      -f                    Force remove (Does not prompt,
                            useful if '`rm`' is aliased with '`-i`')
      -R                    Removes directories and their
                            content recursively
mkdir
      -p                  Make parents if needed
ln    Makes links to the files
   -s <file> <link>     Makes symbolic link. If you want
                        to use relative paths you must be
                        in links directory
df
   -h                 Displays humanly readable free
                      disk space
du
   -s <dir>           Directory size
mc Midnight commander
   Alt o            Open parent dir in another panel
   Ctrl o           Switch to bash
find <dir>
                -name <file>            Search by name
                -regex <regex>          Use regex for name search
                -not                    Insert before other options to
                                        negate
                -maxdepth               Descend only to levels deep
                <levels>
                -samefile <file> Find all hard links of a file
                -xdev                   Don't descend directories on other
                                        filesystems
                -inum <inum>            Find files with the inode number
                -type                   Find files of type
                <f|d|b|...>
                -delete                 Delete found files
                -exec <cmd> {} Find files and execute command
                \;                      for every found file. '`{}`' is replaced
                                        with filename
                -exec <cmd> {} + Find files and execute command
                                        with all filenames in place of '`{}`'
                -atime +/-n             Find files that were last accessed
                                        less or more than n days.
                -print0 | xargs Sends found files to a command
                -0 <cmd>                as parameters. Uses '`NUL`'
                                        character as separator, necessary
                                        for filenames with spaces
locate <regex>  Similar as '`find`' but using index
                -i                    Ignore case
                --regex               Interprets all patterns as extended
                                      regex
                -0 | xargs -0         Sends found files to a command as
                <cmd>                 parameters.
updatedb (sudo) Update locate index
md5sum          Prints md5 sum hash of a file
read            Read single line from standard input
        -n 1                   Print after reading one character
        -s                     Do not echo input coming from
                               terminal
shred   Securely remove files
file    Determine file's type
tree    Ls in a tree-like (hierarchical) format
install Copy files and set attributes
gpg     Decrypt file with password
        -c                  Encrypt
mktemp  Create a temporary file or directory in '`/tmp`' and returns
        it's name.
rename
        s/<from>/<to>            Renames multiple files using '`sed`'
        <files>                  syntax
rsync   A fast, versatile, remote (and local) file-copying tool
        -Hbaz -e ssh              '`<src_dir>
                                  <user>@<host>:<dest_dir>' -
                                  Backs up the 'src-dir': '`-H`'
                                  preserves hard links, '`-b`' renames
                                  preexisting destination files (back
                                  up), '`-a`' preserve everything except
                                  hard links and '`-z`' compresses.

cmp                 Compares two files, similar to diff but also for binaries

stat                Displays files status
                    -c%X Time of last modification of the file

readlink
                    -f Follow link recursively and print files path

xdg-open            Open file with default application for the file type

dialog              Display dialog box from shell script

watch               Execute command periodically

## Archives

dtrx
         <archive>           Universal archive extractor
tar
         xvzf <file>.tar.gz (.tgz)              Decompress and
                                                detar
         xvjf <file>.tar.bz2                    Decompress and
                                                detar
         -cf <archive>.tar <files>              Compress
unzip
         \*.zip                  Backslash is necessary so that
                                 bash doesn't expand the '`*`'
         -d <dir>                Extract into directory (create if
                                 doesn't exist)
zip
         -r <archive> <dir>               Compress whole directory
                                          recursively.
         -g <archive> <files>             Add files to existing archive
                                          (grow).
unrar
         e                Extract files from rar archive
zcat     Cats gziped file
## Packages

dpkg     Low level package manager for Debian.
         -l             Lists installed
                        packages.
         -i             Installs package
         <package>      from a package file.
         (sudo)
apt-get  Advanced Package Tool built on top of '`dpkg`'. New
         command called simply '`apt`' is also available. It merges
         the functionalities of '`apt-get`' and '`apt-cache`'.
         update                       Updates local list of existing
                                      packages.
         -u dist-upgrade              Upgrades by intelligently
                                      handling changing
                                      dependencies with new
                                      versions of packages. To
                                      regularly update put this line in
                                      '`crontab`':
                                      '`apt-get update && apt-get
                                      -u dist-upgrade`'.
         upgrade                      Same as dist-upgrade, but will
                                      not remove installed packages
                                      or install new ones.
         install <package>            Also updates single package.
         remove <package>             Removes package but leaves
                                      its configurations.
         remove                       Useful when Debian can't find a
         apt-listchanges              package.
         purge <package>              Removes package and its
                                      configurations. Run '`apt-get
                                      autoremove`' after to remove all
                                      dependencies that are not
                                      needed anymore.
         autoremove                   Removes unneeded packages.
         source <package>             Downloads code.
            build-dep <package>         Installs the build dependencies.
            --yes                       Answers with 'yes' to most
                                        questions (Except the ones that
                                        can have potentially harmful
                                        consequences).
            --force-yes                 Answers 'yes' to all questions
                                        (Not recommended).
apt-cache   Queries the APT's internal database.
            search <keyword>           Searches packages like
                                       '`apropos`', but globally.
            show <package>             Shows package info like version,
                                       dependencies, etc.
            showpkg <package>          Similar, but also shows the
                                       packages that depend on the
                                       searched package (reverse
                                       dependencies).
            policy <package>           Shows installed and remote
                                       version.
apt-file    APT package searching utility.
            search <file>               Search in which package a file
                                        is included.
            update                      Updates local list of package
                                        contents.
aptitude    Enables package browsing (skin for apt-get).
            search '~i!~M'               Lists installed packages that
                                         were not installed as a
                                         dependency, with short
                                         description of each.
            search <package>             Package search.
winetricks Installs wine applications.
update-alternatives Maintains symbolic links determining default commands.
unattended-upgrade   Automatic installation of security upgrades.
## Hardware

dmesg                          Displays bootup messages
cat /proc/cpuinfo              Displays more information about CPU e.g model,
                               model name, cores, vendor id
cat /proc/meminfo              Displays more information about hardware memory
                               e.g. Total and Free memory
lshw                           Displays information about system's hardware
                               configuration
lsblk                          Displays block devices related information
free -m                        Displays free and used memory in the system (-m
                               flag indicates memory in MB)
lspci -tv                      Displays PCI devices in a tree-like diagram
lsusb -tv                      Displays USB devices in a tree-like diagram
dmidecode                      Displays hardware information from the BIOS
hdparm -i /dev/xda             Displays information about disk data
hdparm -tT /dev/xda            Conducts a read speed test on device xda
<:code>
badblocks -s /dev/xda          Tests for unreadable blocks on disk
## Users

id                  Displays the details of the active user e.g. uid, gid, and
                    groups
last                Shows the last logins in the system
who                 Shows who is logged in to the system
groupadd "admin"    Adds the group 'admin'
adduser "Sam"       Adds user Sam
userdel "Sam"       Deletes user Sam
usermod             Used for changing / modifying user information
## File Commands

ls -al              Lists files - both regular & hidden files and their permissions
                    as well.
pwd                 Displays the current directory file path
mkdir               Creates a new directory
'directory_name'
rm file_name        Removes a file
rm -f filename      Forcefully removes a file
rm -r              Removes a directory recursively
directory_name
rm -rf             Removes a directory forcefully and recursively
directory_name
cp file1 file2     Copies the contents of file1 to file2
cp -r dir1 dir2    Recursively Copies dir1 to dir2. dir2 is created if it does not
                   exist
mv file1 file2     Renames file1 to file2
ln -s              Creates a symbolic link to file_name
/path/to/file_name
link_name
touch file_name    Creates a new file
cat > file_name    Places standard input into a file
more file_name     Outputs the contents of a file
head file_name     Displays the first 10 lines of a file
tail file_name     Displays the last 10 lines of a file
gpg -c file_name   Encrypts a file
gpg file_name.gpg  Decrypts a file
wc                 Prints the number of bytes, words and lines in a file
xargs              Executes commands from standard input
## Process Related

ps                 Display currently active processes
ps aux | grep      Searches for the id of the process 'telnet'
'telnet'
pmap               Displays memory map of processes
top                 Displays all running processes
kill pid           Terminates process with a given pid
killall proc       Kills / Terminates all processes named proc
pkill process-name Sends a signal to a process with its name
bg                 Resumes suspended jobs in the background
fg                 Brings suspended jobs to the foreground
fg n               job n to the foreground
lsof               Lists files that are open by processes
renice 19 PID      makes a process run with very low priority
pgrep firefox      find Firefox process ID
pstree             visualizing processes in tree model
## File Permission

chmod               octal filename Change file permissions of the file to octal
                    Examples
                    chmod 777            Set rwx permissions to owner, group and everyone
                    /data/test.c         (everyone else who has access to the server)
                    chmod 755            Set rwx to the owner and r_x to group and everyone
                    /data/test.c
                    chmod 766            Sets rwx for owner, rw for group and everyone
                    /data/test.c
                    chown owner          Change ownership of the file
                    user-file
                    chown                Change owner and group owner of the file
                    owner-user:owner-gro
                    up file_name

chown               Change owner and group owner of the directory
                    owner-user:owner-group directory

## Network

ip addr show         Displays IP addresses and all the network interfaces
ip address add       Assigns IP address 192.168.0.1 to interface eth0
192.168.0.1/24 dev
eth0
ifconfig             Displays IP addresses of all network interfaces
ping  host           ping command sends an ICMP echo request to establish a
                     connection to server / PC
whois domain         Retrieves more information about a domain name
dig domain           Retrieves DNS information about the domain
dig -x host          Performs reverse lookup on a domain
host google.com      Performs an IP lookup for the domain name
hostname -i          Displays local IP address
wget file_name       Downloads a file from an online source
netstat -pnltu       Displays all active listening ports

## Compression/Archives

tar -cf home.tar     Creates archive file called 'home.tar' from file 'home'
home<:code>
tar -xf files.tar    Extract archive file 'files.tar'
tar -zcvf            Creates gzipped tar archive file from the source folder
home.tar.gz
source-folder
gzip file            Compression a file with .gz extension

## Install Packages

rpm
rpm -i pkg_name.rpm                  Install an rpm package
rpm -e pkg_name                      Removes an rpm package
dnf install pkg_name                 Install package using dnf utility

## Install Source (Compilation)

./configure       Checks your system for the required software needed to build
                  the program. It will build the Makefile containing the instructions
                  required to effectively build the project
make              It reads the Makefile to compile the program with the required
                  operations. The process may take some time, depending on
                  your system and the size of the program
make install      The command installs the binaries in the default/modified paths
                  after the compilation
## Search

grep 'pattern' files               Search for a given pattern in files
grep -r pattern dir                Search recursively for a pattern in a given
                                   directory
locate file                        Find all instances of the file
find /home/ -name "index"          Find file names that begin with 'index' in /home
                                   folder
find /home -size +10000k           Find files greater than 10000k in the home
                                   folder
## Login

ssh user@host           Securely connect to host as user
ssh   -p   port_no      Securely connect to host using a specified port
user@host
ssh host                Securely connect to the system via SSH default port 22
telnet host             Connect to host via telnet default port 23

## File Transfer

scp file1.txt            Securely copy file1.txt to server2 in /tmp directory
server2/tmp
rsync -a /home/apps      Synchronize contents in /home/apps directory with
/backup/                 /backup directory
## Disk Usage

df   -h               Displays free space on mounted systems
df  -i                Displays free inodes on filesystems
fdisk -l              Shows disk partitions, sizes, and types
du -sh                Displays disk usage in the current directory in a
                      human-readable format
findmnt               Displays target mount point for all filesystems
mount device-path     Mount a device
mount-point

## Directory Traverse

cd ..                 Move up one level in the directory tree structure
cd                    Change directory to $HOME directory
cd /test              Change directory to /test directory
