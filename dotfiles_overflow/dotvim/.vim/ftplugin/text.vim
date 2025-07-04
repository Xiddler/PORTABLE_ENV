
" a txt file
"
"" turn off numbers in the file ~/a.txt — for use with regexes etc. —  2025-06-25
" in zsh_aliases the alias is vima which opens the file ~/a.txt without numbers
" autocmd BufNewFile,BufFilePre,BufRead /home/donagh/a.txt silent! set nonu norelativenumber

" autocmd BufNewFile,BufFilePre,BufRead *.txt silent! set nonu norelativenumber

" see configs/config.vim file in .vim/settings

