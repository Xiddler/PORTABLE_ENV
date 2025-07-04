# file / directory permissions

u User, the owner of the file/directory
g Others in the Group
o Others

rwx         7
rw-         6
r-x         5
r--         4
---         0

             u   g   o
777         rwx rwx rwx
776         rwx rwx rw-
775         rwx rwx r-x
774         rwx rwx r--
766         rwx rw- rw-
765         rwx rw- r-x
764         rwx rw- r--
755         rwx r-x r-x
754         rwx r-x r--
744         rwx r-- r--
700         rwx --- ---
600         rw- --- ---
644         rw- r-- r--
664         rw- rw- r--
400         r-- --- ---

# Example of chmod ugo system

u → user ; g → groups ; o → other

->% chmod u=rwx,g=rx,o-rwx ~/.ssh

means give

user full rwx rights

group only read and execute but not write rights

other revoke all rights


# ssh permissions 

 Element            Permission
----------------------------------------
.ssh directory      700 ((drwx------)

public keys         644 (-rw-r--r--)

private keys        600 (-rw-------)

authorized_keys     600 (-rw-------)

known_hosts         600 (-rw-------)

config              600 (-rw-------)

