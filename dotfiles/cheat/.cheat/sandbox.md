# FRONTMATTER
Opened 2026-09-15 
Filepath 

# SANDBOXING

## firejail

$ firejail /usr/sbin/firefox
        start Mozilla Firefox
$ firejail --debug /usr/sbin/firefox
        debug Firefox sandbox
$ firejail --private --dns=8.8.8.8 /usr/sbin/firefox
        start Firefox with a new, empty home directory, and a well-known DNS
        server setting.
$ firejail --net=eth0 /usr/sbin/firefox
        start Firefox in a new network namespace
$ firejail --x11=xorg /usr/sbin/firefox
        start Firefox and sandbox X11
$ firejail --list
        list all running sandboxes






# =============================================================================================================
# FOOTNOTES

