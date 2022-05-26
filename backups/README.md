# CONTENTS
[Updated: 2022-04-06; 2021-12-13]
[NOTE: 2021-12-22 THIS File needs a TOTAL rewrite in light of the new rsync to RPi scripts now made. cheat reinstall. ~/SAFE/SAFE_borg_backup now
defunct ]

______________________________________________________________________
see:

-> % cheat backups.md



______________________________________________________________________
# Contents

### Relevant folders

LAPTOP
~/BACKUPS/RSYNC (attached to the RPi)
~/BACKUPS/TARGZ/DONAGHS
~/BACKUPS/TARGZ/REPOS
~/ZIM/.git/

SD64 Card in LAPTOP
This contains all the my original data

SD64 Card in safe (the round tin box)
This contains an earlier copy of the previous 
(I copy the current contents of the working SD64 card to the laptop then swap in the "spare" SD64 every 6 months or so)



[~/SAFE/SAFE_borg_backup (on the laptop)]

### Relevant commands
 
rsyncz commands (for various folders) - UPDATED: Dec2021
tar.gz --> Clone REPOSITORIES/ and DONAGHS/
borgz --> BORG BACKUP to Raspberry Pi

### Backup check
check backup has worked

### System Backup

Timeshift --> systmem backup / restore : no entry yet (note added 2021-12-27)

COMMENT: This has _never_ come to my rescue. New fresh reinstall of Manjaro on 2022-01-14

HELP


______________________________________________________________________
# Intro

(Written around 2021-12-13)
(ISSUE: Added 2021-12-22:  This README.md is missing information on setting up the samba server so that the directory on the laptop [/mnt/cifs_share] is linked to the RPi.)

This file describes the folders and files and the system involved in backing up from the SD64 Card to the HDD on the laptop
The 'remote' backup is done using borg and is backed up to the USB_128 drive attached to the Raspberry Pi
______________________________________________________________________
# ~/BACKUPS/bash_scripts

Status: LOST

These were not backed up and are now lost. NOTE added 2021-12-22

These scripts, when run, will rsync from the $source to the $destination

List of files in bash_scripts and their functionality:
1	./dot_git_for_Zim.sh            :: Echoes out that git is backed up to dot_git_for_Zim
2	./rsync_DONAGHS_MY_ZIM.sh       :: script rsyncs to ~/BACKUPS/
3	./rsync_DONAGHS_personal.sh     :: script rsyncs to ~/BACKUPS/
4	./rsync_Zim_Computer.sh         :: script rsyncs to ~/BACKUPS/
5	./rsync_all_org.sh              :: script rsyncs to ~/BACKUPS/
6	./rsync_zim_ORG.sh              :: script rsyncs to ~/BACKUPS/
7	./tar_DONAGHS.sh                :: tar.gz to ~/BACKUPS/CLONE_ALL_SD64
8	./tar_REPOS.sh                  :: tar.gz to ~/BACKUPS/CLONE_ALL_SD64

______________________________________________________________________
# ~/BACKUPS/<folders>
Status: LOST

List of folders and their functionality:

1	./CLONE_ALL_SD64                :: Archive of ~/DONAGHS and ~/REPOS in .tar.gz format
3	./bash_scripts                  :: Collection of scripts to do the rsync and tar jobs
4	./dot_git_for_zim               :: Actual folder for ~/ZIM/.git
5	./rsync_DONAGHS_MY_ZIM          :: Container for the full MY_ZIM
6	./rsync_DONAGHS_personal        :: Container for personal
7	./rsync_Zim_Computer            :: Container for zim_computer (incl. passwords)
8	./rsync_Zim_ORG                 :: Container for zim_org
9	./rsync_all_org                 :: Container for all_orgmode
11	./zArchive                      :: Store rubbish?


______________________________________________________________________
# ~/ZIM/.git/

Status: LOST

The contents of the folder ~/BACKUPS/dot_git_for_zim gets updated when I 
1. git add / commit on the CLI when in the directory $HOME/ZIM/
OR
2. choose the option in zim itself to File > Save version...

## How do I restore a file from this directory?
git checkout <hash> <filename>
______________________________________________________________________
# rsync commands 

## ZIM/Computer
> Computer / and Computer.txt
cd $HOME/BACKUPS && rsync -a --delete ~/DONAGHS/MY_ZIM/Computer ~/BACKUPS/rsync_Zim_Computer && rsync -a --delete ~/DONAGHS/MY_ZIM/Computer.txt ~/BACKUPS/rsync_Zim_Computer

## ZIM/ORG
> ORG.txt and ORG/
cd $HOME/BACKUPS && rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/BACKUPS/rsync_Zim_ORG && rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/BACKUPS/rsync_Zim_ORG

## ORGMODE files
> all_org (the orgmode files)
cd $HOME/BACKUPS && rsync -a --delete ~/Dropbox/org-mode/org ~/BACKUPS/rsync_all_org
Note: doom-notes.org is backed up with PORTABLE_ENV

## DONAGHS/personal
> personal folder
cd $HOME/BACKUPS && rsync -a --delete ~/DONAGHS/personal ~/BACKUPS/rsync_DONAGHS_personal

## DONAGHS/MY_ZIM   (ie all of zim)
> ZIM   (all of zim-wiki)
cd $HOME/BACKUPS && rsync -a --delete ~/DONAGHS/MY_ZIM ~/BACKUPS/rsync_DONAGHS_MY_ZIM

______________________________________________________________________
# tar.gz --> Clone REPOSITORIES and DONAGHS

contents of ~/BACKUPS/TAR_GZ/README.md


Opened 2021-10-27

Instructions for the backup of 

    1. $HOME/DONAGHS                to                  $HOME/BACKUPS/TAR_GZ/DONAGHS_$(date +%Y-%m-%d).tar.gz 
    2. $HOME/REPOS                  to                  $HOME/BACKUPS/TAR_GZ/REPOSITORIES_$(date +%Y-%m-%d).tar.gz 

tar -czf $HOME/BACKUPS/TAR_GZ/DONAGHS_$(date +%Y-%m-%d).tar.gz /run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/

tar -czf $HOME/BACKUPS/TAR_GZ/REPOSITORIES_$(date +%Y-%m-%d).tar.gz /run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/

# BORG BACKUP to Raspberry Pi

I use the alias ->% borgz to borg-backup to the USB_128 on the RaspPi
This alias is set in zsh_aliases viz:-

    alias -g borgz="$HOME/.scripts/borg_backup_weekly"

This alias runs the commands in the file
~/PORTABLE_ENV/scripts/borg_backup_weekly  (there is no .sh extension)
The folders that are backed up by borgz are:

1. zim/Computer
2. Dropbox/org-mode/org/*

As these are the two most frequently accessed folder/files.

______________________________________________________________________
# /home/donaghm/SAFE/SAFE_borg_backup

This is the destination folder on the laptop that borg creates the backups to and then copies from here to the USB attached to the Raspberry Pi


# Check backup has worked

Rsync the rsync scripts in ~/PORTABLE_ENV/backups/bash_scripts/
Run the file:
~/PORTABLE_ENV/backups/bash_scripts/check_backups_worked.sh

# HELP

## If the Laptop HDD dies?

The SD64 card has the latest data.

## If the SD card dies?

There are backups in the following locations (by ease of access):
1. ~/BACKUPS/rsync_<folders>
2. ~/CLONE_ALL_SD64                     :: check latest date, would need to to decompress and untar or read the .gz file
3. ~/SAFE/SAFE_borg_backups/<folders>   :: would need to create a new temp folder and borg restore to that
### 4. USB on the Raspberry Pi              :: would need to borg restore at 

  TL;DR
  Donaghs password on the rpi is zaq1234 (2021-12-13) 
  To list files
  $ borg list /srv/dev-disk-by-label-MyUSB/USB128_2/SAFE_borg_backup
  (shortcut for this on RPi - bborg)
  Pword: theboysoffairhill
  
  This file shows how to check that the backup to RPi / USB has been working successfully.

## If I haven't checked that the backups are working

You're f***ed.

OR regularly run

~/BACKUPS/bash_scripts/1run_rsyn_scripts.sh
and
~/BACKUPS/bash_scripts/3check_rsyn_backups_worked.sh


