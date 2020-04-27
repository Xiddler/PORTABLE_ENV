    " Mininimum settings {{{
	"=== Min settings === 
	set nocompatible
    if has("autocmd")
      filetype plugin indent on
    endif
	set <esc>=jk "" my inline comment in a set command
    set number
	set relativenumber
    set virtualedit=all
	"}}}
    " Spaces And Tabs {{{ 
	"=== Spaces And Tabs ===
	set tabstop=4
	set shiftwidth=4
	set smarttab
	set softtabstop=4   " number of spaces in tab when editing
	set expandtab       " tabs are spaces
	" }}}
    " UI Config {{{
	"===  UI Config ===
	" Enter command line mode using spacebar
	nnoremap <space> :
	set wildmenu            " visual autocomplete for command menu
	"allow  yanked text to be copied to the X11 system clipboard....
	set clipboard=unnamedplus
	" turn off highlight at underscore in .md files 
	" :syn clear markdownError
	hi link markdownError normal
    " toggle number and realativenumber
    nnoremap <C-n> :exe 'set nu!' &nu ? 'rnu!' : ''
    " Enable CursorLine
    " set cursorline
    " Default Colors for CursorLine
    " highlight  CursorLine ctermfg=white ctermbg=blue
    " set cursorcolumn
	" }}}
    " Searching {{{
	"=== Searching ===
	set incsearch 
	set ignorecase            " Make searches case-insensitive.
    set smartcase
	" }}}
    " Folding {{{
    " https://dougblack.io/words/a-good-vimrc.html#fold
	"=== folding ===
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
	nnoremap E $
    "set the cursor to move down a single row on the screen
    nnoremap j gj
    nnoremap k gk
    " Use H and L to move to the previous/next tabpage & tab & tabs and next
    " tab and previous tab
    nnoremap H gT
    nnoremap L gt
	" splits - use ctrl-h/j/k/l to switch between splits
	map <c-j> <c-w>j
	map <c-k> <c-w>k
	map <c-l> <c-w>l
	map <c-h> <c-w>h
	" }}}
    " Packpath {{{
    " This is for using the package manager that utilises the folder
    " $HOME/.vim/pack
	" === packpath ===
	" load packpath
	filetype off
    packloadall
	" execute pathogen#helptags()
	" execute pathogen#infect()
	syntax on
	filetype plugin on
	" filetype plugin indent on
	" }}}
    " Theme & Colors {{{
	" === Theme  & Colors ===
    set termguicolors
	syntax enable
	colorscheme stellarized
	set background=dark
        "to toggle them automatically for you:
        map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
    " to allow italics in vim
    highlight Comment cterm=italic
	" }}}
   " Custom Leader {{{
	" === Custom Leader ===
	" set your own personal modifier key to something handy
	let mapleader="," 
	" use ,o to make a new vertical split, ,s for horiz, ,x to close a split
		" ,v calls up VISUAL mode
	" try ,o (as in OpEd) <-- works
    " splits - to make a new split & quit split
	noremap <leader>o <c-w>v<c-w>l
	noremap <leader>h <c-w>s<c-w>j
	noremap <leader>x <c-w>c
	"  save file
	nnoremap <leader>s :w<cr>
	inoremap <leader>s <C-c>:w<cr>
	" quit file
	noremap <leader>q :q<cr>
	" use <leader>p to paste from system clipboard
	nnoremap <leader>p :set paste<cr>"+p :set nopaste<cr>
	" use <leader>f to call up ranger file manager
	let g:ranger_map_keys = 0
	map <leader>f :Ranger<cr>
	"python
	autocmd Filetype python inoremap <leader>m if __name__ ==  "__main__":<enter>
    " }}}
    " Statusline {{{
    "=== Statusline ===
    " NOTE: relpaced by airline pluging (similar to Powerline in zsh)
    " set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
    " :set laststatus=2 
    "}}}
    " Vimrc Folding {{{
    " === vimrc folding settings ===
    set foldmethod=marker
    set foldlevel=0
    set modelines=1
    "vim:foldmethod=marker:foldlevel=0
    "}}}
   " Preferred Plugins {{{
   " "=== Preferred Plugins === 
   " Rundown of good plugins available at https://catonmat.net/vim-plugins
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
   " theme
   " nightsense
   " https://github.com/nightsense/stellarized.git
   "
   " airline - powerline for vim
   " https://github.com/vim-airline/vim-airline.git
   "
   " masukomi
   " vim-markdown-folding
   " https://github.com/masukomi/vim-markdown-folding.git
   "
   " mattn
   " emmet-vim
   " https://github.com/mattn/emmet-vim.git
   "
   "multicursor
   "https://github.com/terryma/vim-multiple-cursors
   "
   "Voom
   "sudo pamac install vim-voom
   "}}}
   " Customised {{{
   " "=== Customised === 
   " Add header to .py file when starting a .py file
   au bufnewfile *.py 0r /home/donagh/PORTABLE_ENV/vim_headers/py_header.temp

   " for the vim-notes plugin. ~/.vim/misc/notes/user
    " adds .txt suffix to new notes
    :let g:notes_directories = ['/home/donagh/PORTABLE_ENV/Notes', '/home/donagh/.vim/misc/notes/user']
    :let g:notes_suffix = '.txt'
    " Splits - change default position of new splits
    set splitbelow splitright
    " open a terminal in vim
    " map <leader>tt :new terminal://bash<CR>
    "Swap vertical split to hor
    map <leader>th <C-w>t<C-w>H
    map <leader>tk <C-w>t<C-w>K


   "}}}
