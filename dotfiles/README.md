Opened 2022-03-19

The reason for this dotfiles folder is that "stow" uses it to make the symlinks (instead of having to do this manually).

usage example for vim
(Ensure stow is installed: -> % sudo pamac install  stow )

In $HOME run
-> %  stow vim
and this will symlink the .vimrc file stored in /home/donagh/PORTABLE_ENV/dotfiles/ to ~/.vimrc





