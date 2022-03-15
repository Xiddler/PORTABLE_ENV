Opened 2022-02-13


## Overview
I have split my .vimrc file and (one of) the new sub-vimrc files is in /home/donagh/PORTABLE_ENV/vim/dotvim/vimrc_dirs.
The plugins are managed by vim-plug using the Plug command in the plugin.vim file and is sourced in $HOME/.vimrc

The purpose was to help tidy up my .vimrc file which was getting untidy
Added the following to ~/.vimrc
source ~/PORTABLE_ENV/vim/dotvim/syntax/<filename.vim>
For the plugins sub-vimrc it is __plugin.vim__.









