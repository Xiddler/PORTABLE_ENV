"{{{ Introduction

" Filepath  /home/donagh/PORTABLE_ENV/vim/dotvim/plugins/plugins.vim

" Plugin manager Plug https://github.com/junegunn/vim-plug 
"
" Install
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" This file is where I call the plugins I want to use in vim. There is a line in .vimrc that calls this file
" I am using the vim-plug plugin manager from https://github.com/junegunn/vim-plug 
" .vimrc --> ~/.vim/plugins
" vim starts -->  ~/.vim/autoload/plug.vim 

" === Enable / Disable Plugins ===
" 2022-02-13 Created this new - external - sub-vimrc file 
" 2022-02-05  vim-plug started 
" https://github.com/junegunn/vim-plug and https://github.com/junegunn/vim-plug/wiki/tutorial
" Remember to :so % after adding a new Plug or just PlugInstall in any vim file

" ALTERNATIVE:
" There is the alternative of using the built-in vim package manager (see " ~/.vim/autoload/plug.vim)
" Ref: https://linuxconfig.org/how-to-manage-vim-plugins-natively
" 
" Create the folder ~/.vim/pack if it doesn't exist
" On opening, Vim looks for a _start_ and an _opt_ subdirectory somewher in " ~/.vim/pack
" Plugins found under the _start_ are loaded automatically; those inside the _opt_ directory, instead, must be loaded manually.
" A suitable structure for this folder might be:

" /home/donagh/.vim/pack/
" ├── colorschemes
" │   ├── opt
" │   └── start
" ├── others
" │   ├── opt
" │   └── start --▷ nerdtree
" └── syntax
"     ├── opt
"     └── start

" EXAMPLE: To load package "nerdtree" do this: 
" git -C ~/.vim/pack/others/start clone https://github.com/preservim/nerdtree
" The -C option allows git to move into the specified directory before executing the “clone” command

"}}}

call plug#begin('$HOME/PORTABLE_ENV/vim/dotvim/plugins')

" {{{ Airline status line 

" AIRLINE
" Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'vim-airline/vim-airline' 
Plug 'https://github.com/vim-airline/vim-airline-themes.git' 

" Moved from $MYVIMRC on 2024-07-03

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
" configuration is here: $HOME/PORTABLE_ENV/vim/dotvim/plugins/vim-airline/autoload/airline/init.vim
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
" (copied  from $HOME/PORTABLE_ENV/vim/plugins/vim-airline/autoload/airline/init.vim) 
" if !exists('g:airline_section_z')
   " if airline#util#winwidth() > 79
     " let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%p%%', 'colnr', 'linenr', 'maxlinenr'])
   " endif
" endif



"}}}
"{{{ Themes

"____________   THEMES _______________________________
" VIM THEME
" for the following plugin, -> %cp -r ~/.vim/plugins/stellarized ~/.vim/pack/nightsense/start/      :: this seems to be necessary
" nightsense seems gone from github Note added 2022-11-03  Plug 'nightsense/stellarized'              
" 
" gruvbox - added 2022-04-02. For a change.
" Plug 'https://github.com/morhetz/gruvbox.git'
"
" dracula - added 2022-11-04 (to get nicer markdown style - hate the yellow)
" https://github.com/dracula/dracula-theme.git
" Plug 'https://github.com/dracula/vim.git'

" miramare - added 2024-08-22
"Plug 'https://github.com/franbach/miramare.git'
" NOTE: Experimentally moved to ~/.vim/pack/colorschemes/start to pick my own colors for permanent behaviour  on 2024-08-24

" tomorrow-night - added 2023-12-26
Plug 'chriskempson/base16-vim'

" iceberg - added 2022-11-04
Plug 'https://github.com/cocopon/iceberg.vim.git'

" everforest - added 2023-12-26 - for the new year!
Plug 'https://github.com/sainnhe/everforest' 
" a bit faint?

" vim-themes - added 2024-07-03
Plug 'https://github.com/mswift42/vim-themes.git'


" ____________   END THEMES _______________________________
"}}}
"{{{ Preferred plugins

"------------  PREFERRED PLUGINS -----------------------------------

" commentary i.e. gcc  etc. 
Plug 'tpope/vim-commentary' " quick comment / uncomment plugin

" ranger
Plug 'francoiscabrol/ranger.vim' " call the ranger file manager from vim

" easymotion
Plug 'easymotion/vim-easymotion' " Use ./ (i.e. period backslash) to navigate around buffer using only keyboard - nice
" similar to (doom)emacs: avy-goto-char

" peekaboo
" the following plugin displays a buffer to the right on typing this  " <-- yes the quote symbol!
Plug 'junegunn/vim-peekaboo'

" nightsense/snow
" Plug 'nightsense/snow'

" Added 2024-08-24 as suggested by miramare theme creator
" Plug 'sheerun/vim-polyglot'

" Added 2024-11-15 — to help with Unicode characters + bonuses
" Plug 'chrisbra/unicode.vim'

" Plug 'zaid/vim-rec'  Plug 'https://github.com/zaid/vim-rec'  for rec-files 
"
" Plug 'tpope/vim-abolish'  Plug 'https://github.com/tpope/vim-abolish.git' - added 2022-09-02
" Plug 'https://github.com/tpope/vim-abolish.git' "  added 2022-09-02 < create hundreds of corrections my fingers refuse to learn > 

" FZF 
" added 2022-10-27 fuzzy search :FZF 
" Plug 'https://github.com/junegunn/fzf.git' 
 
" nim 
" plugin " added 2023-12-07
" Plug 'https://github.com/zah/nim.vim.git'

" LoremIpsum 
" added 2022-09-15 Usage: :Loremipsum 55 will output 55 latin words 
" Plug 'https://github.com/vim-scripts/loremipsum' 

" vim-mundo 
" - multi undo " Added 2023-12-13 cf. HN - multiple / universal UNDO tree 
" A Vim plugin to visualizes the Vim undo tree
" Plug 'https://github.com/simnalamburt/vim-mundo.git'

"}}}
"{{{  UI

" Goyo
Plug 'https://github.com/junegunn/goyo.vim.git' " Nice zen mode 
" Limelight
Plug 'https://github.com/junegunn/limelight.vim.git' " Darkens non-focussed areas 

" Tabular
" Plug 'godlygeek/tabular'  " for aligning text

"}}}
"{{{ Markdown
"____________   MARKDOWN   _______________________________
" With none of these enabled ##'s are salmon-coloured - but no folding
" Check if this displays headings - yes but loses coloured # as in vim-mardown-folding 
" preservim/vim-vim-markdown  https://github.com/preservim/vim-markdown.git  (this one has more stars and seems more active....)

" vim-markdown
" issue ISSUES:vim issue in zim-wiki — commenting out as a test
" Plug 'plasticboy/vim-markdown'

" the following plugin (vim-markdown) includes Syntax Concealing - use :set conceallevel=2
" https://github.com/preservim/vim-markdown.git
" Plug 'https://github.com/preservim/vim-markdown'                        
" Plug 'preservim/vim-markdown'                        
" the following hides the heading in markdown files - a problem (is this why plasticboy is better?) - <-- use :set foldignore=# 
" Plug 'masukomi/vim-markdown-folding'
"
"
" 2024-12-17  TRY NEW MARKDOWN PLUGIN -- due to vim issue mentioned in plasticboy above 
" Loaded this from github to ~/.vim/pack/markdown_preservim/start/vim-markdown on 2024-12-17
" Plug 'https://github.com/gabrielelana/vim-markdown.git'
" Plug 'gabrielelana/vim-markdown'
" GHF markdown?
"}}}
"{{{ LSP

" ____________   Language Server Protocol _______________________________
" 
" Plug 'prabirshrestha/vim-lsp'

" }}}


call plug#end()

" {{{  Plugins Listing

" NOTE: These are now managed using vim.plug (see above Enable / Disable Plugins)

" === Preferred Plugins === 
" added vim-plug to manage plugins
" cd ~/.vim
" autoload  pack  plugins  spell
" autoload contains plug.vim
" pack/nightsense/start/stellarized
" plugins - this is the location for Plug to place other plugins
"
"
" CURRENT - CURRENT - CURRENT - CURRENT - CURRENT 
" 2024-07-04 
" vim-peekaboo: Already installed                                          
" everforest: Already installed                                            
" goyo.vim: Already installed                                              
" vim-airline-themes: Already installed                                    
" vim-airline: Already installed                                           
" vim-commentary: Already installed                                        
" snow: Already installed                                                  
" vim-easymotion: Already installed                                        
" iceberg.vim: Already installed                                           
" vim-themes: Already installed                                            
" base16-vim: Already installed                                            
" ranger.vim: Already installed                                            
" vim-markdown: Already installed
"
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
   " guide at $HOME/PORTABLE_ENV/vim/dotvim/pack/vim-orgmode/start/vim-orgmode/doc/orgguide.txt
   "  https://github.com/jceb/vim-orgmode
   "
   " speedating
   " manages the - in dates like 2021-11-28 when opening say .org files
   "  https://github.com/tpope/vim-speeddating.git
   "
   "}}}
