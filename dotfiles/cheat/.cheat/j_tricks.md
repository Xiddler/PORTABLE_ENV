# FRONTMATTER
Opened 2025-12-29 
Filepath /home/donagh/PORTABLE_ENV/dotfiles/cheat/.cheat/j_tricks.md

# `j` tricks
# =============================================================================================================

I have `jk` mapped to "switch to normal mode" in vim but I also have a line in my .zshrc file to allow this in the CLI 

I have `jl` mapped to cd $HOME in my .zshrc file

I have `j;` mapped to cd - in my .zshrc file

I have `j'` mapped to clear screen

## see zshzle bindkey - widgets

::zsh line editor

bindkeys see also $ zle -al

bindkey 'cx' clear-screen

bindkey 'jk' vi-cmd-mode
bindkey -s 'jl' 'cd ^M'     # -%> `cd ~` without pressing enter
bindkey -s 'j;' 'cd - ^M'   # -%> `cd -` without pressing enter





# =============================================================================================================
# FOOTNOTES

