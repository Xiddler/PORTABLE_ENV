Opened 2023-10-17
Webref: https://wiki.archlinux.org/title/Users_and_groups#User_management

Incorporating useradd, usermod below


# about

For all things related to user / group. 


# commands

(not an exhaustive list)

useradd                         :: useradd -m -G sudo -s <shell> donagh (will make /home/donagh automatically. -M to stop).
userdel                         :: userdel -r username (the -r option forces userdel to remove the user’s home directory and mail spool)
groupadd
usermod                         :: usermod -aG additional_groups username
passwd <user>                   :: give a <user> a passwd or edit one
groups <user>                   :: displays groups that <user> belongs to
gpasswd -a <user> <group>       :: Add users to a group with the gpasswd command (see FS#58262 regarding errors):
groupmod -n new_group old_group :: Modify an existing group with the groupmod command e.g. to rename the old_group group to new_group
change -l donagh G Account       :: Account expires: never
vipw / vigr                     :: edit /etc/passwd



(sudo) visudo                   :: add privileges to this file for ALL or <user>

chgrp
chown
chmod


## files

/etc/shadow
/etc/passwd             :: has seven fields delimited by colons:-  account:password:UID:GID:GECOS:directory:shell
/etc/gshadow
/etc/group


## useradd

### generic

useradd -m -G additional_groups -s login_shell username
eg ->% useradd -m -G sudo -s zsh donagh

### To give a home directory path for new user
sudo useradd -d /home/test_user test_user

### To create a user without home directory
sudo useradd -M test_user

### To create a user with expiry date
sudo useradd -e 2020-05-30 test_user

### To create a user with changed login shell e.g. zsh
sudo useradd -s /bin/zsh test_user

## usermod


### Add yourself (ie $USER) to the <group> group
sudo usermod -a -G <group> $USER

### Add yourself (ie $USER) to the sudo group
sudo usermod -a -G sudo $USER

### Add yourself (ie $USER) to the lxc group
sudo usermod -a -G lxc $USER


