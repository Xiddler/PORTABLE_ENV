#  For use of tramp on doom emacs on Windows
# [[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

#  XDG Base Directory Specification
XDG_CONFIG_HOME="/home/donagh/.config"
XDG_CACHE_HOME="/home/donagh/.cache"
# $XDG_DATA_HOME=".local/share"
# $XDG_RUNTIME_DIR is provided by your system  Toshiba --> /run/user/1000

# Go straight to tmux -- but from 2024-09-13 see tmuxp config at $HOME/.tmuxp/mydailysession.yaml

# tmux attach-session -t tdaily-0
# tmux attach-session -t mydailysessions

# tmuxp load /home/donagh/.tmuxp/my-6-daily-tabs.yaml
tmux attach-session -t my-6-daily-tabs


######################################
# emax on WSL auto
# if [ $TTY="/dev/pts/1" ]; then
# emax
# fi;
#
#
#####################################################
# Powerlevel10k Prompt
#####################################################

# Note: ( 2024-06-07 ) It seems powerlevel10k is no longer maintained. Consider using oh-my-posh (which I am using on Windows).

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

#####################################################

#####################################################
# DROPBOXD
#####################################################
# Dropbox on Toshiba - to ensure dropbod runs after a reboot
echo "Did you just reboot? Check dropboxd is running... ->% PS drobboxd OR ->% psd "
echo " \n
# Dropbox
echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p
# and
nohup ~/.dropbox-dist/dropboxd&
"
# echo "Rem: I changed cd to act like zoxide z"
# TRY THIS here
# echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p
# sleep 5
# nohup ~/.dropbox-dist/dropboxd&
# OR TRY
# in crontab -e
# @reboot ~/.dropbox-dist/dropboxd
# END DROPBOXD
#####################################################

# zsh modules (optional)
# the following (uncommented line) allows profiling `zsh` to see what may be making it slow. NOTE: zprof needs to be uncommented at the last line too.
# zmodload zsh/zprof

# zmodload zsh/mathfunc
# allow math functionality - see che cli_calcs.md 
# USAGE: ->% (( a = sin(44) * 44 )) && echo $a → 0.7788847046

# NOTE: Aliases handled in .zsh_aliases or .bash_aliases

# issue with locale - added 2022-11-22
export LC_TIME='en_IE.UTF-8'

# locale
export LANG=en_US.utf8


# It will set red for bold and blue for underlined. 
export LESS='-R --use-color -Dd+r$Du+b$'


# POWERLEVEL - START 

# see End of This File 
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# cf. WARNING at zim-wiki LINUX:1Linux Live USB:01installed apps:zsh shell:ISSUES
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
#
# END POWERLEVEL section



# the following was imported from the Manjaro .zshrc installed on Jan 14 2022


# Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  # source /usr/share/zsh/manjaro-zsh-config
# fi
# Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  # source /usr/share/zsh/manjaro-zsh-prompt
# fi


# to disable the Toshiba touchpad
# xinput disable 12 (or 13 - check with $ xinput list)


# show italics in vim comments etc.  -- see .vimrc for this
# https://hobo.house/2017/07/17/using-italics-with-vim-in-your-terminal/
# export TERM=xterm-256color
export TERM=xterm-256color-italic
# export TERM=xterm-256color-bold
# vivid https://github.com/sharkdp/vivid/
# export LS_COLORS="$(vivid generate molokai)"
# export LS_COLORS="$(vivid generate snazzy)"
# export LS_COLORS="$(vivid generate lava)"
# export LS_COLORS="$(vivid generate zenburn)"
export LS_COLORS="$(vivid generate catppuccin-mocha)"

# machine
COMP=$(uname -a | cut -d' ' -f2)


# borg backup
# export BORG_PASSPHRASE='theboysoffairhill'

# Add zsh aliases.
if [ -f $HOME/.zsh_aliases ]; then
    source $HOME/.zsh_aliases
    # source $HOME/.profile
fi

# my vimrc
MYVIMRC=$HOME/.vimrc

# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
# setopt PROMPT_PERCENT 

# Increase scrolling history. This is __NOT__ the number of items listed from a command. That'd be a Terminator setting.
set -g history-limit 9000 #

# refer to https://betterdev.blog/minimal-safe-bash-script-template/
# set -Eeou pipefail

# set Caps Lock key to Escape
# setxkbmap -option caps:escape
# setxkbmap -option caps:caps
#
# time and date data added to zsh history
setopt extendedhistory 



# enable grc - for colorizing output
# source /etc/grc.zsh

# Path to your oh-my-zsh installation.
# export ZSH=/home/ubuntu/.oh-my-zsh
# export ZSH=$HOME/.oh-my-zsh

# to allow copying of arguments - of mv - using kk
autoload copy-earlier-word
# zle -N copy-earlier-word
# bindkey '^[,' copy-earlier-word # original
# bindkey 'kk' copy-earlier-word


## Set name of the theme to load. Optionally, if you set this to "random"
## it'll load a random theme each time that oh-my-zsh is loaded.
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
## ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="amuse_dm"
# ## ZSH_THEME="candy-kingdom"
# ZSH_THEME="crcandy_dm"
# to edit the above file go to: $HOME/.oh-my-zsh/themes/crcandy_dm.zsh-themes
## ZSH_THEME="powerlevel9k/powerlevel9k"

## Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
#HISTSIZE=1000
#SAVEHIST=1000
# HISTFILE=$HOME/.zsh_history
HISTFILE=$HOME/.zhistory
HISTSIZE=99999 
HISTFILESIZE=99999

## Use modern completion system
#autoload -Uz compinit
#compinit
## Completion for kitty terminal
## kitty + complete setup zsh | source /dev/stdin

## Set list of themes to load
## Setting this variable when ZSH_THEME=random
## cause zsh load theme from this variable instead of
## looking in ~/.oh-my-zsh/themes/
## An empty array have no effect
## ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

## Uncomment the following line to use case-sensitive completion.
## CASE_SENSITIVE="true"

## Uncomment the following line to use hyphen-insensitive completion. Case
## sensitive completion must be off. _ and - will be interchangeable.
## HYPHEN_INSENSITIVE="true"

## Uncomment the following line to disable bi-weekly auto-update checks.
## DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=3

## Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

## Uncomment the following line to disable auto-setting terminal title.
## DISABLE_AUTO_TITLE="true"

## Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

## Uncomment the following line if you want to disable marking untracked files
## under VCS as dirty. This makes repository status check for large repositories
## much, much faster.
## DISABLE_UNTRACKED_FILES_DIRTY="true"

## Uncomment the following line if you want to change the command execution time
## stamp shown in the history command output.
## The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
## HIST_STAMPS="mm/dd/yyyy"

## Would you like to use another custom folder than $ZSH/custom?
## ZSH_CUSTOM=/path/to/new-custom-folder

## oh-my-zsh plugins
#
## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
## I am not using .oh-my-zsh so I am not using plugins at all? Let's turn off the following:
plugins=(
  # git
  # zsh-syntax-highlighting # built in to my current prompt p10k 
  # colored-man-pages
  fzf
  fd-find
  # extract
  # systemd
  # zoxide
)
# the following is a workaround to solve a problem with not going to vi-cmd-mode on "jk" on the CLI
# this seems to have gotten resolved somehow...
# Ans: zsh has bindings for vi on the CLI
# https://github.com/zsh-users/zsh-autosuggestions/issues/126
#
# if [ -z "$_zsh_custom_scripts_loaded" ]; then
#   _zsh_custom_scripts_loaded=1
#   plugins+=(zsh-syntax-highlighting)
# fi


# User configuration
# To add a new path
# export PATH="your-dir:$PATH"
# "export" in included within the zsh PATH command - check if true
# added to include Zotero path 2020-02-19
# PATH="/home/donagh/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/donagh/.fzf/bin:/home/donagh/Applications/Zotero/Zotero_linux-x86_64:/home/donagh/.vim/pack/SuperMan/start/vim-superman/bin"

# PATH="$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/donagh/.fzf/bin:/home/donagh/Applications/Zotero/Zotero_linux-x86_64:/home/donagh/.vim/pack/SuperMan/start/vim-superman/bin:/home/donagh/.emacs.d/bin/:/home/donagh/.cargo/bin:/home/donagh/PORTABLE_ENV_tmp/:/opt/texlive/2020/bin/x86_64-linux/:/home/donagh/.emacs/bin:/home/donagh/go/bin:/home/donagh/Applications/shellmath/shellmath:/home/donagh/.mix:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/maps/OSI_GridInQuest/GridInQuestII-Lin64-0100:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/2programming/golang/vugu_stuff:/home/donagh/.local/bin/gron:/usr/local/texlive/2021/bin/x86_64-linux:/home/donagh/Applications/nushell/nu_0_60_0_linux/nushell-0.60.0:/home/donagh/.subuser/bin"
# Is this a good idea to have PATH defined here? 
#
PATH="/home/donagh/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/donagh/.fzf/bin:/home/donagh/Applications/Zotero/Zotero_linux-x86_64:/home/donagh/.vim/pack/SuperMan/start/vim-superman/bin:/home/donagh/.cargo/bin:/home/donagh/PORTABLE_ENV_tmp/:/home/donagh/go/bin:/home/donagh/Applications/shellmath/shellmath:/home/donagh/.mix:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/maps/OSI_GridInQuest/GridInQuestII-Lin64-0100:/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/2programming/golang/vugu_stuff:/home/donagh/.local/bin/gron:/usr/local/texlive/2022/bin/x86_64-linux:/home/donagh/.subuser/bin:/home/donagh/.local/bin/cheat:/usr/sbin/bash:/home/donagh/.config/emacs/bin:/home/donagh/Applications/lc/lc"

# source /home/donagh/.local/bin/virtualenvwrapper.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# My aliases are in the file .zsh_aliases
# donaghs
autoload -U zmv # meaning zsh mv command
# You can then run zmv to rename files according to a pattern. Both the pattern and the replacement text need to be quoted so that they are passed-as is to the zmv function which will expand them in due course.
# zmv '^*.*' '$f.md'
# autocompletion
autoload -U compinit; compinit
# In bash to use the vi editor
# set -o vi
setopt VI # what is this? Sets the line editort to vi. Also works: bindkey -v 
# next allows cd to dir without prepending cd
setopt autocd
setopt autolist # e.g.in $HOME directory -> %ls /DoTAB ie follow ls /Do With  TAB
setopt extendedglob # extended globbbing e.g. ls -d ^*.py excludes .py files
setopt SHARE_HISTORY # uses same history for all sessions
# only fools wouldn't do this ;-) 
export EDITOR="vim"
# export BROWSER="w3m"

# the following shortcut alias means that pressing enter after just a 
# file name with .md extension will automagically open it with vim. Hurrah!

# shortcuts for activating venvs. pb python basic
# git
# speedtest
# output time in words
# get latest hanging stuff
# CLI dictionary
# CLI dictionary

# bindkeys see also $ zle -al
# switches to the command mode
bindkey 'jk' vi-cmd-mode 
# cx for clear screen -- doesn't work perfectly
bindkey 'cx' clear-screen

# / for search shell history
# causes problems when entering / for filepaths

# hf for cd ~ 
# bindkey 'hf' cd $HOME && clear-screen # Now done in autokey as it automatically executes 

# for urxvt terminal emulator
# xrdb ~/.Xresources  # may need to be in my .bashrc file though
# TERM=xterm

# LS_COLORS
# enabled the following on 2022-03-20
# eval "`dircolors -b ~/.dir_colors`"
# eval "$(dircolors -b ~/.dir_colors)"

# cd  /media/ubuntu/3520-FD13/2programming_repository/IT_projects/Dashboard_personal/ && gunicorn render_todo:app

# POWERLINE 
# replaced by powerlevel10k
# see https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html
# powerline statusline for zsh 2018-08-05
# Location: /usr/lib/python3.8/site-packages
# . {repository_root}/powerline/bindings/zsh/powerline.zsh
# . /usr/share/powerline/bindings/zsh/powerline.zsh

# powerline-daemon -q
# . /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
# fast file and directory autojump
# . /media/ubuntu/3520-FD13/compressed_utilities/zsh/z/z.sh



# MARKS
# export MARKPATH=$HOME/PORTABLE_ENV/MARKS/marks
# ln -s $HOME/PORTABLE_ENV/MARKS/marks $HOME/.marks

# mark() {
  # mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
# }

# unmark() {
  # rm -i "$MARKPATH/$1"
# }

# marks() {
  # ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
# }

# jump() {
  # cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
# }

#----- END MARKS 


# where the -U stands for unique, tells the shell that it should not add anything to $PATH if it's there already
typeset -U path

# grep hist
# histgrep() {
  # grep -r "$@" ~/.history
  # history | grep "$@"
  # }

# speaking clock in the terminal

##########################
#     ranger
##########################
# To stop ranger from loading both the default and your custom rc.conf,
#  please set the environment variable RANGER_LOAD_DEFAULT_RC to FALSE.
# # ranger default config file rc.conf 
export RANGER_LOAD_DEFAULT_RC=false

#############################
#        zoxide
#############################
# zoxide - for directory jumping using z 
# 2024-05-11 - changed to make cd be 'z' instead 
# eval "$(zoxide init --cmd cd zsh)"
# reverted 2024-06-02
eval "$(zoxide init zsh)"


#############################
#        mcfly
#############################

# mcfly - for history Ctrl-R
eval "$(mcfly init zsh)"

# emacs - to get emacsclient to work
# export ALTERNATE_EDITOR=""

# br is an alternative file searcher - described in HackerNews Jan 2020
# source /home/donagh/.config/broot/launcher/bash/br

#############################
#     fzf
#############################

eval "$(fzf --zsh)"

# fzf (disable this if using mcfly for Ctrl R)
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# get fzf to enable Ctrl-R & Ctrl-T
# source ~/.fzf/shell/key-bindings.zsh
# use fd instead of find
# export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git' #  --hidden means show hidden files


#############################
#    dirjump (or d)
#############################
# dirjump - use -> % d to see 10 most recent directories visited. https://github.com/imambungo/dirjump
# the author says he no longer maintains this and uses zoxide instead. But I like it!
# note I git cloned the full repo to $HOME/PORTABLE_ENV/dirjump/dirjump on 2024-06-25
source ~/.config/dirjump/dirjump


#############################
# https://github.com/nvbn/thefuck
# eval $(thefuck --alias)
#############################



#############################
#       yazi 
#############################
# blazingly fast TUI file manager
# URL: https://yazi-rs.github.io/
# This function provides the ability to change the current working directory when exiting Yazi so that after navigating to a dir in
# yazi and then quitting, you end up in the dir that you had last navigated to in yazi
#
# Repo suggests using yy as alias for yazi.
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# per-directory-history
source $HOME/PORTABLE_ENV/zsh/per-directory-history/per-directory-history.zsh
# Use Ctrl G to toggle between local and global

# tilix terminal (testing out June 2022) 
# if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        # source /etc/profile.d/vte.sh
# fi
 
#########################################################
#########################################################
# Consider using some /all of the foloowing — added 2025-02-17

  # Ensure history is written after every command, allowing it to persist across sessions
   # shopt -s histappend  # Append to history instead of overwriting
   # PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

   # Set the history size (adjust as needed)
   # HISTSIZE=50000   # Number of commands kept in memory

   # HISTFILESIZE=1000000  # Number of commands kept in the history file

   # Add timestamps to history (format: YYYY-MM-DD HH:MM:SS)
   # HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

   # Ignore duplicate and space-prefixed commands
HISTCONTROL=ignoredups:ignorespace

   # Save multi-line commands as a single entry
   # shopt -s cmdhist

   # Allow history expansion with Ctrl + R
   # bind '"\e[A":history-search-backward'
   # bind '"\e[B":history-search-forward'

#########################################################
#########################################################

# sd  https://github.com/ianthehenry/sd 
# fpath=(/home/donagh/Applications/sd_scripts_dir_utility/sd/sd $fpath)

# Pure prompt
# initialize pure prompt (for use in WSL etc. - p10k being too complicated)
# https://github.com/sindresorhus/pure 
fpath+=(/home/donagh/PORTABLE_ENV/zsh/home_dot_zsh/pure)
autoload -U promptinit; promptinit
# PURE_PROMPT_SYMBOL="❯"
prompt pure
# prompt fire
#fpath+=($HOME/.zsh/pure)
# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan
#
# zsh-abbr - allows TEXT expansion in the zsh (eg pas = pamac search) 
# see zim-wiki and cheats --> zsh
# and https://zsh-abbr.olets.dev/
source $HOME/PORTABLE_ENV/zsh/zsh_abbr/zsh-abbr/zsh-abbr.zsh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# see first line regarding zLINUX:1Linux Live USB:01installed apps:powerlevel10kprof 
# zprof 
#
# call the zsh-syntax-highlighting plugin last thing in this file
# plugins=( zsh-syntax-highlighting )
source $HOME/PORTABLE_ENV/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


