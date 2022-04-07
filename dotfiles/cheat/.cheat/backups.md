Opened Thursday, 2021-04-29
returned 2022-04-05
returned 2021-12-13
returned 2021-12-22 after Dec2021 reinstall, therefore MANY things may have changed. See section Dec 2021.

#
The information relating to this backup system is on ~/PORTABLE_ENV/backups/README.md
and
Locations for access to information about backups in my Personal Knowledge Base PKB

zim-wiki/Computer/PROTOCOLS :: MAJORS:BACKING-UP 
doom-emacs                  :: TODOS/Tasks/IT Tasks

#
The main things needing backup:
 
ALL_ZIM         - Computer && ORG
orgmode         - ~/all_org
DONAGHS         - personal/journal
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




