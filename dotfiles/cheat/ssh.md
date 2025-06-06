# Related files

~/.cheat/ssh-copy-id
~/.cheat/ssh-keygen
~/.cheat/ssh_issues


# To ssh via pem file (which normally needs 0600 permissions):
ssh -i /path/to/file.pem user@example.com

# To connect on an non-standard port:
ssh -p 2222 user@example.com

# To connect and forward the authentication agent
ssh -A user@example.com

# To execute a command on a remote server:
ssh -t user@example.com 'the-remote-command'

# To tunnel an x session over SSH:
ssh -X user@example.com

# open the zim-wiki GUI from the RPI on the WSL-UBUNTU
ssh -i .ssh/id_rsa_rpi -Y donagh@192.168.1.24

This worked on 2023-10-11

# Redirect traffic with a tunnel between local host (port 8080) and a remote
# host (remote.example.com:5000) through a proxy (personal.server.com):
ssh -f -L 8080:remote.example.com:5000 user@personal.server.com -N

# To launch a specific x application over SSH:
ssh -X -t user@example.com 'chromium-browser'

# To create a SOCKS proxy on localhost and port 9999

ssh -qND 9999 user@example.com

# To tunnel an ssh session over the SOCKS proxy on localhost and port 9999

ssh -o "ProxyCommand nc -x 127.0.0.1:9999 -X 4 %h %p" username@example2.com

# -X use an xsession, -C compress data, "-c blowfish" use the encryption blowfish
ssh user@example.com -C -c blowfish -X

# For more information, see:

 http://unix.stackexchange.com/q/12755/44856

# Copy files and folders through ssh from remote host to pwd with tar.gz compression
 when there is no rsync command available
ssh user@example.com "cd /var/www/Shared/; tar zcf - asset1 asset2" | tar zxf -

# Mount folder/filesystem through SSH
Install SSHFS from https://github.com/libfuse/sshfs
 Will allow you to mount a folder securely over a network.
sshfs name@server:/path/to/folder /path/to/mount/point

# Emacs can read file through SSH
 Doc: http://www.gnu.org/software/emacs/manual/html_node/emacs/Remote-Files.html
emacs /ssh:name@server:/path/to/file

#*************************************
           Donaghs
#*************************************

# authorized_keys
_serverside_

This file is on the serverside and contains the contents of the clientside file PUBLIC_KEY 
eg  $HOME/.ssh/id_rsa.pub or $HOME/.ssh/id_rsa_do.pub or similar 
NOTE: extension is .pub it is public

If the ssh command ->% ssh-copy-id is not available:
Copy the contents of the clientside PUBLIC_KEY ~/.ssh/id_rsa.pub into the file ~/.ssh/authorized_keys on the serverside. 

## What goes into the serverside authorized_keys file?

The contents of ~/.ssh/id_rss.pub from the clientside



# known_hosts
_clientside_

The ~/.ssh/known_hosts file is a vital part of _clientside_ SSH configuration files.  This file has data about the server (remote).
This file is used to verify the identity of servers in the future. 
ssh can automatically add keys to this file, but they can be added manually as well.

When you connect to a new remote server via SSH, you are prompted whether you want to add the remote hosts to known_hosts file.

## What goes into the serverside known_hosts file?

The known_hosts file stores the public keys of the hosts accessed by a user.
The contents of the public key of all of the servers that you have connected using ssh. (Wait, is this correct?)




# To generate new key pair
see ~/.cheat/ssh-keygen

-> % ssh-keygen

# You might need to start ssh-agent before you run the ssh-add command:
eval `ssh-agent -s`

# inform server that this DIR_PATH/keypairforssh is the private key
-> % ssh-add ~/.ssh/id_rsa_rpi
# Output: Identity added: ./id_rsa_rpi (donagh@donagh-satellitep50c)


# ssh-copy-id — inform the remote of the new id_rsa_rpi.pub
see ~/.cheat/ssh-copy-id
ssh-copy-id -i ~/.ssh/id_rsa.pub  donagh@192.168.11.108

All you are actually doing is adding the contents of your id_rsa.pub file to your ~/.ssh/authorized_keys file on your linux host. 
You may need to run 'systemctl restart ssh'.

# Make the ssh connection
-> % ssh donagh@142.23.24.11
-> % ssh -i $HOME/.ssh/id_rsa_do donagh@142.23.24.11 # note the -i flag points to the private key

# using scp to copy from local to remote 
-> % scp ~/Documents/documentForLinux.txt donagh@142.23.24.11:~/Documents
# remote to local
-> % scp donagh@142.23.24.11:~/Documents ~/Documents/documentForLinux.txt 

# To mount remote system directories to the client, sshfs is the tool developed for this specific purpose.
# (Ensure that the /mnt/projects directory exists on the local machine)
-> % sshfs donagh@142.23.24.11:/home/donagh/projects /mnt/myprojects

# To unmount sshfs
-> % killall sshfs
-> % sudo fusermount -u /mnt/myprojects
-> % sudo umount -l /mnt/myprojects 


#####################################
# NOTES ON CREATING SSH KEYS 
#####################################

# Creating
ssh-keygen -t rsa -b 4096 -N "" -C "" -f keyname
where:
-N is new_passphrase
-C is commet
-f input_keyfile

mv keyname* ~/.ssh

## Shortform
ssh-keygen -t rsa -b 4096

# Setting access rights
chmod 700 ~/.ssh && chmod 600 ~/.ssh/*

# ~/.ssh/config
Host github
HostName github.com
User git
IdentityFile ~/.ssh/keyname     :: do I mean for e.g. id_rsa? 

# This logs into the server, and copies the public key to it.
ssh-copy-id -i ~/.ssh/keyname user@remote_machine

# Checking the ssh procesd
ssh -T git@github.com
eval $(ssh-agent -s)      :: This starts the ssh-agent process 
ssh-add ~/.ssh/keyname

# NOW copy id_rsa.pub to Github account in SSH keys
ssh -T git@github.com   :: This tests ssh access to github

# check open ssh connections
ss -o state established '( dport = :ssh or sport = :ssh )'

