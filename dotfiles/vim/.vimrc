"{{{ Preliminaries


" My .vimrc is split into the following:

" $MYVIMRC = $HOME/.vimrc                                                   " This file
" MyVimSettingsDir='/home/donagh/.vim/settings'

" The constituent files are:
source $HOME/.vim/settings/configs/configs.vim                              " configs <leader>co
source $HOME/.vim/settings/functions/functions.vim                          " functions <leader>fu
source $HOME/.vim/settings/mappings/mappings.vim                            " mappings <leader>ma
source $HOME/.vim/plugins/plugins.vim                                       " plugins <leader>pl


" These are symlinked from PORTABLE_ENV/
" Use <leader>pl/co/fu/ma to open the relevant file
" Completed 2024-07-04

" Where is?
" abbreviations         :: config file at $HOME/.vim/settings/configs/configs.vim

" }}}
" {{{ =============
"}}}
" {{{ VIMRC
colorscheme miramare
" colorscheme elflord " 
" }}}
"{{{ Minimum Settings
" vimm <filename>

" Base filepath: /home/donagh/PORTABLE_ENV/dotfiles/vim_rc/vimrc

" === Min settings === 
" cf. /usr/share/vim/vim82/defaults.vim 
" 'set nocompatible' is never necessary in a vimrc file. When Vim detects a user vimrc file, it automatically sets nocompatible. 
" set backspace=start,eol,indent  no longer needed

" Minimal .vimrc location 
" /home/donagh/PORTABLE_ENV/vim/vimrc_files/minimal_vimrc
" usage:
" vvim <afile> is an alias on Toshiba for this — no folding, no plugins, horrible!

inoremap jk <esc>
"set <esc>=jk       " THIS CAUSED A LARGE LAG -- note added 2024-12-16

" use spacebar to enter command mode. This matches doom-emacs for me and my muscle memory
nnoremap <space> :


" encoding
set encoding=utf-8
" set fileencoding=utf-8
"
" Better COPY & PASTE
" When you want to paste large blocks of code into vim, press F2 before you paste. 
" At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2> "
" set clipboard=unnamed
set clipboard+=unnamedplus " Getting error ▷ W23: Clipboard register not available, using register 0 ◁ on 2024-12-16 " 


" Remember more commands and search history
set history=500 " 
set undolevels=500 " 

" Rendering — added 2024-04-25
set ttyfast "

" Open new split panes to right and bottom, which feels more natural than Vim's default
set splitbelow
set splitright

" Set :Explorer to tree view
"let g:netrw_liststyle=3

" === GNU Stow === 

" As of 2022-03-19 I am using stow to manage the symlinking of my dotfiles.
" See $HOME/PORTABLE_ENV/dotfiles/README.md 
" Usage: On a new install -> %~ stow vim  will automatically create the necessary symlinks from this folder 


" ===  $MYVIMRC ===

let $RC="$HOME/.vimrc" " alternative to $MYVIMRC

" NOTE: See Leader section below. These are just reminders.

" nnoremap leader vv :tabe $MYVIMRC<CR> - this seems to invoke visual
" nnoremap leader vv :tabe $MYVIMRC<CR>

" source $MYVIMRC
" nnoremap leader ss :so $MYVIMRC<CR>
" nnoremap leader sv :so $MYVIMRC<CR>
" nnoremap leader sm :so $MYVIMRC<CR>
"
" Saving every time I leave insert mode is my preferred alternative: `autocmd! InsertLeave * silent! update`
" 2024-12-15
" donagh - doesn't seem to like the * there
" ERROR 
" Error detected while processing InsertLeave Autocommands for "*":
" E492: Not an editor command: slient! update
" TRY THIS -- NOTE: It causes HUGE lag times. Don't use it.
" augroup AUTOSAVE
  " au!
  " autocmd InsertLeave,TextChanged,FocusLost * silent! write " changed update to write
" augroup END

" Did that work? Seems so...
filetype on 
filetype plugin on
filetype indent on



" === Runtimepath and path ===

" to find runtimepaths use :set <enter> 
"RUNTIMEPATH 
" ~/.vim
" ~/.vim/plugins/vim-commentary
" ~/.vim/plugins/stellarized
" ~/.vim/plugins/vim-airline
" ~/.vim/plugins/ranger.vim
" ~/.vim/plugins/vim-easymotion
" ~/.vim/plugins/goyo.vim
" ~/.vim/plugins/limelight.vim
" ~/.vim/plugins/vim-markdown-folding
" ~/.vim/pack/nightsense/start/stellarized
" /usr/share/vim/vimfiles
" /usr/share/vim/vim82
" /usr/share/vim/vimfiles/after
" ~/.vim/plugins/vim-markdown-folding/after
" ~/.vim/after
   
" :set runtimepath?
let $RTP=split(&runtimepath, ',')[0] " allows :set rtp? " 

" Path
" :set path? path to search when using find / FZF 
set path+=~/REPOS/ 

" $VIMRUNTIME 
" /usr/share/vim/vim90 

" }}}
" {{{ =============
"
"}}}
" {{{ PLUGINS 

" $HOME/PORTABLE_ENV/vim/dotvim/plugins/plugins.vim

" === Plugins ===

" 2024-07-03: The plugins folder in now symlinked to $HOME/.vim/settings/plugins    (see Preliminaries above)
"
" 2022-02-05  Plugin manager: vim-plug started 
" https://github.com/junegunn/vim-plug and https://github.com/junegunn/vim-plug/wiki/tutorial
" To installl vim-plug, do one of the following
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" or better ->% cd ~/.vim/autoload and git clone https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" or simply ->% ln -s ~/PORTABLE_ENV/vim/dotvim ~/.vim
" 
" Steps to installing a new plugin
" 1. cd  /home/donagh/PORTABLE_ENV/vim/plugins/ 
" 2. git clone <plugin required>
" 3. vim /home/donagh/PORTABLE_ENV/vim/plugins/plugins.vim AND edit/add Plug 'https://github.com/<plugin to be installed.vim>'
" 4. mv the .git/ folder to .old_git to avoid terrible warnings when using ->% git add .
" 5. :PlugInstall  after adding a new Plug

" external sub-vimrc files for plugins, specifically  vim-plug using Plug
" source /home/donagh/PORTABLE_ENV/vim/vimrc_files/plugins.vim  
" Rem: Use gf to open that file!
"source /home/donagh/PORTABLE_ENV/vim/plugins/plugins.vim
" source $HOME/.vim/settings/plugins/plugins.vim 
" source /home/donagh/PORTABLE_ENV/vim/plugins/base16-vim/colors/base16-default-dark.vim

" Rem: Use gf to open that file! CHANGED LOCATION ON 2024-07-03 to $HOME/.vim/plugins/plugin  [[ 2022-10-13  ]]

" List of plugins:
" nnoremap lpl :!ls /home/donagh/PORTABLE_ENV/vim/plugins/<cr>


"}}}
" {{{ =============
"
"}}}
" {{{ CONFIGS
"
" https://github.com/gabrielelana/vim-markdown.git version of vim-markdown seems to require the following line
" let g:markdown_enable_folding = 1
" DID NOT WORK FOR ME 2024-12-17

" $HOME/.vim/settings/configs/configs.vim                              
" For Themes and UI settings
"
" Aug 2024 Enable true color for miramare theme in vim inside tmux
" let g:miramare_enable_italic = 1



" if (has("termguicolors"))

"  set termguicolors

" endif

" Also inside tmux Ctrl-a : to source ~/.tmux.conf


" }}}
" {{{ =============
"
"}}}
" {{{ FUNCTIONS

" $HOME/.vim/settings/functions/functions.vim                          

" }}}
" {{{ =============
"
"}}}
" {{{ MAPPINGS

" $HOME/.vim/settings/mappings/mappings.vim
" REM:
" <leader>pl plugins
" <leader>co config
" <leader>ma mappings
" <leader>fu functions

" }}}
" {{{ =============
"
"}}}
