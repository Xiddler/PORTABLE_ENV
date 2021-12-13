
# CONTENTS

Intro
 ~/BACKUPS/bash_scripts
 ~/BACKUPS/<folders>
 ~/ZIM/.git/
 rsync commands 
 Clone REPOSITORIES and DONAGHS
 BORG BACKUP to Raspberry Pi


______________________________________________________________________
# Intro

This file describes the folders and files involved in backing up from the SD64 Card to the HDD on the laptop
The 'remote' backup is done using borg and is backed up to the USB_128 drive attached to the Raspberry Pi
______________________________________________________________________
# ~/BACKUPS/bash_scripts

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
List of folders and their functionality:

1	./CLONE_ALL_SD64                :: Archive of ~/DONAGHS and ~/REPOS in .tar.gz format
3	./bash_scripts                  :: Collection of scripts to do the rsync and tar jobs
4	./dot_git_for_zim               :: Actual folder for ~/ZIM/.git
5	./rsync_DONAGHS_MY_ZIM          :: Stores the full MY_ZIM
6	./rsync_DONAGHS_personal        :: Stores the full MY_ZIM
7	./rsync_Zim_Computer            :: Stores the full MY_ZIM
8	./rsync_Zim_ORG                 :: Stores the full MY_ZIM
9	./rsync_all_org                 :: Stores the full MY_ZIM
11	./zArchive                      :: Storage folder / trash


______________________________________________________________________
# ~/ZIM/.git/

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
# Clone REPOSITORIES and DONAGHS

contents of ~/BACKUPS/CLONE_ALL_SD64/README.md


Opened 2021-10-27

Instructions for the backup of 

    1. $HOME/DONAGHS                to                  $HOME/BACKUPS/CLONE_ALL_SD64/DONAGHS_$(date +%Y-%m-%d).tar.gz 
    2. $HOME/REPOS                  to                  $HOME/BACKUPS/CLONE_ALL_SD64/REPOSITORIES_$(date +%Y-%m-%d).tar.gz 

tar -czf $HOME/BACKUPS/CLONE_ALL_SD64/DONAGHS_$(date +%Y-%m-%d).tar.gz /run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS

tar -czf $HOME/BACKUPS/CLONE_ALL_SD64/REPOSITORIES_$(date +%Y-%m-%d).tar.gz /run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES

# BORG BACKUP to Raspberry Pi

I use the alias ->% borgz to borg-backup to the USB_128 on the RaspPi
This alias is set in zsh_aliases viz:-

    alias -g borgz="$HOME/.scripts/borg_backup_weekly"

This alias runs the commands in the file
~/PORTABLE_ENV/scripts/borg_backup_weekly  (there is no .sh extension)
