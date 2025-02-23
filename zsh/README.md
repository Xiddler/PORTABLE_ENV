This is a file to show commands for copying the relevant theme and zsh-syntax=highlighting plugins

STOW
As of 2022-03-19 I am using stow to create the symlinks for my dotfiles. See zim-wiki/Computer:LINUX:1Linux Live USB:01installed apps:stow
usage
-> % stow zsh
will create the symlinks for both .zshrc and .zsh_aliases in $HOME

# PER DIRECTORY HISTORY
added 2025-02-16
https://github.com/jimhester/per-directory-history.git

Per directory history for zsh, as well as global history, and the ability to toggle between them with ^G.

Use Ctrl-G to toggle
using global history
 ~/REPOS/OUTDOOR/Fuel/gas                                                                                        42s  donagh@donagh-satellitep50c
❯
using local history
 ~/REPOS/OUTDOOR/Fuel/gas                                                                                        42s  donagh@donagh-satellitep50c
❯



# THEME
cp ~/PORTABLE_ENV/zsh/crcandy_dm.zsh-theme ~/.oh-my-zsh/themes/

# PLUGINS
cp -r ~/PORTABLE_ENV/zsh/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/


 1. crcandy_dm.zsh-theme - Ans: $HOME/.oh-my-zsh/themes
and 
2. zsh-syntax-highlighting - Ans: $HOME/.oh-my-zsh/plugins
# 1. amuse_dm.zsh-theme - Ans: $HOME/.oh-my-zsh/themes
