2020-10-12

# About

This file describes the backup system that I have in place while the
laptop is down and I am using the Raspberry Pi instead.

On the /home/donagh/ directory I have the following folders which
contain information that i will want to copy over to the SD64 SD Card
when the laptop is working. (Or i get another one)

/home/donagh/all_org            :: the .org files
/home/donagh/MY_ZIM/zim         :: ALL_ZIM on the SD64 card
/home/donagh/Donaghs_Tmp        :: files and folders that don't fit in above which i want to keep
/home/donagh/PORTABLE_ENV       :: backed up to github

/home/donagh/BACKUPS            :: a storage area for the backups and archives of the above folders

Inside the BACKUPS/ directory are two (maybe more) script files for rsyncing and tarring

a_backup_to_RSYNC.sh            :: using rsync -avz
b_tar_to_tarred.sh              :: tarring the folders from RSYNC/ to tarred/ 
c_compress_to_compressed.sh     :: to minimize size for copying to external
d_encrypt_to_encrypted.sh       :: for storing in Dropbox and elsewhere

Why so complcated? 
I am afraid of losing my data.
I want my data to be up to date and synced when the laptop is working.
I want one place to go to to get the latest files/folders.







