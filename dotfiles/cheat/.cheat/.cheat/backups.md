Opened Thursday, 2021-04-29
returned 2022-04-05
returned 2021-12-13
returned 2021-12-22 after Dec2021 reinstall, therefore MANY things may have changed. See section Dec 2021.

# Log of last backups

## 2022-05-24  
/home/donagh/BACKUPS/TARGZ/REPOS/REPOS_2022_05_24.tar.gz
/home/donagh/BACKUPS/TARGZ/DONAGHS/DONAGHS_2022-05-24.tar.gz



# rsync backup
/home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts/rsync_backup.sh


# Info

The information relating to this backup system is on ~/PORTABLE_ENV/backups/README.md
and also in:
Locations for access to information about backups in my Personal Knowledge Base PKB

zim-wiki/Computer/PROTOCOLS :: MAJORS:BACKING-UP 
doom-emacs                  :: TODOS/Tasks/IT Tasks


# tree 
Opened 2022-04-05
In my $HOME folder I have a folder called ~/BACKUPS/

-> % tree -L2 
.
├── RSYNCED -> /home/donagh/cifs_share/RSYNCED                              :: the command -> % rsync sends these to the USB attachted to the RPi
│   ├── all_org
│   ├── personal
│   ├── zim_Computer
│   └── zim_ORG
└── TARGZ
     ├── DONAGHS
     │   └── DONAGHS_2022-01-22.tar.gz                                      :: the full contents of ~/SD64/DONAGHS at that date
     └── REPOS
         └── REPOSITORIES_2022-01-22.tar.gz                                 :: the full contents of ~/SD64/REPOSITORIES at that date

(not sure that the "tiny" USB_128 attached to the laptop has a copy of DONAGHS and REPOSITORIES )
The backup USB_128 in the MemorySticks tin box is not there anymore. Note added: 2022-05-24

# DONAGHS

run the following script:
/home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts/backup_DONAGHS_REPOS.sh
#
The main things needing backup:
 
ALL_ZIM         - ~/DONAGHS/MYZIM/Computer && ORG
orgmode         - ~/all_org
DONAGHS         - ~/DONAGHS/personal/journal
REPOSITORIES    - ~/REPOS/

# 
~/BACKUPS/TARGZ
script at: /home/donagh/PORTABLE_ENV/dotfiles/scripts/.scripts/backup_DONAGHS_REPOS.sh

DONAGHS
tar -czf $HOME/BACKUPS/TARGZ/DONAGHS_$(date +%Y-%m-%d).tar.gz /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/

REPOS
tar -czf $HOME/BACKUPS/TARGZ/REPOSITORIES_$(date +%Y-%m-%d).tar.gz /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/

NOTE: 
ORIGINAL source data is written to the SD64 card directly (which is attached to the Toshiba laptop -- and not to the HDD of the Laptop itself).

Final destination data is sent to rsyncs / backups as follows:

Laptop            :: ~/BACKUPS                    ::: RSYNC                                                                     :::: read immediately
Laptop            :: ~/BACKUPS/TARGZ              ::: All of DONAGHS + all of REPOSITORIES (17GB                  -- MASSIVE)   :::: untar .tar.gz files
Raspberry Pi      :: USB_128                      ::: /srv/dev-disk-by-label-MyUSB/USB128_2/RSYNC                               :::: untar .tar.gz files
~Raspberry Pi     :: USB_128                      ::: /srv/dev-disk-by-label-MyUSB/USB128_2/SAFE_borg_backup      -- borg       :::: borg restore~
~Laptop           :: ~/SAFE/SAFE_borg_backup      ::: borg                                                                      :::: borg restore~

Note re borg: For a backup would need to create a temp folder to borg restore to. This is now defunct as rsync works.


#
Dec 2021 - folders on $HOME

~/BACKUPS/RSYNCED           :: use ~/.scripts/rsync_backup.sh - alias rsyncz - to rsync files to the RPi
~/cifs_share                :: symlinked to RPi USB_128. Used for rsyncz and borgz. NOTE: borg versions might conflict.
~/SAFE/SAFE_borg_backup     :: repository for borg backups. Needs to be copied to RPi. NOTE: borg versions might conflict.


#
OLDER - Now replaced by the above and kept here for archival reasons.

ZIM 
Computer ORG Business
BACKUP all of zim to RPi USB
cd to ~/ZIM
donaghm [18:15 Thu 29/04] [~/ZIM] [master *]
-> % sudo cp -r . ~/cifs_share/all_zim_2021-04-29

not working - why?
-> % sudo rsync -aul /run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/MY_ZIM .
/* rsync: [generator] symlink "/mnt/cifs_share/MY_ZIM/.git" -> "/home/donaghm/BACKUPS/dot_git_for_zim" failed: Operation not supported (95) */


org 
todos.org doom-notes 
has .git


DONAGHS 
personal -> 2020-10-02_recovered_personal  balance  ideas  journal  minding_me  personal.org  writing  writings




