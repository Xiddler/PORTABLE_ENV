# FRONTMATTER
Opened 2026-07-05 
Filepath 

# SUDO

If you don't like being asked for the root password all the time, you can simply disable it by adding your user to the /etc/sudoers file.

You should edit this file with sudo visudo. 

Manj%> sudo visudo /etc/sudoers
and add this line

$USER ALL=(ALL:ALL) NOPASSWD: ALL

save & close

This will validate the contents of the file before saving and prevent you from making mistakes. If you don't use visudo and make a mistake, it may lock you out from sudo. Which means that you won't be able to correct your mistake!

ALTERNATIVE

To do it:

Manj%> echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
Manj%> sudo bash -c "echo '$USER ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"

In the first case, tee -a will append its standard input to the file and we execute this command as root.

In the second case, we run bash as root and ask it to execute a command (-c) and the entire command will be executed as root. Note the tricky "/' business here which will dictate when the $USER variable will be expanded.








# =============================================================================================================
# FOOTNOTES

