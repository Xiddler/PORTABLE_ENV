Opened 2022-02-06

# on reinstall

sudo mv /etc/sysctl.conf /etc/sysctl.conf.old 
sudo ln -s ~/PORTABLE_ENV/dropbox/sysctl.conf /etc/sysctl.conf 
sudo sysctl -p sysctl.conf


(if this doesn't work look at info below)


# command to enable dropbox (which I use for org-mode / Orgzly)

echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p && ~/.dropbox-dist/dropboxd

# cat /etc/systcl.conf
    fs.inotify.max_user_watches=100000
fs.inotify.max_user_watches=100000
fs.inotify.max_user_watches=100000
fs.inotify.max_user_watches=100000
fs.inotify.max_user_watches=100000
fs.inotify.max_user_watches=100000
fs.inotify.max_user_watches=100000
fs.inotify.max_user_watches=100000

# sysctl -h
Options:
  -a, --all            display all variables
  -p, --load[=<file>]  read values from file



# possible short cut (not tried)

permissions for sysctl.conf
-rw-r--r--  1 root root     280 Feb  6 09:14 sysctl.con

ln -s ~/PORTABLE_ENV/dropbox/sysctl.conf ~/etc/sysctl.conf 
sysctl -p /etc/sysctl.conf
~/.dropbox-dist/dropboxd

# what I did 2022-02-06
cp -p /etc/sysctl.conf ~/PORTABLE_ENV/dropbox
sudo chown root:root ~/PORTABLE_ENV/dropbox/sysctl.conf

sudo mv /etc/sysctl.conf /etc/sysctl.conf.old

sudo ln -s ~/PORTABLE_ENV/dropbox/sysctl.conf /etc/sysctl.conf 

check org-mode still working : restart doom-emacs
SUCCESS!


