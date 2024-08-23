Opened 2024-07-04

# AUG2024

There were two plugins/ folders
1. vim/dotfiles/vim/plugins         :: this one contains plugins.vim file
2. vim/plugins/                     :: I renamed this to old_plugins ahead of removing it

# JULY2024

I broke up $MYVIMRC file into the following:

1. $MYVIMRC            Original and base from which the others are sourced
2. plugins             Symlinked from PORTABLE_ENV/vim/plugins to $HOME/.vim/settings/plugins
3. configs             Symlinked from PORTABLE_ENV/vim/configs to $HOME/.vim/settings/configs
4. functions           Symlinked from PORTABLE_ENV/vim/functions to $HOME/.vim/settings/functions
5. mappings            Symlinked from PORTABLE_ENV/vim/mappings to $HOME/.vim/settings/mappings


