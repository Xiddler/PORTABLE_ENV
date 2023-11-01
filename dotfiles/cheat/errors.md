Opened


# Notes

When using sudo pamac install   to install some software

    ==> ERROR: One or more PGP signatures could not be verified!

zim/wiki --> LINUX:FAILS:ERROR One or more PGP signatures

sudo pacman -Sy archlinux-keyring manjaro-keyring
and then update your system with sudo pacman -Syyu.

if that doesn't work carry on doing the following sequentially, check if the update command sudo pacman -Syyu will proceed after each to save entering the lot.

sudo pacman-key --populate archlinux manjaro
sudo pacman-key --refresh-keys
