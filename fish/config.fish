# the global value takes precedence over the universal value - to avoid this problem
# -g or --global causes the specified shell variable to be given a global scope.
# 
set  -gx EDITOR /usr/bin/vim

set -U MYVIMRC $HOME/.vimrc

set -g fish_key_bindings fish_vi_key_bindings
# or as per docs 2.2
# fish_vi_mode

# rem: PATH items are separated by a space in fish (not a colon)
set -g PATH /home/donagh/.local/bin /usr/local/sbin /usr/local/bin /usr/bin /usr/lib/jvm/default/bin /usr/bin/ /usr/bin/ /usr/bin/ /var/lib/snapd/snap/bin /home/donagh/.vim/pack/SuperMan/start/vim-superman/bin /home/donagh/.fzf/bin/

