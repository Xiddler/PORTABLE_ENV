"{{{ Preliminaries

" List of config files

" $MYVIMRC at $HOME/.vimrc
" $HOME/.vim/settings/configs/configs.vim
" $HOME/.vim/settings/functions/functions.vim
" $HOME/.vim/settings/mappings/mappings.vim
" $HOME/.vim/plugins/plugins.vim

" These are symlinked from PORTABLE_ENV/
"
"}}}
" {{{ Theme & Colors 

" colors folders:
" /usr/share/vim/vim91/colors
" $HOME/.vim/colors


" === Theme  & Colors ===
" to set a built-in colorscheme to, for example, inspect :digraphs which is " not good with 'iceberg'
" :colorscheme <TAB> eg evening

set termguicolors " but see below for TMUX config

syntax enable

" ***************** COLORSCHEME ***************************

" colorscheme stellarized from nightsense -- seems to be gone from github;  note added 2022-11-03  
"/home/donagh/PORTABLE_ENV/vim/dotvim/HELP/pack/nightsense/start/stellarised 
" theme at 2022-11-03
" colorscheme gruvbox
" colorscheme dracula  
" added 2022-11-04
" colorscheme iceberg   
"
" added 2023-12-26
" colorscheme everforest


" added 2023-12-26 - and my current preferred colorscheme
" colorscheme base16-default-dark
" changed 2024-08-22 - it shows italics & bold correctly (like everforest does)

colorscheme miramare
" NOTE: Now in ~/.vim/pack to keep it from changing — note added 2024-08-24
" colorscheme base16-atelier-cave
    
" NOTE: see Leader section for changing colorscheme in $HOME/.vim/settings/mappings/mappings.vim
" keybindings to change colorscheme
"
" nnoremap leader 0 :colorscheme base16-default-dark<CR>
" nnoremap leader 6 :colorscheme base16-greescreen<CR> 
" nnoremap leader 6 :colorscheme base16-default-dark<CR> 
" nnoremap leader 5 :colorscheme iceberg<CR>
" nnoremap leader 4 :colorscheme evening<CR>
" nnoremap leader 3 :colorscheme everforest<CR>
" nnoremap leader 2 :colorscheme snow<CR>

" ***************** END COLORSCHEME ***************************

" added 2024-07-03
" set bg&
" highlight clear Normal

" added 2022-11-04
" set background=dark


" NOTE: see Leader section below for changing background light/dary
"to toggle them automatically for you:
" noremap leader bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>


" to allow italics in vim 
" https://hobo.house/2017/07/17/using-italics-with-vim-in-your-terminal/
" highlight Comment cterm=italic

" }}}
" {{{ Vim config 

"===  vim config ===

" visual autocomplete for command menu
set wildmenu            

" allow  yanked text to be copied directly to the X11 system clipboard....not having to use the "+ register
" makes y, d, c, p use the system clipboard 
set clipboard=unnamedplus

" make Y copy from cursor position to end of line (like C, D)
nnoremap Y y$

" show comments in italics like this comment: Does terminal support this?, check with: 
" ->% echo -e '\e[3m is this italics? \e[23m'
highlight Comment cterm=italic

" Make bold and italic stand out better - testing
highlight htmlBold gui=bold guifg=#af0000 ctermfg=124
highlight htmlItalic gui=italic guifg=#ff8700 ctermfg=214

set updatetime=300 " reduce time for highlighting other references OPTIONAL - 2023-02-03
set redrawtime=10000 " allow more time for loading syntax on large files OPTIONAL - 2023-02-03


" older
" Enable CursorLine
" set cursorline
" Default Colors for CursorLine
" highlight  CursorLine ctermfg=white ctermbg=blue
" set cursorcolumn
" removes the unwanted highlight on underscores in markdown
" set hi link markdownError Normal " error with link?

" }}}
" {{{ Filetype
" plugin and ftplugin

" The plugin and ftplugin directories are the most important directories in your runtimepath for the purposes of this series—(we will use these directories for LaTeX-specific Vim configuration.)
" https://ejmastnak.com/tutorials/vim-latex/ftplugin/

filetype on
filetype plugin on
filetype indent on


" }}}
"{{{ Markdown


" turn off ERROR highlight at underscore in .md files 
" remove highlight to the _ in markdown (very annoying) (fixed - 2022-02-06 )
" :hi link markdownError normal  works in a live buffer but how to add to .vimrc?
" set markdown files to filetype markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead,BufEnter *.md :set conceallevel=2

" don't show markdown _ and * unless cursor on the line
autocmd Filetype markdown set conceallevel=2

autocmd Filetype markdown set filetype=markdown

autocmd FileType markdown setlocal foldmethod=marker

" remove errors on underscore i.e. _
autocmd Filetype markdown highlight link markdownError Normal

"
"
"
"}}}
"{{{ Dictionary
" === Dictionary ===

set dictionary=/run/media/donagh/USB128GB/REPOSITORIES/WORDS/Great_word_lists/TWL06_Scrabble_Word_List.txt
" alternative (450,000+ words)
" set dictionary=/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/WORDS/Great_word_lists/Word_lists/Linuxwords/linuxwords.1/dict

"}}}
" {{{ My digraphs & special characters
" NOTE: Some are set in Custom Leader in mappings.vim -- 
" see 
" 1. $HOME/.vim/settings/mappings/mappings.vim
" 2. ->% che vim.md
"
" ==== DIGRAPHS ===
" :digraphs   [ Note: my theme is not suitable for viewing the symbols ]
" the 'iceberg' theme makes the symbols difficult to see. Instead, change the colorscheme - for example:
" :colorscheme evening


" Ctrl-K in insert mode
" PR ▶  
" PL ◀  
" Eu € 
" co ℅
" <spc>0 °   degrees
"
" Special Characters
" To insert a SC, in INSERT mode press Ctrl-V (or Ctrl-Q in, say Windows) and
" insert the Unicode. Ex: for the SP `❯` In INSERT mode, Ctrl-Q then u276f
" for ❯ alias a> 


" inoremap ,a to ❯ (the pure-prompt symbol)
" NOTE: see line 138 in Custom Leader for editing this or search (the pure-prompt symbol)
" inoremap leader a  <C-Q>u276f

 

 

"}}}
" {{{ Searching 
"=== Searching ===

set incsearch 
set ignorecase                  " Make searches case-insensitive.
set smartcase
set grepprg=/usr/sbin/rg        " use ripgrep instead of default grep

" set very magic for searching (i.e. no need to escape brackets and other special chars)
nnoremap / /\v
vnoremap / /\v

" Remember last location in file " does slow up the opening of a file though -  added 2022-10-15
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
end
" Hint: use g, and g; 
" The last change is held in the mark named . so you can jump to the mark with `. (backtick, dot) or '. (apostrophe, dot). See:
" :help mark-motions
" :help '.




" keep search centered
nnoremap n nzzzv
nnoremap N Nzzzv
" issue with vim lag 2024-12-17 see ISSUES:vim issue in zim-wiki — commenting out the below
nnoremap J mzJ`z



" }}}
" {{{ Scrolling 
" === Scrolling ===
" stops cursor going to very top and keeps some context when mouse scrolling 
set scrolloff=8
set sidescrolloff=8

" }}}
" {{{ Folding 

"=== Folding ===

set foldmethod=marker

" https://dougblack.io/words/a-good-vimrc.html#fold 
" does not include markdown folding to enable headings to be visible with let g:markdown_folding = 1

" set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open


" set foldlevelstart=1   " start with fold level of 1
" set foldcolumn=4 
" set foldlevel=0 

set modelines=1

" The following line shows the intro screen with grey background and blue font - reads kinda easy?
highlight Folded guibg=black guifg=#6a6d6a

" Other options:
" highlight Folded guibg=grey guifg=blue
" highlight Folded guibg=black guifg=grey
" highlight Folded guibg=black guifg=#3e3f3e
" highlight FoldColumn guibg=darkgrey guifg=white

" to match z; in emacs where zo doesn't (seem to) work for some reason. ie toggle fold open/close 
nmap z; za
nmap <tab> za



" }}}
"{{{ Buffers & Tabs 

" === Buffers ===

" TABS
" Use (UPPERCASE) H and L to move to the previous/next tabpage & tab & tabs and next tab and previous tab: downside is you lose H and L defaults
nnoremap H gT 
nnoremap L gt

" NOTE: In the following I have commented out mappings that require an initial 'b' in normal
" mode as it increased the latency of the b navigation command to an unacceptable degree
" also applies to other navigation letters like k, w, h, j, l

" :bn (buffer next) without pressing enter button to make it like doom-emacs setting
cnoremap bn :bn<cr> 
" nnoremap bn :bn<cr>
" nnoremap nb :bn<cr>

" :bp (buffer previous) without pressing enter button to make it like doom-emacs setting
cnoremap bp :bp<cr> 
" nnoremap bp :bp<cr>
" nnoremap pb :bp<cr>

" Similar to my doom-emacs kill buffer
cmap bk :wq<cr>
"kill buffer i.e. save and quite
" nnoremap kb :wq<cr> 

" shortcut for the sudo trick - when you need to be sudo to save a file but you entered vim without being sudo 
cmap w!! w !sudo tee % 


" list buffers - ready for a buffer number 
nnoremap gb :ls<cr>:b<space>

" #################################################################

" the following being set means that filetype.vim is read at startup which sets autocmds for almost all filetypes under the sun.
if has("autocmd")
  filetype plugin indent on
endif

" to reduce the noticeable delay on performing certain commands
" set timeout timeoutlen=3000 ttimeoutlen=100
" set completeopt=menu,preview,longest "for a pop-up list of completions. (Replaces the existing one)

" DONAGH

" --- LINE NUMBERS ---

set number
set relativenumber " also Ctrl N to toggle this ; <leader> r

" toggle number and realativenumber
" NOTE: See Leader section below
" nnoremap leader r  :exe 'set nu!' &nu ? 'rnu!' : ''
" nnoremap <C-n> :exe 'set nu!' &nu ? 'rnu!' : ''


" Cursor
set virtualedit=all " allows cursor to be moved anywhere in normal mode
set noswapfile " prevents the automatic creation of swapfiles
set hidden    " allows switching buffers without saving

" set list!
" set listchars=tab:>\ ,trail:.
" The following from https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character#1675752
" dots instead of blanks 
set listchars=tab:⇤–⇥,space:·,trail:·,precedes:⇠,extends:⇢,nbsp:×
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣


" Wrapping lines 
set wrap
set wrapmargin=5 " set wm=5 
set linebreak " prevents wrapping in the middle of a word 
" set nolist    " adds a . to empty spaces; do I need this? "set list will show the dots for spaces and tabs
" set textwidth=0 " set textwidth=80 for a hard wrap 


" usage: see $VIMRUNTIME/docs/fzf.txt :FZF and :h fzf
set rtp+=/usr/share/vim/vim91

" --- NETRW STUFF ---
" file browser
let g:netrw_banner = 0          " don't show the banner at the top of the :Vex window, it looks cleaner
let g:netrw_browse_split = 3    " open selected files in a new tab
let g:netrw_liststyle = 3
let g:netrw_winsize = 30


" set previewpopup=height:10,width:60
" set mouse+=a " copy lines without line numbers - can cause side issues

" ---  Goyo --- for zen mode read/write 

" Goyo & limelight toggle together - see gh for instructions to change this
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Toggle goyo & limelight
map <F9> :Goyo <cr>
nnoremap <space>g<space> :Goyo <cr>

" use emmet for html and css only
let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" }}}
"{{{ Skeleton files

" === Skeleton files ===

" These provide templating for new files in  ~/.vim/vim_templates/skeleton.
" eg opening a new file in the terminal with ->% vim newfile.py will provide the new file with python-suitable matter
augroup skeletons
    au!
    autocmd BufNewFile *.* silent! execute '0r ~/.vim/vim_templates/skeleton.'.expand("<afile>:e")
augroup END

" turn off numbers in the file ~/a.txt — for use with regexes etc. —  2025-06-25
" in zsh_aliases the alias is vima which opens the file ~/a.txt without numbers
" autocmd BufNewFile,BufFilePre,BufRead /home/donagh/a.txt silent! set nonu norelativenumber
autocmd BufNewFile,BufFilePre,BufRead *.txt silent! set nonu norelativenumber

" }}} 
" {{{ Spaces And Tabs  
"=== Spaces And Tabs ===

set tabstop=4       " tabs are at proper location 
set shiftwidth=4    " indenting is 4 spaces
set smarttab
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set smartindent     " does the right thing (mostly) in programs


" }}}
"{{{ Latex

"=== latex ===

"vim-latex plugin
let g:tex_flavor='latex'
"
"
"}}}
" LSP {{{
" Language Server Protocol 
" Alternatively use neovim 

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
		\   'name': 'Rust Language Server',
		\   'cmd': {server_info->['rust-analyzer']},
		\   'whitelist': ['rust'],
		\ })
endif
