# List of tools that I may not often use but may be usefule sometimes

# To obviate the need to enter sudo password
->$ sudo visudo
# and add this at the very end
donagh ALL=(ALL:ALL) NOPASSWD: ALL

# Open file listing in a vim buffer

->% vidir

# fstab, fdisk etc.
# view partitions
sudo fdisk -l
# also 
sudo cfdisk /dev/sdb 

# view UUIDs
sudo blkid

# File systems that are mounted at boot time are defined in the “/etc/fstab” file. 
# view automount entries
sudo vim /etc/fstab
# sample line
# UUID=14D82C19D82BF81E /data    auto nosuid,nodev,nofail,x-gvfs-show 0 0

# --------------------------------------------------------------------------------

# like Task Manager - shows processes in a separate GUI
systemmonitor

# Show details of files
stat <filename>

# generate UUID
uuidgen

# colorize output on the CLI
# example
grc df -h

# fakeroot -- see ->% man fakeroot
fakeroot

# Handwritten notes and save to pdf
#A usage would be to annotate pdf files
xournalpp

# Manage configuration templates
doxygen

# stopwatch and countdown timer in the cli
# termdown --help
termdown -t "Finished" '1h 0m 5s'

# text to speech
espeak "Hey get up and do something"

# simple calculations
expr 4 + 7
expr 4 \* 7 # the '*' needs to be escaped


# show text larger that single line 
figlet "hello giraffe"
 _          _ _               _            __  __      
| |__   ___| | | ___     __ _(_)_ __ __ _ / _|/ _| ___ 
| '_ \ / _ \ | |/ _ \   / _` | | '__/ _` | |_| |_ / _ \
| | | |  __/ | | (_) | | (_| | | | | (_| |  _|  _|  __/
|_| |_|\___|_|_|\___/   \__, |_|_|  \__,_|_| |_|  \___|
                        |___/                          

# show time in figlet format
watch -t -n1 "date +%T | figlet" 

# Check if a specific port is open or not on localhost
ncat -zv localhost <port_number>


# view animated gifs
# needs ImageMagick
animate <file.gif>

# write raw images to disk like dd command
imagewriter

# BATCH RENAME
# Lowercase all files and folders in current directory
rename 'y/A-Z/a-z/' *

# Replace 'sometext' with 'replacedby' in all files in current directory
rename 's/sometext/replacedby/' *

# using zmv
# e.g.  remove the (z-lib.org) from the filenames of the books in Computer_books [ to allow searching for
# org-mode files]
zmv '(*)\(z-lib.org\).pdf' '$1.pdf'

# USING RANGER (NICE WAY - but see qmv -A)
# use the bulkrename function in ranger. It opens a buffer in vim
# see YouTube Luke Smith https://www.youtube.com/watch?v=NzD2UdQl5Gc
1. open the dir in ranger (shortcut ->% ra)
2. select files (all files? shortcut V)
3. :bulkrename (this opens a buffer with all the selected files)
4. make the changes (in vim escape the grouping parentheses e.g. \( and the capture is e.g. \1)
5. save changes e.g.  :wq
6. confirm everything before committing with :q<enter>

# END BATCH RENAME

# convert from one encoding to another
iconv --usage
(recode is a CLI utility which is a wrapper for iconv)


# get system information
inxi

# CLI screenshot utility
scrot

# pop up dialogue boxes etc
#examples
zenity --color-selection
zenity --calendar

# display bandwidth usage on an interface by host
iftop 

# section of man pages e.g. inxi(8)
man 8 inxi

# block / unblock (internal) IP addresses
sudo arp -s 192.168.1.1xx # blocks
sudo arp -d 192.168.1.1xx # unblocks


# play media in the CLI
cvlc <mediafile> # headless version of VLC
mpv <mediafile>
mplayer <mediafile>

# view .jpg or .gif __directly__ in the terminal
chafa <imgfilename>

# rename files in current directory in a vim buffer - this comes with the renameutils (RPi, Ubuntu)
qmv -A
# Note that imv only allows you to rename one file at a time.
imv <filepath/filename>

# Versatile replacement for vmstat, iostat and ifstat.
dstat --vmstat -sn

# output file into columns
column -t <filename>

# monitor power see https://www.linux-magazine.com/Issues/2020/233/The-Linux-Box-of-Tricks/(tagID)/32
->% upower -i 

# pop-up notification e.g. ->% notify-send -t 4000 "Hello Donagh" will open a pop-up for 4 seconds
->% notify-send "Hello Donagh"

# identify current running shell
->% echo $0
->% which "$0" 
->%   realpath /proc/$$/exe

# to display hidden files only
ls -la | awk '{ print $9 }' | grep '^\.' | xargs -n 6
exa -la | awk '{ print $7 }' | grep '^\.' | xargs -n 6

# create file with today's date
touch "file_$(date +%Y-%m-%d)"

# Create random string
# -> % openssl rand -hex 64
b3b6cd7b225d43c102489bdc81fb18cf9d56147cb039e80b517055d34cc515324c930bd9ed0ef5c7ea1873cb88ea3e38b430f5440c96ed2c55c92fffda819de5

# -> % openssl rand -base64 10
EDPXfQaQbZqmWg==

# sudo vim <sudo-accessible-file>
$ sudoedit /etc/ssh/ssh_config
OR
$ sudo -E vim /etc/ssh/sshd_config

# substitution on the command line - is this grep?
-> % in="don_agh"
-> % out="${in/_/-}" 
-> % echo $out
don-agh
 
# trouble shoot :0-0 display issues
uname -a
env | grep -e DISPLAY -e AUTHORITY
loginctl show-session $XDG_SESSION_ID
# check that $USERNAME is LOGIN Name

# read info pages with vim navigation
info --vi-keys wget

# in RPi - allow username donagh to sudo without passwd
sudo visudo /etc/sudoers.d/010_pi-nopasswd 
# and add
%sudo ALL=(ALL) NOPASSWD: ALL


# convert from one file / document format to another example: 
->% unoconv -f csv some-file.ods


# realpath <folder>
realpath .

# scan LAN - install ipscan from Angry IP
ipscan

# smb client to log into a smb server e.g. openmediavault
smbclient -h

# File systems that are mounted at boot time are defined in the “/etc/fstab” file. 
# To check the permanently mounted drives and to add more
sudo vim /etc/fstab

# To check a disk - disk needs to be unmounted. Do this from a live USB for the laptop HDD.
sudo fsck


# to compare two image files
diff -s Folder1/file.jpg  Folder2/file.jpg

# to compare two text files
vimdiff file1.txt file2.txt

# check health of a device
# eg USB on /dev/sdb1
smartctl -a /dev/sdb1
(from smartmontools)

# check locale
locale -a

# copy filename into clipboard
 readlink -f <filename> | clipcopy

# find file containing a string e.g. "comenius" in a file in the current directory i.e. '.' -- will output only the file name due to the -l flag
grep -Rnwil '.' -e 'comenius'


# create a random long password
openssl rand -hex 64

# find latest 20 docs in current directory (zsh)
ls -lt  **/*(.om[1,20]) 


# xargs - see https://shapeshed.com/unix-xargs/
# Whilst tools like grep can accept standard input as a parameter, many other tools cannot. Using xargs allows tools like echo and rm and mkdir to accept standard input as arguments.
#
# TIME DATE and ntp 
# donaghm [01:03 Sat 04/09] [~] 
-> % timedatectl
               Local time: Sat 2021-09-04 01:03:13 IST
           Universal time: Sat 2021-09-04 00:03:13 UTC
                 RTC time: Sat 2021-09-04 00:03:13
                Time zone: Europe/Dublin (IST, +0100)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no

# list users on the system
compgen -u
cat /etc/passwd
getent passwd

# output the name of the kitty terminal 
 -> % ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$) | cut -d'/' -f4
kitty
# output the name of the terminator terminal 
 -> % PS $(ps -o 'ppid=' -p $$) | awk -F "/" '{print $NF}'  | head -n1 
terminator


# bash regex
#
# pat='[^0-9]+([0-9]+)'
# s='I am a string with some digits 1024'
# [[ $s =~ $pat ]] # $pat must be unquoted
# echo "${BASH_REMATCH[0]}"
# echo "${BASH_REMATCH[1]}"

# list all installed man pages
man -k -

# extract text from a pdf file
-> %  pdftotext -layout test_pdftotext.pdf -  > mytest.txt

# reset
# clears the screen and resets the shell (say, if there is a problem in the shell)

# Ctrl Z
# send a live programme into the background and go to the terminal
# fg will return you to the programme

# Change CAPS button to ESC
-> % setxkbmap -option caps:swapescape
# But it does not work well on my manjaro

# get the size of a directory
-> % du -sh ~/PORTABLE_ENV 

# process, job, session
JOB:        A job is the same as a process group; job commands include fg, bg, & and Ctrl Z;
PROCESS:    Anything that happens on your computer depends on a process, like a run a command or program, run a GUI application.
SESSION:    Session usually refers to shell sessions, e.g. when you have a teminal emulator open a session is in progress. 

# wmctrl
# wmctrl  is a command that can be used to interact with an X Window manager can query the window manager for information, and it can request that certain window management actions be taken.
# example
-> % wmctrl -x -l 

# here document example
-> % LANG=C tr a-z A-Z << END
heredoc> one two three               
heredoc> four five six                                     
heredoc> END
ONE TWO THREE
FOUR FIVE SIX

# previous command line argument - think ! is CLI (like in vim command mode) and $ is the last element like in regex
!$ gets the last element of the previous command line argument. 

# Clock in the terminal! 
 printf '\033c';  while true; do echo -en "  $(date)\r"; sleep 1; done

# SPECIAL CHARATERS 
$_ or !$            recall the last argument of the previous command (to save typing it out for a new command. Very handy!)
Alt + .             to recall the last argument of any of the previous commands. 

!!                  re-runs the previous command e.g. -> % sudo !! will run the previous command with sudo privileges.
[ -d ~/REPOS ]      test if the directory ~/REPOS exists
"  "                echo "Today is $(date)" vs echo "Today is \$(date)"
echo $(date)        is equivalent to echo `date` and to echo "$(date)" 
-- (double dash)    means "end of the command-line options", so any argument after that is treated as a non-option argument, in this case, a filename for rm to delete.  This -- (double dash) works with many Unix commands. It was introduced relatively early on in Unix history, after the issue of filenames starting with a dash was found. Example: $ rm -- -stupidFilename  will remove the file whose name begins with a - .

# Arithmetic
echo $(( 7307/1285.0))
echo $(( 3+57))

# Tools
# Run a Fedora n the terminal that will close on exit. Needs podman.
->% podman run --rm -it fedora

# Check the etymology of "fun" online (needs w3m)
->% w3m "https://www.etymonline.com/word/fun"



# END
