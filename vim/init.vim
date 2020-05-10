"zRelflord Mininimum settings {{{
    "=== Min settings === 
	set nocompatible
	" set <esc>=jk " my inline comment in a set command
    :imap jk <Esc>
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
    " nnoremap <C-n> :exe 'set nu!' &nu ? 'rnu!' : ''
    set number relativenumber
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
	"=== folding ===
	set foldmethod=indent   " fold based on indent level
	set foldnestmax=10      " max 10 depth
	set foldenable          " don't fold files by default on open
	set foldlevelstart=1   " start with fold level of 1
	" }}}
    " Custom Movements {{{
    	"=== Custom Movements ===
	"navigation tips
        "H – Go to the first line of current screen.
        "M – Go to the middle line of current screen.
        "L – Go to the last line of current screen.
        "ctrl+f – Jump forward one full screen.
        "ctrl+b – Jump backwards one full screen
        "ctrl+d – Jump forward (down) a half screen
        "ctrl+u – Jump back (up) one half screen
	" move to beginning/end of line
	nnoremap B ^
	nnoremap E $
    "set the cursor to move down a single row on the screen
    nnoremap j gj
    nnoremap k gk
	" use ctrl-h/j/k/l to switch between splits
	map <c-j> <c-w>j
	map <c-k> <c-w>k
	map <c-l> <c-w>l
	map <c-h> <c-w>h
	" }}}
    " Pathogen {{{
	" === Pathogen ===
	" load Pathogen
	filetype off
	" execute pathogen#helptags()
	" execute pathogen#infect()
	syntax on
	filetype plugin indent on
	" }}}
    "
    " start neovim additions
    "
    " Plug {{{
    "
    " Plug
    " the Plug plugin manager
    call plug#begin()
    " tpopes plugins
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary' " e.g. gc<motion> gdj <-- toggles
    Plug 'tpope/vim-surround' " e.g. to surround with {} use yssB. see :h surround
    Plug 'tpope/vim-vividchalk'  "colorscheme 
     " airline-powerline prompt
    Plug 'vim-airline/vim-airline'
    " colorschemes
    "
    Plug 'mhartington/oceanic-next' " https://github.com/mhartington/oceanic-next < OceanicNext
    Plug 'https://github.com/tomasr/molokai.git'
    Plug 'https://github.com/endel/vim-github-colorscheme.git'
    " many colors
    Plug 'https://github.com/upsuper/vim-colorschemes.git'
    call plug#end()
    " 
	filetype off
	syntax on
	filetype plugin indent on
    
    " }}}
    " 
    " end neovim additions
    "
    " Theme & Colors {{{
	" === Theme  & Colors ===
    " set t_Co=256
	" syntax enable
    " COLORSCHEMES
    " colorscheme vividchalk 
    " colorscheme OceanicNext
    colorscheme molokai
    " colorscheme colorschemes
    " colorscheme github
    " colorscheme elflord
    ""highlight Comment ctermbg=DarkGray
	" colors zazen
	" set background=light
        "to toggle them automatically for you:
     "   map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
	" }}}
    " Custom Leader {{{
	" === Custom Leader ===
	" set your own personal modifier key to something handy
	let mapleader="," 
	" use ,o to make a new vertical split, ,s for horiz, ,x to close a split
		" ,v calls up VISUAL mode
	" try ,o (as in OpEd) <-- works
	noremap <leader>o <c-w>v<c-w>l
	noremap <leader>s <c-w>s<c-w>j
	noremap <leader>x <c-w>c
	"  save file
	nnoremap <leader>s :w<cr>
	inoremap <leader>s <C-c>:w<cr>
	" quit file
	noremap <leader>q :q<cr>
	" use <leader>p to paste from system clipboard
	nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
    nnoremap <leader>y "+y
	"python
	autocmd Filetype python inoremap <leader>m if __name__ ==  "__main__":<enter>
    " }}}
    " Statusline {{{
    "=== Statusline ===
    set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
    :set laststatus=2 
    "}}}
    " vimrc folding {{{
    " === vimrc folding settings ===
    set foldmethod=marker
    set foldlevel=0
    set modelines=1
    "vim:foldmethod=marker:foldlevel=0
    "}}}
