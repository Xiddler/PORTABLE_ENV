#!/bin/env bash

# Opened 2021-09-15
# Edited 2022-03-20

# NOTE: ~/PORTABLE_ENV/scripts/SymLinks.sh has all of these. Just run that script. Or run this as a script (note added 2022-03-20)

# $HOME symlinks

ln -s /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68 $HOME/SD64
ln -s /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS $HOME/ZIM
ln -s /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES $HOME/REPOS
ln -s /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS $HOME/DONAGHS
ln -s /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/images $HOME/images
ln -s /mnt/cifs_share $HOME/cifs_share

# ln -s  $HOME/cifs_share/RSYNCED $HOME/BACKUPS/RSYNCED # What's this doing?


# $HOME/.config

ln -s ~/PORTABLE_ENV/zim $HOME/.config/zim
ln -s $HOME/PORTABLE_ENV/ranger $HOME/.config/ranger


# ORG-MODE
ln -s /home/donagh/Dropbox/org-mode/org/todos.org  $HOME/all_org/org/todos.org
ln -s /home/donagh/Dropbox/org-mode/org/org.org  $HOME/all_org/org/org.org
ln -s /home/donagh/Dropbox/org-mode/org/info.org  $HOME/all_org/org/info.org
ln -s /home/donagh/Dropbox/org-mode/org/personal.org  $HOME/all_org/org/personal.org
ln -s /home/donagh/Dropbox/org-mode/org/reminders.org  $HOME/all_org/org/reminders.org
ln -s /home/donagh/Dropbox/org-mode/org/notes.org  $HOME/all_org/org/notes.org

# DOTFILES
# NOTE: as of 2022-03-19 I am using gnu-stow to manage symlinks for dotfiles -- see ~/PORTABLE_ENV/dotfiles/README.md

# ln -s /home/donagh/PORTABLE_ENV/zsh/powerlevel10k/p10k.zsh /home/donagh/.p10k.zsh 
# ln -s $HOME/PORTABLE_ENV/vim/vimrc_files/vimrc $HOME/.vimrc
# ln -s $HOME/PORTABLE_ENV/vim/en.utf-8.add    $HOME/.vim/spell           # for :set spell customised list
# append (Important!) the contents of ~/.vimrc to /etc/vimrc             # system vimrc to get sudo vim with same functionality
# ln -s $HOME/PORTABLE_ENV/zsh/zshrc $HOME/.zshrc
# ln -s $HOME/PORTABLE_ENV/zsh/zsh_aliases $HOME/.zsh_aliases
# ln -s $HOME/PORTABLE_ENV/profile $HOME/.profile
# ln -s $HOME/PORTABLE_ENV/cheat/dot_cheat_hard $HOME/.cheat
# ln -s $HOME/PORTABLE_ENV/gitconfig $HOME/.gitconfig
# ln -s $HOME/PORTABLE_ENV/MARKS/marks $HOME/.marks
# ln -s $HOME/PORTABLE_ENV/scripts $HOME/.scripts
# ln -s  $HOME/PORTABLE_ENV/Xresources $HOME/.Xresources


