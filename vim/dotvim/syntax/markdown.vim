" highlight # and ## (just out of interest)
" syntax keyword myComments
":syntax match myComments '/\*.*\*/'
syntax match myComments "^# .*"
":highlight myComments cterm=yellow guifg=yellow
" highlight '^\# .*' ctermfg=cyan ← FAILS
hi Comment	term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
" hi myComments	term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
