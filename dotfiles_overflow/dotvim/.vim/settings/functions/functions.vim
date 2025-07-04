"{{{ Preliminaries

" List of config files

" $MYVIMRC at $HOME/.vimrc
" $HOME/.vim/settings/configs/configs.vim
" $HOME/.vim/settings/functions/functions.vim
" $HOME/.vim/settings/mappings/mappings.vim
" $HOME/.vim/plugins/plugins.vim

" These are symlinked from PORTABLE_ENV/

" To insert lines  600 - 818 from old .vimrc
"  :r !sed -n 600,818p /home/donagh/.vimrc
"
"}}}
"{{{ Simple

" - sample function
function! Simple()
echom "Running simple function"
endfunction
" nnoremap <C-l>, :call Simple()<CR> " this works
command Simple call Simple()

"}}}
"{{{ Bullet list ---

" make dash bullet points 
function! BulletList()
    let lineno = line(".") " set the current line number to the variable 'lineno'
    call setline(lineno, "- " . getline(lineno)) " replace the line with the line itself prepended with '- '
endfunction

" this is very slow compared to calling directly without the mapping. Why so?
" nmap leader b :call BulletList()<cr> 

" Donaghs version
" function! Bullet_dash()
   " execute 'normal!'.'0i- \<Esc>j'
" endfunction
"}}}
"{{{ Number list 

" make numbered list - first Visually select the lines
" Note: The numbers above 9 will not be right aligned. So use the following function.
" n for number
" vnoremap leader n :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR> 
" vnoremap leader nl :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR>  

" remove line numbers - first Visually select the lines
" vnoremap leader nr :s/^\(\d\)\{1,2\}\. // <CR>

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

" first Visually select the lines then :call NumberList()

 " 1	donald
 " 2	duck
 " 3	daffy
 " 4	duck
 " 5	garry
 " 6	goose
 " 7	mickey
 " 8	mouse
 " 9	harry
" 10	heron
" 11	kerry
" 12	kangaroo
" }}}
"{{{ Neat DONAGHS
" --- SHORTEN SD64 filepath after pasting into vim ---
function! Neat_DONAGH()
    " Nd = Neaten_donagh i.e. shorten the long filepath using ~
    " s:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/:\~/DONAGHS/:
    s:/run/media/donagh/USB128GB/DONAGHS/:\~/DONAGHS/:
endfunction
command Nd call Neat_DONAGH()
"}}}
"{{{ Neat REPOS
function! Neat_REPOS()
    " Nr = Neaten_repos i.e. shorten the long filepath using ~
    s:/run/media/donagh/USB128GB/REPOSITORIES/:\~/REPOS/:
endfunction
command Nr call Neat_REPOS()
"}}}
"{{{ My Journal
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
"}}}
"{{{ Prose Mode
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
"}}}
"{{{ Insert filepath
" put shortened filename/path in the buffer
function! Filename()
    put=expand('%:p')
    " s:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/:\~/DONAGHS/:
endfunction
"}}}
"{{{ Scratch buffer
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
"}}}
"{{{ to Ur_journal
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
"}}}
"{{{ Send Hunk 

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
"}}}
"{{{ Toggle / to \ & \ to /

" Toggle slashes using leader t
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

" noremap silent  leader ts :ToggleSlash<CR>

" try it: C:\Users\don_l\Applications

"}}}
   
