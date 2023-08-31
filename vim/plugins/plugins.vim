" Filepath  /home/donagh/PORTABLE_ENV/vim/vimrc_files/plugins.vim 
" /home/donagh/PORTABLE_ENV/vim/plugins/plugins.vim
"

" This file is where I call the plugins I want to use in vim. There is a line in .vimrc that calls this file
" I am using the vim-plug plugin manager from https://github.com/junegunn/vim-plug 
" .vimrc --> ~/.vim/plugins
" vim starts -->  ~/.vim/autoload/plug.vim 

" Enable / Disable Plugins {{{
" === Enable / Disable Plugins ===
" 2022-02-13 Created this new - external - sub-vimrc file 
" 2022-02-05  vim-plug started 
" https://github.com/junegunn/vim-plug and https://github.com/junegunn/vim-plug/wiki/tutorial
" Remember to :so % after adding a new Plug or just PlugInstall in any vim file


call plug#begin('/home/donagh/PORTABLE_ENV/vim/plugins')


" ____________   THEMES _______________________________

" Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'vim-airline/vim-airline' 
Plug 'https://github.com/vim-airline/vim-airline-themes.git' 
"
" for the following plugin, -> %cp -r ~/.vim/plugins/stellarized ~/.vim/pack/nightsense/start/      :: this seems to be necessary
" nightsense seems gone from github Note added 2022-11-03  Plug 'nightsense/stellarized'              
" 
" gruvbox - added 2022-04-02. For a change.
" Plug 'https://github.com/morhetz/gruvbox.git'
"
" dracula - added 2022-11-04 (to get nicer markdown style - hate the yellow)
" https://github.com/dracula/dracula-theme.git
" Plug 'https://github.com/dracula/vim.git'

" iceberg - added 2022-11-04
Plug 'https://github.com/cocopon/iceberg.vim.git'

" ____________   END THEMES _______________________________

" ------------  Plugins -----------------------------------

" commentary i.e. gcc  etc. 
Plug 'tpope/vim-commentary' " quick comment / uncomment plugin

" ranger
Plug 'francoiscabrol/ranger.vim' " call the ranger file manager from vim

" easymotion
Plug 'easymotion/vim-easymotion' " Use ./ to highlight search pairs 

" peekaboo
" the following plugin displays a buffer to the right on typing this  " <-- yes the quote symbol!
Plug 'junegunn/vim-peekaboo'

" Plug 'zaid/vim-rec'  Plug 'https://github.com/zaid/vim-rec'  for rec-files 
"
" Plug 'tpope/vim-abolish'  Plug 'https://github.com/tpope/vim-abolish.git' - added 2022-09-02
Plug 'https://github.com/tpope/vim-abolish.git' "  added 2022-09-02 < create hundreds of corrections my fingers refuse to learn > 

" FZF 
Plug 'https://github.com/junegunn/fzf.git' " added 2022-10-27 fuzzy search :FZF 
 

" LoremIpsum
Plug 'https://github.com/vim-scripts/loremipsum' " added 2022-09-15 Usage: :Loremipsum 55 will output 55 latin words 

" ____________   UI  _______________________________
Plug 'https://github.com/junegunn/goyo.vim.git' " Nice zen mode 
Plug 'https://github.com/junegunn/limelight.vim.git' " Darkens non-focussed areas 
Plug 'godlygeek/tabular'  " for aligning text


" ____________   MARKDOWN   _______________________________
" With none of these enabled ##'s are salmon-coloured - but no folding
" Check if this displays headings - yes but loses coloured # as in vim-mardown-folding 
" preservim/vim-vim-markdown  https://github.com/preservim/vim-markdown.git  (this one has more stars and seems more active....)
Plug 'plasticboy/vim-markdown'
" Latex 
" Plug 'vim-latex/vim-latex'
" the following plugin (vim-markdown) includes Syntax Concealing - use :set conceallevel=2
" Plug 'https://github.com/preservim/vim-markdown'                        
" the following hides the heading in markdown files - a problem (is this why plasticboy is better?) - <-- use :set foldignore=# 
" Plug 'masukomi/vim-markdown-folding'
"
" ____________   Language Server Protocol _______________________________
" 
Plug 'prabirshrestha/vim-lsp'

call plug#end()
"
" }}}
" Preferred Plugins {{{
" NOTE: These are now managed using vim.plug (see above Enable / Disable Plugins)

" === Preferred Plugins === 
" added vim-plug to manage plugins
" cd ~/.vim
" autoload  pack  plugins  spell
" autoload contains plug.vim
" pack/nightsense/start/stellarized
" plugins - this is the location for Plug to place other plugins

" CURRENT - CURRENT - CURRENT - CURRENT - CURRENT 
" 2022-11-15 

" - Finishing ... Done!
" - fzf: Resolving deltas: 100% (1914/1914), done.
" - goyo.vim: Already installed
" - iceberg.vim: Already installed
" - limelight.vim: Already installed
" - loremipsum: Already installed
" - ranger.vim: Already installed
" - tabular: Already installed
" - vim-abolish: Already installed
" - vim-airline-themes: Already installed
" - vim-airline: Already installed
" - vim-commentary: Already installed
" - vim-easymotion: Already installed
" - vim-lsp: Already installed
" - vim-markdown: Already installed
" - vim-peekaboo: Already installed
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
   " let's you see the regs e.g. a side buffer pops up when you press 
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
