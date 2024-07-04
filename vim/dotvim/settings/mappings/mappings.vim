"{{{ Preliminaries

" List of config files

" $MYVIMRC at $HOME/.vimrc
" $HOME/.vim/settings/configs/configs.vim
" $HOME/.vim/settings/functions/functions.vim
" $HOME/.vim/settings/mappings/mappings.vim
" $HOME/.vim/plugins/plugins.vim

" These are symlinked from PORTABLE_ENV/

"}}}
"{{{ Leader_key
" === Leader ===

" setting custom leader to comma. Needs to be set early!
let mapleader=','
"}}}
"{{{  Leader_key + non-alphabetic
"{{{{ Del leading blanks Leader_key @

"<leader>@ to delete leading blanks
" go to start of line and delete all blanks to the first word/ text i.e. shift text to start of line where it does not begin at col 0
nnoremap <leader>@ 0:s/^\s*//g<cr>

"}}}}
"{{{{ Del trailing blanks Leader_key $

"<leader>$ to delete blanks trailing blanks
"at end of a line (like <leader>@ to delete leading blanks
nnoremap <leader>$ :s/\s*$//<cr>

"}}}}
"{{{{ EASYMOTION PLUGIN Leader_key /
" Use , / to highlight point in file. easymotion keybindings - for fast navigation within a file
map <leader>/ <Plug>(easymotion-bd-w) 
nmap <leader>/ <Plug>(easymotion-overwin-w) 
" --- END_EASYMOTION --- 
"}}}}
"{{{{ SURROUNDING eg Leader_key "
" <leader>" to surround a word with "word"
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

"<leader>' surround a word with 'word'
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"<leader>_ to surround a word with _word_ (Single Underline) hence ,su
nnoremap <leader>su viw<esc>a_<esc>bi_<esc>lel

" surround a word with __word__ (Double Underline) hence ,du
nnoremap <leader>du viw<esc>a__<esc>bi__<esc>lel

" --- END_SURROUNDING ---
"}}}}
"}}}
"{{{ Leader_key + single alphabetic

"<leader>a to produce ❯ <-- the pure-prompt symbol
inoremap <leader>a  <C-Q>u276f

"<leader>b to insert bullets 
" this is very slow compared to calling directly without the mapping. Why so?
nmap <leader>b :call BulletList()<cr> 

"<leader>c to imap insert a prefix for comments by me           INSERT MODE
inoremap <leader>c @dm - 

"<leader>c to nmap dc 0i@dm -<left><right><space>               NORMAL MODE
nnoremap <leader>c 0i@dm -<left><right><space>

"<leader>d to insert full filepath into current buffer in normal mode
" nnoremap <leader>d :put=expand('%:p')<cr>
" INSERT MODE
inoremap <leader>d <C-R>=expand("%:p:h")<CR>                    
" NORMAL MODE
nnoremap <leader>d :call Filename()<cr>


" Toggle/Open a file explorer to the right 
" nnoremap <leader>e :Lex!<cr> " NOTE ,e is now mapped to change colorscheme below. I use ranger for navigating <leader>f

" use <leader>f to call up ranger file manager
let g:ranger_map_keys = 0
noremap <leader>f :Ranger<cr>

" combine :ls and :bn to open / navigate buffers
" https://stackoverflow.com/questions/53664/how-to-effectively-work-with-multiple-files-in-vim
nnoremap <leader>k :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>

"<leader>p to paste from system clipboard
nnoremap <leader>p :set paste<cr> "+p :set nopaste<cr>

"<leader>q to quit file
noremap <leader>q :q<cr>

"<leader>r to toggle line numbeRs
nnoremap <leader>r  :exe 'set nu!' &nu ? 'rnu!' : ''
nnoremap <C-n> :exe 'set nu!' &nu ? 'rnu!' : ''

"<leader>s to save file
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

"<leader>t to toggle word case  (Why so slow 4seconds lol)
nmap <leader>t g~aW

"<leader>u to Capitalize/minusculize letter under cursor
nnoremap <leader>u v~

"<leader>y to yank to system clipboard 
nnoremap <leader>y "+y

"<leader>x to close split (the one with cursor in it) COPY - SEE SPLITS BELOW
noremap <leader>x <c-w>c<cr>

" --- FZF ---
" :FZF 
"<leader>z to set the following to get fuzzy-finder FZF in vim working (and other plugins?)
nmap <leader>z :FZF<cr> 

"}}}
"{{{ Leader_key + multiple alphabetic
 
" VIM CONFIG FILES
" mappings for opening plugins files
nnoremap <leader>pl :tabe $HOME/.vim/plugins/plugins.vim<cr>

" mappings for opening configs files
nnoremap <leader>co :tabe $HOME/.vim/settings/configs/configs.vim<cr>

" mappings for opening mappings files
nnoremap <leader>ma :tabe $HOME/.vim/settings/mappings/mappings.vim<cr>

" mappings for opening mappings files
nnoremap <leader>fu :tabe $HOME/.vim/settings/functions/functions.vim<cr>


" vim-mundo " https://simnalamburt.github.io/vim-mundo/ ; shows the vim undo tree
" nnoremap <leader>uu :MundoToggle<CR>

"<leader>vv to open $HOME/.vimrc in a new tab
nnoremap <leader>vv :tabe $MYVIMRC<CR>

" source $MYVIMRC - I can't ever seem to remember the keybinding...
nnoremap <leader>ss :so $MYVIMRC<CR>
" nnoremap <leader>sv :so $MYVIMRC<CR>
" nnoremap <leader>sm :so $MYVIMRC<CR>


" calls the function ToggleSlash — see Functions in $HOME/.vim/settings/functions/functions.vim
noremap <silent> <leader>ts :ToggleSlash<CR>
" C:\donald\duck\micky\mouse

" open a terminal within vim
map <leader>tt :terminal zsh<CR>

" ===== SPLIT_WINDOW ===== 

" See SPLITS below for switching focus between splits

"<leader>vs to Split Vertical alt = " noremap <leader>v <c-w>v<c-w>l
noremap <leader>vs :vsplit<cr>

"<leader>hs to Split Horizontal  alt = " noremap <leader>h <c-w>s<c-w>j
noremap <leader>hs :split<cr>

"<leader>x to close split (the one with cursor in it)
" noremap leader x <c-w>c<cr>

"<leader>th & tk to swap vertical split to hor
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

"END_SPLIT_WINDOW

"<leader>vz and vza to open .zshrc / .zsh_aliases in a new tab in vim
nnoremap <leader>vza :tabe ~/.zsh_aliases <cr>
nnoremap <leader>vz :tabe ~/.zshrc <cr>

" set width of Explorer window to 60 smaller
" nnoremap <leader>ws <C-w>60<
"}}}
"{{{ Leader_key for colorschemes

"<leader>bg to toggle color darkness/lightness automatically 
map <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" keybindings to change colorscheme
nnoremap <leader>7 :colorscheme base16-greenscreen<CR> 
nnoremap <leader>6 :colorscheme base16-default-dark<CR> 
nnoremap <leader>5 :colorscheme iceberg<CR>
nnoremap <leader>4 :colorscheme evening<CR>
nnoremap <leader>3 :colorscheme everforest<CR>
nnoremap <leader>2 :colorscheme snow<CR>
nnoremap <leader>1 :colorscheme Oldlace<CR>
"}}}
"{{{ Leader_key for bullet numbering

" Note: see also :call NumberList() in functions [ use <leader>fu to enter that file ]
"<leader>n VISUAL for inserting bullet numbers
vnoremap <leader>n :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR> 
vnoremap <leader>nl :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR>  

"<leader>nr to remove line numbers - first Visually select the lines
vnoremap <leader>nr :s/^\(\d\)\{1,2\}\. // <CR>

"}}}
" {{{ My mappings


" --- Ex mode navigation ---
" nav within the command mode - up and down for previous commands — avoids having to stretch for the arrow keys
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-h> <Left>
cmap <C-l> <Right>


" --- MACROS --- 
"This mapping makes macros even easier to remember: hit qq to record, q to stop recording, and Q to apply.
" Replay the last used macro
nnoremap Q @@
" vnoremap Q :norm @q<cr>

" open a file in a new tab
nnoremap gf :tabe <cfile><cr>
" rem: gT and gt to navigate through tabs

" }}}
"{{{ Splits 

" see  SPLIT_WINDOW above for <leader> keys for splits

" NOTE: See Leader section in mappings.vim for shortcuts

" Split Vertical alt = " noremap leader v <c-w>v<c-w>l
" noremap leader vs :vsplit<cr>
" Split Horizontal  alt = " noremap leader h <c-w>s<c-w>j
" noremap leader hs :split<cr>
" close split (with cursor in it)
" noremap leader x <c-w>c<cr>

" in splits - use ctrl-h/j/k/l to switch focus between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


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


" SAVES

" Save to be the same as my doom-emacs keybindings [SPC] w [SPC]
" (REM: This works because SPACEBAR is mapped to : above and cmap puts vim into Ex mode )
cmap w<space> :w<cr>
" even shorter journey to s
cmap s<space> :w<cr>

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
