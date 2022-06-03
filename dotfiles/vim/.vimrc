"{{{ Minimum Settings
" === Min settings === 
" filepath: /home/donagh/PORTABLE_ENV/dotfiles/vim/.vimrc
"
" cf. /usr/share/vim/vim82/defaults.vim
" 'set nocompatible' is never necessary in a vimrc file. When Vim detects a user vimrc file, it automatically sets nocompatible. 
" set backspace=start,eol,indent " no longer needed
" a minimal .vimrc --> /home/donagh/PORTABLE_ENV/vim/vimrc_files/minimal_vimrc
"
"
set <esc>=jk 
" use spacebar to enter command mode. This matches doom-emacs for me
nnoremap <space> :
set encoding=utf-8

" STOW 
" As of 2022-03-19 I am using stow to manage the symlinking of my dotfiles.
" See $HOME/PORTABLE_ENV/dotfiles/README.md 
" Usage: On a new install -> %~ stow vim 

" PLUGINS 
" external sub-vimrc files for plugins, specifically  vim-plug using Plug
source /home/donagh/PORTABLE_ENV/vim/vimrc_files/plugins.vim " rem: i can use gf to open that file!

" BUFFERS
" :bn (buffer next) without pressing enter button to make it like doom-emacs setting
cnoremap bn :bn<cr> 
nnoremap bn :bn<cr>
" emacs kill buffer
cmap bk :wq<cr>

" function to create a new scratch buffer
function! Scratch()
    split noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    "setlocal nobuflisted
    "lcd ~
    file scratch
endfunction
" open a doom-like scratch buffer
cmap bx :call Scratch()<cr> 
"
" list buffers - ready for a buffer number 
nnoremap gb :ls<cr>:b<space>

if has("autocmd")
" the following being set means that filetype.vim is read at startup which sets autocmds for almost all filetypes under the sun.
  filetype plugin indent on
endif
" to reduce the noticeable delay on performing certain commands
set timeout timeoutlen=3000 ttimeoutlen=100
set completeopt=menu,preview,longest "for a pop-up list of completions. (Replaces the existing one)

" NUMBERS
set number
set relativenumber " also Ctrl N to toggle this
" toggle number and realativenumber
nnoremap <C-n> :exe 'set nu!' &nu ? 'rnu!' : ''
" nnoremap <leader>n :exe 'set nu!' &nu ? 'rnu!' : ''            " <leader>n set to number a list

" MACROS
"This mapping makes macros even easier to remember: hit qq to record, q to stop recording, and Q to apply.
nnoremap Q @@
vnoremap Q :norm @q<cr>
set virtualedit=all " allows cursor to be moved anywhere in normal mode
" set textwidth=0
set wrapmargin=5
set noswapfile " prevents the automatic creation of swapfiles
set hidden    " allows switching buffers without saving
set listchars=tab:>\ ,trail:.
set nolist    " adds a . to empty spaces; do I need this? "set list will show the dots for spaces and tabs

" FZF
" :FZF 
" set the following to get fuzzy-finder FZF in vim working (and other plugins?)
nmap <leader>z :FZF<cr> 

" usage: see $VIMRUNTIME/docs/fzf.txt :FZF and :h fzf
set rtp+=/usr/share/vim/vim82
" netrw stuff - file browser
let g:netrw_banner = 0          " don't show the banner at the top of the :Vex window, it looks cleaner
let g:netrw_browse_split = 3    " open selected files in a new tab
let g:netrw_liststyle = 3
let g:netrw_winsize = 30
" shortcut to open a :Vex on the right only 20% width of screen
nnoremap <leader>e :lefta 30vs. <cr>
" set previewpopup=height:10,width:60
" set mouse+=a " copy lines without line numbers - can cause side issues

" create numbered list: visual select lines then ,1
" vnoremap <leader>1 :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR>j
" create dash (see below)
" [count]:call Bullet_dash()

" Goyo & limelight toggle together - see gh for instructions to change this
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Toggle goyo & limelight
map <F9> :Goyo <cr>
nnoremap <leader>gy :Goyo <cr>
" use emmet for html and css only
let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" setting custom leader to comma
" let mapleader="," 
" }}}
" Spaces And Tabs {{{ 
"=== Spaces And Tabs ===
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" set wm=30         " wrap text before too far to the right
" }}}
" UI Config {{{
"===  UI Config ===
set wildmenu            " visual autocomplete for command menu
"allow  yanked text to be copied directly to the X11 system clipboard....not
" having to use the "+ register
set clipboard=unnamedplus
" make Y copy from cursor position to end of line (like C, D)
nnoremap Y y$

" MARKDOWN FILES
" turn off ERROR highlight at underscore in .md files 
" remove highlight to the _ in markdown (very annoying) (fixed - 2022-02-06 )
" :hi link markdownError normal  works in a live buffer but how to add to .vimrc?
" set markdown files to filetype markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd Filetype markdown set filetype=markdown
" remove errors on underscore i.e. _
autocmd Filetype markdown highlight link markdownError Normal
" don't show markdown _ and * unless cursor on the line
autocmd Filetype markdown set conceallevel=2
autocmd BufNewFile,BufRead,BufEnter *.md :set conceallevel=2
"


" Enable CursorLine
" set cursorline
" Default Colors for CursorLine
" highlight  CursorLine ctermfg=white ctermbg=blue
" set cursorcolumn
" removes the unwanted highlight on underscores in markdown
" set hi link markdownError Normal " error with link?
" }}}
" Searching {{{
"=== Searching ===
set incsearch 
set ignorecase                  " Make searches case-insensitive.
set smartcase
set grepprg=/usr/sbin/rg        " use ripgrep instead of default grep

" set very magic for searching (i.e. no need to escape brackets and other special chars)
nnoremap / /\v
vnoremap / /\v
" }}}
" Folding {{{
" https://dougblack.io/words/a-good-vimrc.html#fold 
"=== folding ===
" does not include markdown folding to enable headings to be visible with let g:markdown_folding = 1
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=1   " start with fold level of 1
" }}}
" Custom Movements {{{
    "=== Custom Movements ===
"navigation tips
"    H – Go to the first line of current screen. But see noremaps below.
"    M – Go to the middle line of current screen. 
"    L – Go to the last line of current screen. But see noremaps below.
"    ctrl+F – Jump forward one full screen.
"    ctrl+B – Jump backwards one full screen
"    ctrl+D – Jump forward (down) a half screen
"    ctrl+U – Jump back (up) one half screen
" move to beginning B /end E of line
nnoremap B ^
" go to the next full stop even if it's on the next line (experimental)
" nnoremap E f. " seems to be problematic
nnoremap E $
"set the cursor to move down a single row on the screen instead of full sentence. 
nnoremap j gj
nnoremap k gk

" TABS
" Use (UPPERCASE) H and L to move to the previous/next tabpage & tab & tabs and next tab and previous tab: downside is you lose H and L defaults
" nnoremap H gT
" nnoremap L gt
" Save to be the same as my doom-emacs keybindings [SPC] w [SPC]
" (REM: This works because SPACEBAR is mapped to : above and cmap puts vim into Ex mode )
cmap w<space> :w<cr>
" even shorter journey to s
cmap s<space> :w<cr>

" open a file in a new tab
map gf :tabe <cfile><cr>
" rem: gT and gt to navigate through tabs
" test gf with: /run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/TESTING/afile.md
"
" EXITS
" write/quit with :ww and :xx (which are keybindings that work for me in doom-emacs)
cmap ww :wq<cr>
cmap xx :q!<cr>
"
"}}}
" Packages using Packpath {{{
" SUPERSEDED BY VIM.PLUG (see below Enable / Disable Plugins)
" This is for using the package manager that utilises the folder
" $HOME/.vim/pack - introduced by me in 2019
" see "=== Preferred Plugins === below for my list of usually installed plugins
" === packpath ===
" WHICH OF THESE DO I NEED
" load packpath
filetype off
packloadall
syntax on
filetype plugin on
" filetype plugin indent on
" }}}
" Theme & Colors {{{
" === Theme  & Colors ===
set termguicolors
syntax enable
" colorscheme stellarized
colorscheme gruvbox
set background=dark
"to toggle them automatically for you:
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" to allow italics in vim
highlight Comment cterm=italic

" }}}
" {{{Vim True Color support
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific

"Neovim and recent Vim support true color terminal out of the box with just a single configuration option. No workarounds anymore. Just add

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"
"
"
" }}}
" Custom Leader {{{
" === Custom Leader ===
" setting custom leader to comma
let mapleader=','

" See also Customised below
" use ,o to make a new vertical split, ,s for horiz, ,x to close a split
" ,v calls up VISUAL mode
" try ,o (as in OpEd) <-- works
"
" SPLITS
" splits - to make a new split & quit split -  ,vf and ,hv to go to file
" noremap <leader>o <c-w>v<c-w>l
" open Vertical split
noremap <leader>v <c-w>v<c-w>l
" open Horizontal split
noremap <leader>h <c-w>s<c-w>j
" close window
noremap <leader>x <c-w>c
" in splits - use ctrl-h/j/k/l to switch focus between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" move bullet point lines up / down
nmap <c-j> ddp
nmap <c-k> ddkkp
" insert @dm -
nmap mm 0i@dm -<left><right><right>

" noremap <leader>j <c-w>
"  save file
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
" quit file
noremap <leader>q :q<cr>
" use <leader>p to paste from system clipboard
nnoremap <leader>p :set paste<cr>"+p :set nopaste<cr>
" use <leader>y to yank to system clipboard
nnoremap <leader>y "+y
" use <leader>f to call up ranger file manager
let g:ranger_map_keys = 0
map <leader>f :Ranger<cr>
" handy goto start of line and down one line " ;; conflicts with 'next f/w/' etc.
" nnoremap <leader><leader> ^


" shorten the filepath for REPOSITORIES
" @r  <-- macro
"python
"shortcut for if __name__  = ,m
" autocmd Filetype python inoremap <leader>n if __name__ ==  "__main__":<enter>
" remove trailing whitespace from python files
" autocmd BufWritePre .py :%s/\s\+$//e
"
" SKELETON FILES

" Command for skeleton files from .vim/templates
augroup skeletons
    au!
    autocmd BufNewFile *.* silent! execute '0r ~/.vim/vim_templates/skeleton.'.expand("<afile>:e")
augroup END

" inefficient ways of doing skeleton files
" autocmd BufNewFile  *.py      0r ~/.vim/vim_templates/skeleton.py
" autocmd BufNewFile  *.html      0r ~/.vim/vim_templates/skeleton.html
" autocmd BufNewFile  *.md      0r ~/.vim/vim_templates/skeleton.md

" skeleton files
" augroup skeletons
  " au!
  " autocmd BufNewFile *.py silent! execute '0r /home/donagh/PORTABLE_ENV/vim/dotvim/vim_templates/skeleton.'.expand("<afile>:e")
  " autocmd BufNewFile *.py silent! execute '0r /home/donagh/PORTABLE_ENV/vim/dotvim/vim_templates/skeleton.py
  " autocmd BufNewFile *.py silent! execute '0r ~/.vim/vim_templates/skeleton.py
" augroup END                               

"
" open the file under the cursor in a new window (split)
nnoremap <leader>vf :vertical wincmd f<CR>
nnoremap <leader>hf :below wincmd f<CR>
" set width of Explorer window to 60 smaller
nnoremap <leader>ws <C-w>60<
" nav the command mode - up and down for previous commands
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-h> <Left>
cmap <C-l> <Right>
" open $MYVIMRC in a new tab Note: in CLI the shortcut is vv.
noremap <leader>vv :tabe $MYVIMRC<CR>

" source $MYVIMRC
nnoremap <Leader>r :so $MYVIMRC<CR>

"
" EASYMOTION
" easymotion keybindings - for fast navigation within a file
" get , , w to make easy motion work
map <Leader><Leader>w <Plug>(easymotion-prefix)
" highlight ALL words for navigating to
map <leader>/ <Plug>(easymotion-bd-w) 
nmap <leader>/ <Plug>(easymotion-overwin-w) 

"PWD
" insert full filepath into current buffer in normal mode
nnoremap <leader>d :put=expand('%:p')<cr>

" enter the pwd in insert mode - d irectory p ath
inoremap <leader>dp <C-R>=getcwd()<CR>
"To insert the absolute path of the directory the file is in use:
inoremap <Leader>d <C-R>=expand("%:p:h")<CR>
" To insert the name of the innermost directory (the one containing the current file) use:
" inoremap <Leader>n <C-R>=expand("%:p:h:t")<CR>

" }}}
" Airline {{{
"
"=== Status line ===
" set laststatus=2 "2 is for always show status line; 0 for never and 1 for when there are two windows
" NOTE: built in is replaced by airline plugin (similar to Powerline in zsh)
"
" AIRLINE
"https://github.com/vim-airline/vim-airline and :h airline
" config file at:  ??? It is configured here no?
"
" show other buffers in the status airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#whitespace#enabled = 1

" Show just the filename instead of the full path/name
" let g:airline#extensions#tabline#fnamemod = '%:t'
let g:airline_section_c = '%t'
" problem
" column numbers are not showing fully / properly - how to fix this?
" they are hidden behind the last section
" configuration is here: /home/donagh/PORTABLE_ENV/vim/dotvim/plugins/vim-airline/autoload/airline/init.vim
"
" Airline Theme
let g:airline_theme='tomorrow'
"
" Problem; the count for the column numbers is not showing: How to fix this?
" let g:airline_section_z = '%f'
" try this. It works, good enough
" default file at /home/donagh/PORTABLE_ENV/vim/dotvim/plugins/vim-airline/autoload/airline/init.vim
" let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'colnr', 'linenr', ':%3v']) 

" airline fonts
" set guifont=Liberation\ Mono\ for\ Powerline\ 10 
set guifont="Source Code Pro for Powerline 10"
let g:airline_powerline_fonts = 1
" note:  /usr/share/fonts/OTF/PowerlineSymbols.otf: PowerlineSymbols:style=Medium
"
" if powerline font symbols are partially messed up
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" powerline symbols
" cf. https://tuckerchapman.com/2020/09/15/getting-started-vim-airline/


"}}}
" Vimrc Folding {{{
" === vimrc folding settings ===
set foldmethod=marker
set foldlevel=0
set modelines=1
" set foldcolumn=4 
" highlight Folded guibg=grey guifg=blue
highlight Folded guibg=black guifg=grey
" highlight FoldColumn guibg=darkgrey guifg=white
"
""vim:foldmethod=marker:foldlevel=0
"}}}
"{{{ Latex
"=== Latex ===
"vim-latex plugin
let g:tex_flavor='latex'
"
"
"}}}
" Customised {{{
"
" "=== Customised === 
" Add header to .py file when starting a .py file
" augroup templates
  " au!
  " read in template files
  " autocmd BufNewFile *.py silent! execute '0r $HOME/PORTABLE_ENV/vim/py_header.temp'
" augroup END 

" join up line with line below
nmap ,e g0jI<backspace> <esc>jg0

"we are the "best of all

" abbreviations
ab mys "Proactively engaged in making a better life for myself and/or others"







" for the vim-notes plugin. ~/.vim/misc/notes/user
" adds .txt suffix to new notes
:let g:notes_directories = ['/home/donagh/PORTABLE_ENV/Notes', '/home/donagh/.vim/misc/notes/user']
:let g:notes_suffix = '.txt'

" Splits - change default position of new splits
set splitbelow splitright
"
" open a terminal within vim
map <leader>tt :terminal zsh<CR>

" open today's markdown journal in a new tab
nmap <leader>mj :tabe /home/donagh/DONAGHS/personal/journal/$(date +%Y)/$(date +%m)/$(date +%d)-$(date +%m).md<cr>
" /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/2022/02/03-02.md
" nmap <leader>mj :!mj<CR>
" same for work journal
" nmap <leader>wj :!wj<CR>
"
"Swap vertical split to hor
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K
" Capitalize/minusculize letter under cursor
nnoremap <leader>u v~
" MY FUNCTIONS - sample function
function! Simple()
echom "Running simple function"
endfunction
" nnoremap <C-l>, :call Simple()<CR> " this works
command Simple call Simple()

" LISTS 
" make dash bullet points 
function! BulletList()
    let lineno = line(".") " set the current line number to the variable 'lineno'
    call setline(lineno, "- " . getline(lineno)) " replace the line with the line itself prepended with '- '
endfunction

" this is very slow compared to calling directly without the mapping. Why so?
nmap <leader>b :call BulletList()<cr> 

" Donaghs version
" function! Bullet_dash()
   " execute 'normal!'.'0i- \<Esc>j'
" endfunction

" make numbered list - first Visually select the lines then ,y. Note: The
" numbers above 9 will not be right aligned. So use the following function.
vnoremap <leader>n :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR> 

" numbered list but RIGHT aligned higher than no. 9
function! NumberList() range
" set line numbers in front of lines - added 2022-02-12
    let beginning = line("'<")
    let ending = line("'>")
    let difsize = ending-beginning +1
    let pre = ''
    while (beginning <= ending)
        if match(difsize, '^9*$') == 0
            let pre = pre . ' '
        endif
        call setline(ending, pre . difsize . "\t" . getline(ending))
        let ending=ending-1
        let difsize=difsize-1
    endwhile
endfunction


" SHORTEN SD64 filepath
function! Neat_DONAGH()
    " Nd = Neaten_donagh i.e. shorten the long filepath using ~
    s:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/:\~/DONAGHS/:
endfunction
command Nd call Neat_DONAGH()

function! Neat_REPOS()
    " Nr = Neaten_repos i.e. shorten the long filepath using ~
    s:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/:\~/REPOS/:
endfunction
command Nr call Neat_REPOS()

" function to open my journal for today in a new tab from vim (mj is the command I use in the shell)
function! Myjournal()
    let year = strftime('%Y')
    let month = strftime('%m')
    let day = strftime('%d')
    let path = '/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/'.year.'/'.month
    let filen =  path.'/'.day.'-'.month.'.md'

    execute ":tabe ".filen
endfunction 

" open today's markdown journal in a new tab in vim
nmap mj :call Myjournal()<cr>


" function to open my work journal in a new tab from vim (wj is the command I use in the shell)
function! WorkJournal()
    let path = '/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/means/'
    let filen =  path.'work_journal.md'
    execute ":tabe ".filen
endfunction 

" open today's markdown journal in a new tab in vim      
nmap wj :call WorkJournal()<cr>


" $MYVIMRC
let $RC="$HOME/.vimrc" " alternative to $MYVIMRC

"}}}
" Keybindings collected {{{
" Normal Mode
" nmap ee 0A �kD��aj0 " @e :: join lower line to upper line which is short

" K             :: get vim help for the item under the cursor
" gf            :: open a new tab for the file under the cursor
" ,vv           :: open .vimrc
" ,tt           :: open a terminal in vim
" mj            :: open today's markdown journal in a new tab
" qq            :: to record 
" q             :: to stop recording
" Q             :: to run
" ,e            :: open a file search buffer on the left
" gy            :: Goyo
" Y             :: y$
" <C-n>         :: toggle number and realativenumber
" ,1            :: ?? to make numbered list - keybinding not working?

" Command Mode
" ,z            :: FZF
" }}}
" Enable / Disable Plugins {{{
" === Enable / Disable Plugins ===
" MOVED TO /home/donagh/PORTABLE_ENV/vim/dotvim/vimrc_dirs/plugins.vim. This file is source earlier in this file.
" 2022-02-05  vim-plug started
" https://github.com/junegunn/vim-plug and https://github.com/junegunn/vim-plug/wiki/tutorial
" Remember to :so % after adding a new Plug
"call plug#begin('/home/donagh/.vim/vimrc_dirs')
" Plug 'tpope/vim-commentary'
" Plug 'https://github.com/vim-airline/vim-airline.git'
" Plug 'nightsense/stellarized'              
" cp -r ~/.vim/plugins/stellarized ~/.vim/pack/nightsense/start/      :: this seems to be necessary
" Plug 'francoiscabrol/ranger.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'https://github.com/junegunn/goyo.vim.git'
" Plug 'https://github.com/junegunn/limelight.vim.git'
" next one shows a buffer to the right on "
" Plug 'junegunn/vim-peekaboo'
" Markdown plugins
" With none of these enabled ##'s are salmon-coloured - but no folding
"
" Check if this displays headings - yes but loses coloured # as in vim-mardown-folding 
" Plug 'plasticboy/vim-markdown'
" The following plugin (vim-markdown) includes Syntax Concealing - use :set conceallevel=2
" Plug 'https://github.com/preservim/vim-markdown'                        
" the following hides the heading in markdown files - a problem (is this why plasticboy is better?) - <-- use :set foldignore=#
" Plug 'masukomi/vim-markdown-folding'
"
"call plug#end()
"
" }}}
" Preferred Plugins {{{
" NOTE: These are now managed using vim.plug (see above Enable / Disable Plugins)

" "=== Preferred Plugins === 
" added vim-plug to manage plugins
" cd ~/.vim
" autoload  pack  plugins  spell
" autoload contains plug.vim
" pack/nightsense/start/stellarized
" plugins - this is the location for Plug to place other plugins
"
" OLD - OLD - OLD - OLD - OLD - OLD - OLD - OLD  
" donaghm [16:50 Tue 20/04] [~/.vim] 
" -> % tree -L 2
" .
" └── ~/.vim/pack/start   (symlinked from PORTABLE_ENV)
    " 1  ├── vim-surround
    " 2  ├── vim-commentary
    " 3  ├── ranger
    " 4  ├── nightsense (theme)
    " 5  ├── vim-airline
    " 6  ├── vim-markdown-folding - masukomi
    " 7  ├── vim-markdown - plasticboy
    " 8  ├── vim-pencil
    " 9  ├── emmet-vim
    " 10 ├── vim-multiple-cursors
    " 11 ├── vim-voom
    " 12 ├── vim-superman
    " 13 ├── peekaboo
    " 14 ├── easymotion
    " 15 ├── vim-elixir
    " 16 ├── vim-floaterm
    " 17 ├── vim-floaterm
    " 18 ├── janet-vim
    " 19 ├── goyo.vim
    " 20 └── limelight.vim
    " 21 └── vim-orgmode
    " 22 └── speeddating
    "
   " Note: Rundown of good plugins available at https://catonmat.net/vim-plugins
   " --- My Preferred Plugins ---  
   " tpope
   " https://github.com/tpope/vim-surround.git  
   " https://github.com/tpope/vim-commentary.git  
   "
   " francoiscabrol
   " https://github.com/francoiscabrol/ranger.vim.git
   " vim-ranger
   " map <leader>f :Ranger<CR>
   "
   " theme - nightsensee 
   " .vim/pack/nightsense/start
   " https://github.com/nightsense/stellarized.git
   "
   " airline - powerline for vim
   " https://github.com/vim-airline/vim-airline.git
   "
   " .vim/pack/
   " masukomi
   " vim-markdown-folding
   " https://github.com/masukomi/vim-markdown-folding.git
   "
   " md-folding
   " .vim/pack/vim-markdown/start/vim-markdown
   " git clone https://github.com/plasticboy/vim-markdown.git
   "
   "
   " vim-pencil
   " pure typing / writing experience for vim text files - kills default vim
   " multiline for j, k etc.
   " git clone https://github.com/reedes/vim-pencil
   "
   "
   " mattn
   " emmet-vim
   " use <C-y>, ! to have basic html:5 skeleton template
   " https://github.com/mattn/emmet-vim.git
   "
   " multicursor
   " https://github.com/terryma/vim-multiple-cursors
   "
   " Voom
   " sudo pamac install vim-voom
   "
   " SuperMan
   " Man pages in vim editor: vman <app>
   " https://github.com/jez/vim-superman
   "
   " peekaboo
   " let's you see the regs e.g. a side buffer pops up when you press " 
   " https://github.com/junegunn/vim-peekaboo
   "
   " easymotion - <leader>/ will highlight file with letters everywhere
   " using ,/ to move to highlighted letter
   " https://github.com/easymotion/vim-easymotion.git
   "
   " vim-elixir
   " elixir plugin for vim
   " https://github.com/elixir-editors/vim-elixir
   "
   " floaterm
   " a floating terminal - not installed
   " https://github.com/voldikss/vim-floaterm
   "
   " janet.vim
   " plugin for janet syntax in vim
   " https://github.com/janet-lang/janet.vim.git
   "
   " Goyo
   " Make vim environment distraction free
   " https://github.com/junegunn/goyo.vim.git
   "
   " Limelight
   " Highlight only the active paragraph
   " https://github.com/junegunn/limelight.vim.git
   "
   " vim-orgmode
   " (prefers also to include speedating from tpope)
   " open .org files in vim
   " guide at /home/donaghm/PORTABLE_ENV/vim/dotvim/pack/vim-orgmode/start/vim-orgmode/doc/orgguide.txt
   "  https://github.com/jceb/vim-orgmode
   "
   " speedating
   " manages the - in dates like 2021-11-28 when opening say .org files
   "  https://github.com/tpope/vim-speeddating.git
   "
   "}}}
   " Runtimepath and path {{{
   " :set runtimepath?
let $RTP=split(&runtimepath, ',')[0] " allows :set rtp?
   "RUNTIMEPATH
   "  runtimepath=~/.vim,~/.vim/plugins/vim-commentary,~/.vim/plugins/stellarized,~/.vim/plugins/vim-airline,~/.vim/plugins/ranger.vim,~/.vim/plugins/vim-easymotion,~/.vim/plugins/goyo.vim,~/.vim/plugins/limelight.vim,~/.vim/plugins/vim-markdown-folding,~/.vim/pack/nightsense/start/stellarized,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,~/.vim/plugins/vim-markdown-folding/after,~/.vim/after
   "
    " Path
    " :set path? path to search when using find / FZF 
set path+=~/REPOS/

" }}}
