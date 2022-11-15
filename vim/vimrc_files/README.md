Opened 2022-02-13


## Overview

I have split my .vimrc file and (one of) the new sub-vimrc files is in /home/donagh/PORTABLE_ENV/vim/dotvim/vimrc_dirs.
The plugins are managed by vim-plug using the Plug command in the plugin.vim file and is sourced in $HOME/.vimrc

The purpose was to help tidy up my .vimrc file which was getting untidy
Added the following to ~/.vimrc
source ~/PORTABLE_ENV/vim/dotvim/syntax/<filename.vim>
For the plugins sub-vimrc it is __plugin.vim__.


# To install a new plugin
(from -> % cheat vim)
 1. git clone into /home/donagh/PORTABLE_ENV/vim/dotvim/plugins (which is symlinked to ~/.vim)
 2. vim /home/donagh/PORTABLE_ENV/vim/vimrc_files/plugins.vim " rem: I can use gf to open that file!
 3. add e.g. Plug 'https://github.com/vim-airline/vim-airline-themes.git' under call plug#begin('/home/donagh/.vim/plugins')
 4. run :PlugInstall 

#  2022-11-15 Moved plugins.vim
Moved plugins.vim to /home/donagh/PORTABLE_ENV/vim/plugins/plugins.vim
and this is the file that is 'sourced' in the .vimrc file

# .vimrc
The actual .vimrc file is in the dotfiles folder to allow GNU Stow to install them.
Linked to this folder for visibility reasons.

# minimal vimrc
example
vim -u /home/donagh/PORTABLE_ENV/vim/vimrc_files/minimal_vimrc ~/files/sample_files/README.md
alias
-> % vimm <file>













