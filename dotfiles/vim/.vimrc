"{{{ Minimum Settings

" filepath: /home/donagh/PORTABLE_ENV/dotfiles/vim/.vimrc

" === Min settings === 
" cf. /usr/share/vim/vim82/defaults.vim 
" 'set nocompatible' is never necessary in a vimrc file. When Vim detects a user vimrc file, it automatically sets nocompatible. 
" set backspace=start,eol,indent  no longer needed

" My minimal .vimrc location 
" I have a minimal .vimrc available --> /home/donagh/PORTABLE_ENV/vim/vimrc_files/minimal_vimrc
" vvim <afile> is an alias on Toshiba for this — no folding, no plugins, horrible!

"inoremap jk <esc>
set <esc>=jk 


" use spacebar to enter command mode. This matches doom-emacs for me and my muscle memory
nnoremap <space> :

set encoding=utf-8
" set fileencoding=utf-8
"
" Better COPY & PASTE
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Remember more commands and search history
set history=500
set undolevels=500


"}}}
"{{{ GNU Stow 

" === GNU Stow === 

" As of 2022-03-19 I am using stow to manage the symlinking of my dotfiles.
" See $HOME/PORTABLE_ENV/dotfiles/README.md 
" Usage: On a new install -> %~ stow vim  will automatically create the necessary symlinks from this folder 
" }}}
" {{{ Custom Leader 

" === Custom Leader ===
" NOTE: <leader> may appear in other sections too

" setting custom leader to comma. Needs to be set early!
let mapleader=','

" See also Customised below
" use ,o to make a new vertical split, ,s for horiz, ,x to close a split
" ,v calls up VISUAL mode
" try ,o (as in OpEd) <-- works

" move bullet point lines up / down
" nmap <c-j> ddp - used for navigating between splits
" nmap <c-k> ddkkp


"  save file
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" quit file
noremap <leader>q :q<cr>

" use <leader>p to paste from system clipboard
nnoremap <leader>p :set paste<cr> "+p :set nopaste<cr>

" use <leader>y to yank to system clipboard 
nnoremap <leader>y "+y

" use <leader>f to call up ranger file manager
let g:ranger_map_keys = 0
noremap <leader>f :Ranger<cr>

" handy goto start of line and down one line ;; conflicts with 'next f/w/' etc.
" nnoremap <leader><leader> ^


" shorten the filepath for REPOSITORIES
" @r  <-- macro
"python
"shortcut for if __name__  = ,m
" autocmd Filetype python inoremap <leader>n if __name__ ==  '__main__':<enter>
" remove trailing whitespace from python files
" autocmd BufWritePre .py :%s/\s\+$//e
"
" nav within the command mode - up and down for previous commands
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-h> <Left>
cmap <C-l> <Right>


" --- EASYMOTION PLUGIN --- 
" easymotion keybindings - for fast navigation within a file
" get , , w to make easy motion work
" map <Leader><Leader>w <Plug>(easymotion-prefix)
" highlight ALL words for navigating to
" Use , / to highlight point in file
map <leader>/ <Plug>(easymotion-bd-w) 
nmap <leader>/ <Plug>(easymotion-overwin-w) 

" --- PWD ---
"  See Functions <leader>d [ note added 2023-02-10 ]

" insert full filepath into current buffer in normal mode
" nnoremap <leader>d :put=expand('%:p')<cr>

"To insert the absolute path of the directory the file is in use:
inoremap <leader>d <C-R>=expand("%:p:h")<CR>
" To insert the name of the innermost directory (the one containing the current file) use:
" inoremap <Leader>n <C-R>=expand("%:p:h:t")<CR>

" toggle case - Why so slow 4seconds lol 
nmap <leader>t g~aW
" dUck
"
" to open journal.org for access to snippets
" nmap <leader>n :!jumpapp emacs<cr>

" surround a word with "word"
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" surround a word with 'word'
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel


" surround a word with _word_
nnoremap <leader>_ viw<esc>a_<esc>bi_<esc>lel

" use — (Mdash i.e. digraph -M) instead of - (normal dash) " this prevents making lines into a bullet list
inoremap lh —

" map ,a to ❯ (the pure-prompt symbol)
inoremap <leader>a  <C-Q>u276f

nnoremap <leader>; 0:s/^\s*//g<cr>
 
 


" }}}
"{{{ MYVIMRC 

" ===  $MYVIMRC ===

let $RC="$HOME/.vimrc" " alternative to $MYVIMRC

" open $MYVIMRC in a new tab Note: in CLI the alias is also vv  
" nnoremap <leader>vv :tabe $MYVIMRC<CR> - this seems to invoke visual
" mode...sometimes doesn't work
" map <leader>vv :tabe $MYVIMRC<CR>
" nnoremap omv :tabe $MYVIMRC<CR>  Open My Vimrc
nnoremap <leader>vv :tabe $MYVIMRC<CR>

" source $MYVIMRC - I can't seem to remember the keybinding...
nnoremap <leader>ss :so $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>sm :so $MYVIMRC<CR>



"}}}
" {{{ Plugins
" === Plugins ===
"
" 2022-02-05  Plugin manager: vim-plug started 
" https://github.com/junegunn/vim-plug and https://github.com/junegunn/vim-plug/wiki/tutorial
" Run this command to installl vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
source /home/donagh/PORTABLE_ENV/vim/plugins/plugins.vim 

" Rem: Use gf to open that file! CHANGED LOCATION ON 2022-10-13 

" vim-mundo " https://simnalamburt.github.io/vim-mundo/ ; shows the vim undo tree
nnoremap <leader>uu :MundoToggle<CR>

"}}}
" {{{ Navigating
" === Navigating ===

" Toggle/Open a file explorer to the right 
" nnoremap <leader>e :Lex!<cr> " NOTE ,e mapped to change colorscheme below
" :bd<enter> to close it!
"
nnoremap <leader>vza :tabe ~/.zsh_aliases <cr>
nnoremap <leader>vz :tabe ~/.zshrc <cr>

" configure Vim to open a file at the last edited location

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                     \ exe "normal! g`\"" | endif

" }}}
" {{{ Lorem ipsum
"
ab lorem "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."

" also Plugin :LoremIpsum
" }}}
"{{{ Buffers & Tabs 

" === Buffers ===

" TABS
" Use (UPPERCASE) H and L to move to the previous/next tabpage & tab & tabs and next tab and previous tab: downside is you lose H and L defaults
nnoremap H gT 
nnoremap L gt


" :bn (buffer next) without pressing enter button to make it like doom-emacs setting
cnoremap bn :bn<cr> 
nnoremap bn :bn<cr>

" :bp (buffer previours) without pressing enter button to make it like doom-emacs setting
cnoremap bp :bp<cr> 
nnoremap bp :bp<cr>

" Similar to my doom-emacs kill buffer
cmap bk :wq<cr>

" shortcut for the sudo trick - when you need to be sudo to save a file but you entered vim without being sudo 
cmap w!! w !sudo tee % 

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

" list buffers - ready for a buffer number 
nnoremap gb :ls<cr>:b<space>

" the following being set means that filetype.vim is read at startup which sets autocmds for almost all filetypes under the sun.
if has("autocmd")
  filetype plugin indent on
endif

" to reduce the noticeable delay on performing certain commands
" set timeout timeoutlen=3000 ttimeoutlen=100
" set completeopt=menu,preview,longest "for a pop-up list of completions. (Replaces the existing one)

" DoNAGH
" --- NUMBERS ---
set number
set relativenumber " also Ctrl N to toggle this
" toggle number and realativenumber
nnoremap <C-n> :exe 'set nu!' &nu ? 'rnu!' : ''

" --- MACROS --- 
"This mapping makes macros even easier to remember: hit qq to record, q to stop recording, and Q to apply.
nnoremap Q @@
vnoremap Q :norm @q<cr>

" Cursor
set virtualedit=all " allows cursor to be moved anywhere in normal mode
set noswapfile " prevents the automatic creation of swapfiles
set hidden    " allows switching buffers without saving

" dots instead of blanks?
" set list
" set listchars=tab:>\ ,trail:.


" Wrapping lines 
set wrap
set wrapmargin=5 " set wm=5 
set linebreak " prevents wrapping in the middle of a word 
" set nolist    " adds a . to empty spaces; do I need this? "set list will show the dots for spaces and tabs
" set textwidth=0 " set textwidth=80 for a hard wrap 

" --- FZF ---
" :FZF 
" set the following to get fuzzy-finder FZF in vim working (and other plugins?)
nmap <leader>z :FZF<cr> 

" usage: see $VIMRUNTIME/docs/fzf.txt :FZF and :h fzf
set rtp+=/usr/share/vim/vim82

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
augroup skeletons
    au!
    autocmd BufNewFile *.* silent! execute '0r ~/.vim/vim_templates/skeleton.'.expand("<afile>:e")
augroup END

" }}} 
"{{{ Splits 

"  === Splits === 

" Open new split panes to right and bottom, which feels more natural than Vim's default
set splitbelow
set splitright

" Split Vertical alt = " noremap <leader>v <c-w>v<c-w>l
noremap <leader>vs :vsplit<cr>
" Split Horizontal  alt = " noremap <leader>h <c-w>s<c-w>j
noremap <leader>hs :split<cr>
" close split (with cursor in it)
noremap <leader>x <c-w>c<cr>

" in splits - use ctrl-h/j/k/l to switch focus between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" older?
" shortcut to open a :Vex on the right only 20% width of screen
" nnoremap <leader>e :lefta 30vs. <cr>
" set width of Explorer window to 60 smaller
" nnoremap <leader>ws <C-w>60<

"}}}
" {{{ Spaces And Tabs  
"=== Spaces And Tabs ===

set tabstop=4       " tabs are at proper location 
set shiftwidth=4    " indenting is 4 spaces
set smarttab
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set smartindent     " does the right thing (mostly) in programs


" }}}
" {{{ UI Config 

"===  UI Config ===

set wildmenu            " visual autocomplete for command menu
" allow  yanked text to be copied directly to the X11 system clipboard....not having to use the "+ register
" makes y, d, c, p use the system clipboard 
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


" show italics
highlight Comment cterm=italic

" Make bold and italic stand out better - tesging
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

" does this work?
autocmd FileType markdown setlocal foldmethod=marker
" set foldlevelstart=1   " start with fold level of 1
" set foldcolumn=4 
" set foldlevel=0 
set modelines=1
highlight Folded guibg=grey guifg=blue
" highlight Folded guibg=black guifg=grey
" highlight FoldColumn guibg=darkgrey guifg=white


" to match z; in emacs where zo doesn't (seem to) work for some reason. ie toggle fold open/close 
nmap z; za


" }}}
" {{{ Theme & Colors 

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
colorscheme base16-default-dark
    
" keybindings to change colorscheme
nnoremap <leader>6 :colorscheme base16-default-dark<CR> 
nnoremap <leader>g :colorscheme iceberg<CR>
nnoremap <leader>e :colorscheme evening<CR>
nnoremap <leader>v :colorscheme everforest<CR>

" ***************** END COLORSCHEME ***************************

" added 2022-11-04
set background=dark
"to toggle them automatically for you:
map <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" to allow italics in vim 
" https://hobo.house/2017/07/17/using-italics-with-vim-in-your-terminal/
highlight Comment cterm=italic

" }}}
" {{{ Vim True Color support

" === Vim True Color support ===

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

" }}}
" {{{ Airline status line 

"=== Airline status line ===

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

" airline fonts
" set guifont=Liberation\ Mono\ for\ Powerline\ 10 
set guifont="Source Code Pro for Powerline 10"
" the separator used on the left side
  " let g:airline_left_sep='>'

" the separator used on the right side
  " let g:airline_right_sep='<'

" to automatically populate the g:airline_symbols dictionary with the powerline symbols.
" let g:airline_powerline_fonts = 1
" note:  /usr/share/fonts/OTF/PowerlineSymbols.otf: PowerlineSymbols:style=Medium 
"  If you want to use plain ascii symbols, set this variable:
  " let g:airline_symbols_ascii = 1

" disable whitespace annoyance added 2022-11-15
let g:airline#extensions#whitespace#enabled = 0

" if powerline font symbols are partially messed up
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" powerline symbols
" cf. https://tuckerchapman.com/2020/09/15/getting-started-vim-airline/

" To have the column number 'colnr' showing in the statusline I put it in front of the line no. linenr 
" (copied  from /home/donagh/PORTABLE_ENV/vim/plugins/vim-airline/autoload/airline/init.vim) 
" if !exists('g:airline_section_z')
   " if airline#util#winwidth() > 79
     " let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%p%%', 'colnr', 'linenr', 'maxlinenr'])
   " endif
" endif



"}}}
"{{{ Functions 

" === Functions === 

" - sample function
function! Simple()
echom "Running simple function"
endfunction
" nnoremap <C-l>, :call Simple()<CR> " this works
command Simple call Simple()

" --- Lists --- 
"

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

" make numbered list - first Visually select the lines
" Note: The numbers above 9 will not be right aligned. So use the following function.
" n for number
vnoremap <leader>n :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR> 
vnoremap <leader>nl :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR>  

" remove line numbers - first Visually select the lines
vnoremap <leader>nr :s/^\(\d\)\{1,2\}\. // <CR>

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
command NL call NumberList()

" --- SHORTEN SD64 filepath after pasting into vim ---
function! Neat_DONAGH()
    " Nd = Neaten_donagh i.e. shorten the long filepath using ~
    " s:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/:\~/DONAGHS/:
    s:/run/media/donagh/USB128GB/DONAGHS/:\~/DONAGHS/:
endfunction
command Nd call Neat_DONAGH()

function! Neat_REPOS()
    " Nr = Neaten_repos i.e. shorten the long filepath using ~
    s:/run/media/donagh/USB128GB/REPOSITORIES/:\~/REPOS/:
endfunction
command Nr call Neat_REPOS()

" function to open my journal for today in a new tab from vim (mj is the command I use in the shell)
function! Myjournal()
    let year = strftime('%Y')
    let month = strftime('%m')
    let day = strftime('%d')
    " let path = '/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/'.year.'/'.month
    let path = '/run/media/donagh/USB128GB/DONAGHS/personal/journal/'.year.'/'.month
    let filen =  path.'/'.day.'-'.month.'.md'

    execute ":tabe ".filen
endfunction 

" edit / open today's journal - my journal 
nmap mj :!$HOME/.scripts/markdown_journal.sh <cr> 


" function to open my work journal in a new tab from vim (wj is the command I use in the shell)
function! WorkJournal()
    let path = '/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/means/'
    let filen =  path.'work_journal.md'
    execute ":tabe ".filen
endfunction 

" open today's markdown journal in a new tab in vim; NOT CURRENTLY USED; 
" nmap wj :call WorkJournal()<cr>

" from https://blog.langworth.com/vim3 - finesse on Goyo 
" also makes autocompletion pull words from the thesaurus and dictionary when I hit Tab 
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  " set bg=light
  set bg=dark
  if !has('gui_running')
    " let g:solarized_termcolors=256
    let g:gruvbox_termcolors=256
  endif
  " colors solarized
  colors gruvbox
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" put shortened filename/path in the buffer
function! Filename()
    put=expand('%:p')
    " s:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/:\~/DONAGHS/:
endfunction

nmap <leader>d :call Filename()<cr>

"====================================================
" to Ur_Journal.md 
"====================================================
"
"2023-02-17 

" I want to select some text in a file, then copy it to Ur_Journal.md but also prepend today's date

" Maybe a vim script to automate extracting selections of a vim file esp. my journal where ideas are arrived at but forgotten
 
" Select with v and copy to "* register [ Note: it does not appear in the copyq dropdown - for some reason ]
" Then in a vim terminal (,tt) run -> % send_hunk
" NOTE: send_hunk is an alias of /home/donagh/.scripts/hunk_to_ur_journal.sh
"nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
    " i <C-R>=strftime("%A::%Y-%m-%d %a %I:%M %p")<CR><Esc>


"====================================================
" to Ur_Journal.md 
"====================================================
" 2023

function SendHunk()
    
    " how to replace hooey with timestamp? ie how to do the following in a function▶  i <C-R>=strftime("%Y-%m-%d")
    " doom-emacs does this very well with org-capture <SPC> n n j to journal with timestamp
    "
    " :call writefile(split("hoooey"), '/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/5_Ur_Journal.md', "a")
    " this does not work 
    " :r! date --date="today"
    
    " append the contents of @r into Ur_journal - THIS WORKED!
    :call writefile(split(getreg('r'), '\n'), '/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/5_Ur_Journal.md', "a")

    " this does not work 
    " i ---------------------<Esc>
    
    " this also worked 
   " :redir! >> /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/5_Ur_Journal.md | silent echon @r | redir END
endfunction

nmap <leader>j :call SendHunk()<cr>
 
" end UR_JOURNAL====================================================

" Toggle slashes using ,t
" a command and a mapping to easily toggle slashes in the current line, or a range of lines.
" https://vim.fandom.com/wiki/Change_between_backslash_and_forward_slash

function! ToggleSlash(independent) range
  let from = ''
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let first = matchstr(line, '[/\\]')
    if !empty(first)
      if a:independent || empty(from)
        let from = first
      endif
      let opposite = (from == '/' ? '\' : '/')
      call setline(lnum, substitute(line, from, opposite, 'g'))
    endif
  endfor
endfunction
command! -bang -range ToggleSlash <line1>,<line2>call ToggleSlash(<bang>1)
noremap <silent> <leader>ts :ToggleSlash<CR>

" try it: C:\Users\don_l\Applications

   
"}}}
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
" }}}
" Customised {{{

"=== Customised === 

" Add header to .py file when starting a .py file
" augroup templates
  " au!
  " read in template files
  " autocmd BufNewFile *.py silent! execute '0r $HOME/PORTABLE_ENV/vim/py_header.temp'
" augroup END 

" join up line with line below 
" nmap ,e g0jI<backspace> <esc>jg0 " Vim's J already does this! 


" Abbreviations

" insert @dm - Note: dc for donagh comments
" nmap dc 0i@dm -<left><right><space>
nnoremap <leader>c 0i@dm -<left><right><space>

nnoremap <leader>m ^d0
inoremap <leader>c @dm - 
" while using the MacAir I have these abbreviations
" I have found the way to do it on the MacAir inside System Settings
inoremap i<space> I<space>
" inoremap dont don't
" inoremap cant can't
inoremap iiv I've
inoremap iid I'd
inoremap £ # 
inoremap wiht with
inoremap taht that
inoremap dont don't
inoremap didnt didn't
inoremap wont won't
inoremap cant can't
inoremap ie<space> i.e. 

" when mistyping ot instead of the word to  - but this causes long delays...
" espanso wouldn't work 
" inoremap <space>ot<space> to
" inoremap gto<space> got
" inoremap nto<space> not
inoremap hte the

" Timestamps
" inoremap 
" inoremap qq <C-R>=strftime("%Y-%m-%d")<CR>
" inoremap aq <C-R>=strftime("%Y-%m-%d_%H:%M")<CR>
"


" nnoremap dms 0i@DMSaying -<left><right><right>
" inoremap dms @DMSaying -<left><right><right> 

" need to be in insert mode for these then press <CR> or <SPC> to instigate 
ab mys "Proactively engaged in making a better life for myself and/or others"
ab FP 'Full Picture' 
abb dtw - Donagh the Wise
ab lorem "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
ab FQHB Fully Qualified Human Being 

ab tbp The Big Picture


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
" nmap <leader>mj :tabe /home/donagh/DONAGHS/personal/journal/$(date +%Y)/$(date +%m)/$(date +%d)-$(date +%m).md<cr>
" open yesterday's markdown journal in a new tab
" nmap <leader>my :tabe /home/donagh/DONAGHS/personal/journal/$(date +%Y)/$(date +%m)/$(date +%d-1)-$(date +%m).md<cr>
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

" Open a file with the appropriate application - in the background 
" relative path
" nnoremap gX :silent :execute "!xdg-open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>
" what about absolute path ?  the folllowing doesn't work 
" nnoremap gX :silent :execute "!xdg-open" expand('%:p') . "/" . expand("<cfile>") " &"<cr>


" use gf to open a file even if it does not exist yet
map gf :edit <cfile><cr>


- " combine :ls and :bn to open / navigate buffers
" https://stackoverflow.com/questions/53664/how-to-effectively-work-with-multiple-files-in-vim
nnoremap <leader>k :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>

"}}} 
" {{{ My Digraphs & Special Characters
" NOTE: Some are set in Custom Leader
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
" inoremap <leader>a  <C-Q>u276f

 

 

"}}}
"{{{ Spelling 
" === Spelling ===

set dictionary=/run/media/donagh/USB128GB/REPOSITORIES/WORDS/Great_word_lists/TWL06_Scrabble_Word_List.txt
" alternative (450,000+ words)
" set dictionary=/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/WORDS/Great_word_lists/Word_lists/Linuxwords/linuxwords.1/dict

"}}}
" {{{ Custom Movements 

"=== Custom Movements ===

"navigation tips
"    H Ã¢ÂÂ Go to the first line of current screen. But see noremaps below.
"    M Ã¢ÂÂ Go to the middle line of current screen. 
"    L Ã¢ÂÂ Go to the last line of current screen. But see noremaps below.
"    ctrl+F Ã¢ÂÂ Jump forward one full screen.
"    ctrl+B Ã¢ÂÂ Jump backwards one full screen
"    ctrl+D Ã¢ÂÂ Jump forward (down) a half screen
"    ctrl+U Ã¢ÂÂ Jump back (up) one half screen
" move to beginning B /end E of line
nnoremap B ^
" go to the next full stop even if it's on the next line (experimental)
" nnoremap E f. " seems to be problematic
nnoremap E $
"set the cursor to move down a single row on the screen instead of full sentence. 
nnoremap j gj
nnoremap k gk


" save 
" /home/donagh/.vimrc
"
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
" {{{ Keybindings collected 

" === Keybindings collected === 

" Normal Mode
" nmap ee 0A ÂkDÂÃ½aj0 " @e :: join lower line to upper line which is short

" K             :: get vim help for the item under the cursor
" gf            :: open a new tab for the file under the cursor
" ,vv           :: open .vimrc
" ,tt           :: open a terminal in vim
" mj            :: open today's markdown journal in a new tab
" wj            :: open today's work journal in a new tab
" qq            :: to record 
" q             :: to stop recording
" Q             :: to run
" ,e            :: open a file search buffer on the left
" gy            :: Goyo
" Y             :: y$
" <C-n>         :: toggle number and realativenumber
" ,1            :: ?? to make numbered list - keybinding not working?
" ,ss           :: :source $MYVIMRC 

" Command Mode
" ,z            :: FZF

" }}}
" {{{ Runtimepath and path 

" === Runtimepath and path ===

" to find runtimepaths use :set <enter> 
"RUNTIMEPATH 
" runtimepath=~/.vim,~/.vim/plugins/vim-commentary,~/.vim/plugins/stellarized,~/.vim/plugins/vim-airline,~/.vim/plugins/ranger.vim,~/.vim/plugins/vim-easymotion,~/.vim/plugins/goyo.vim,~/.vim/plugins/limelight.vim,~/.vim/plugins/vim-markdown-folding,~/.vim/pack/nightsense/start/stellarized,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,~/.vim/plugins/vim-markdown-folding/after,~/.vim/after
   
" :set runtimepath?
let $RTP=split(&runtimepath, ',')[0] " allows :set rtp?

" Path
" :set path? path to search when using find / FZF 
set path+=~/REPOS/

" $VIMRUNTIME 
" /usr/share/vim/vim90 

" }}}
