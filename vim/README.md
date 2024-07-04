Opened 2024-07-04


# JULY2024

I broke up $MYVIMRC file into the following:

1. $MYVIMRC            Original and base from which the others are sourced
2. plugins             Symlinked from PORTABLE_ENV/vim/plugins to $HOME/.vim/settings/plugins
3. configs             Symlinked from PORTABLE_ENV/vim/configs to $HOME/.vim/settings/configs
4. functions           Symlinked from PORTABLE_ENV/vim/functions to $HOME/.vim/settings/functions
5. mappings            Symlinked from PORTABLE_ENV/vim/mappings to $HOME/.vim/settings/mappings


