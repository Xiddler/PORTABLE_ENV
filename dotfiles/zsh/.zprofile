# add export stuff from .zshrc to here to clean them up
# see also /etc/zsh/zprofile
#
#
# https://monokai.pro/zsh
# this file is read when starting new login shell, before .zshrc

# set initial shell level
export INIT_SHELL_LEVEL=$SHLVL

# encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# path variable
export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
