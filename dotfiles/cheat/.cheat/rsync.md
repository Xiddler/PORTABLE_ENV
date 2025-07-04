# rsync flags

-a            :: archive means make an exact copy (not compressed)
-c            :: skip based on checksum, not mod-time & size
-r            :: recurse into directories
-u            :: skip files that are newer on the receiver
-v            :: verbose
-z            :: compressed
--delete      :: delete extraneous files from dest dirs
--delete      :: When this option is used, rsync deletes extraneous files from the destination location.

# To copy files from remote to local, maintaining file properties and sym-links (-a), zipping for faster transfer (-z), verbose (-v).  
rsync -avz host:file1 :file1 /dest/
rsync -avz /source host:/dest

# Copy files using checksum (-c) rather than time to detect if the file has changed. (Useful for validating backups). 
rsync -avc /source/ /dest/

# Copy contents of /src/foo to destination:

 This command will create /dest/foo if it does not already exist
rsync -auv /src/foo /dest

# Explicitly copy /src/foo to /dest/foo

rsync -auv /src/foo/ /dest/foo


# Basic for ~/BACKUPS/rsync_Zim_*
rsync -a --delete ~/DONAGHS/MY_ZIM/ORG ~/BACKUPS/rsync_Zim_ORG
rsync -a --delete ~/DONAGHS/MY_ZIM/ORG.txt ~/BACKUPS/rsync_Zim_ORG

 over a network add bwlimit e.g. adds a bandwidth limit to prevent rsync hogging the resources of the device
rsync --bwlimit=50000 -a --delete <source-folder> <backup-destination> 2>&1 | $

# rsync over ssh
 Two options that most users like to include in their commands is -a (archive) and -v (verbose). Along with these, you’ll need to supply the -e ssh option to instruct rsync to connect to a remote system over SSH. Here’s what the most basic syntax would look like.

$ rsync -av -e ssh /src/ user@remote:/path/to/dst

This command would synchronize the source directory /src with the destination directory /dst

# Copy file from local to remote over ssh with non standard port 1234 to destination folder in remoteuser's home directory

rsync -avz -e "ssh -p1234" /source/file1 remoteuser@X.X.X.X:~/destination/




#  Article on rsync from the web

## Installing Rsync

sudo apt install rsync
sudo yum install rsync

## Rsync Command Syntax

Before going into how to use the rsync command, let’s start by reviewing the basic syntax.

The rsync utility expressions take the following form:

Local to Local:  rsync [OPTION]... [SRC]... DEST
Local to Remote: rsync [OPTION]... [SRC]... [USER@]HOST:DEST
Remote to Local: rsync [OPTION]... [USER@]HOST:SRC... [DEST]

    OPTION - The rsync options .
    SRC - Source directory.
    DEST - Destination directory.
    USER - Remote username.
    HOST - Remote hostname or IP Address.

## Optiions / flags 
rsync provides a number of options that control how the command behaves. The most widely used options are:

    -a, --archive, archive mode, equivalent to -rlptgoD. This option tells rsync to syncs directories recursively, transfer special and block devices, preserve symbolic links, modification times, groups, ownership, and permissions.
    -z, --compress. This option forces rsync to compresses the data as it is sent to the destination machine. Use this option only if the connection to the remote machine is slow.
    -P, equivalent to --partial --progress. When this option is used, rsync shows a progress bar during the transfer and keeps the partially transferred files. It is useful when transferring large files over slow or unstable network connections.
    --delete. When this option is used, rsync deletes extraneous files from the destination location. It is useful for mirroring.
    -q, --quiet. Use this option if you want to suppress non-error messages.
    -e. This option allows you to choose a different remote shell. By default, rsync is configured to use ssh.

## Basic Rsync Usage

The most basic use case of rsync is to copy a single file from one to another local location. Here is an example:

rsync -a /opt/filename.zip /tmp/

rsync copy file

The user running the command must have read permissions on the source location and write permissions on the destination.

Omitting the filename from the destination location copies the file with the current name. If you want to save the file under a different name, specify the new name on the destination part:

rsync -a /opt/filename.zip /tmp/newfilename.zip

The real power of rsync comes when synchronizing directories. The example below shows how to create a local backup of website files:

rsync -a /var/www/domain.com/public_html/ /var/www/domain.com/public_html_backup/

If the destination directory doesn’t exist, rsync will create it.

## Use of end slashes on directories

It is worth mentioning that rsync gives different treatment to the source directories with a trailing slash (/). If the source directory has a trailing slash, the command will copy only the directory contents to the destination directory. When the trailing slash is omitted, rsync copies the source directory inside the destination directory.


## Using rsync to Sync Data from/to a remote Machine

When using rsync to transfer data remotely , it must be installed on both the source and the destination machine. The new versions of rsync are configured to use SSH as default remote shell.

In the following example, we are transferring a directory from a local to a remote machine:

rsync -a /opt/media/ remote_user@remote_host_or_ip:/opt/media/

If you haven’t set a passwordless SSH login to the remote machine, you will be asked to enter the user password.

To transfer data from a remote to a local machine, use the remote location as a source:

rsync -a remote_user@remote_host_or_ip:/opt/media/ /opt/media/

If SSH on the remote host is listening on a port other than the default 22 , specify the port using the -e option:

rsync -a -e "ssh -p 2322" /opt/media/ remote_user@remote_host_or_ip:/opt/media/

When transferring large amounts of data it is recommended to run the rsync command inside a screen session or to use the -P option:

rsync -a -P remote_user@remote_host_or_ip:/opt/media/ /opt/media/

## Exclude Files and Directories

There are two options to exclude files and directories. The first option is to use the --exclude argument and specify the files and directories you want to exclude on the command line.

When excluding files or directories , you need to use their relative paths to the source location.

In the following example shows how exclude the node_modules and tmp directories:

rsync -a --exclude=node_modules --exclude=tmp /src_directory/ /dst_directory/

The second option is to use the --exclude-from option and specify the files and directories you want to exclude in a file.

rsync -a --exclude-from='/exclude-file.txt' /src_directory/ /dst_directory/

/exclude-file.txt

node_modules
tmp
