Opened 2023-06-24


# Notes

https://github.com/sindresorhus/pure
(12.2k stars !)

# Install manually
Manually

    Clone this repo somewhere. Here we'll use $HOME/.zsh/pure.

mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

    Add the path of the cloned repo to $fpath in $HOME/.zshrc.

# .zshrc
fpath+=($HOME/.zsh/pure)

Getting started

Initialize the prompt system (if not so already) and choose pure:

# .zshrc
autoload -U promptinit; promptinit
prompt pure

Options
Option 	Description 	Default value
PURE_CMD_MAX_EXEC_TIME 	The max execution time of a process before its run time is shown when it exits. 	5 seconds
PURE_GIT_PULL 	Prevents Pure from checking whether the current Git remote has been updated. 	1
PURE_GIT_UNTRACKED_DIRTY 	Do not include untracked files in dirtiness check. Mostly useful on large repos (like WebKit). 	1
PURE_GIT_DELAY_DIRTY_CHECK 	Time in seconds to delay git dirty checking when git status takes > 5 seconds. 	1800 seconds
PURE_PROMPT_SYMBOL 	Defines the prompt symbol. 	❯
PURE_PROMPT_VICMD_SYMBOL 	Defines the prompt symbol used when the vicmd keymap is active (VI-mode). 	❮
PURE_GIT_DOWN_ARROW 	Defines the git down arrow symbol. 	⇣
PURE_GIT_UP_ARROW 	Defines the git up arrow symbol. 	⇡
PURE_GIT_STASH_SYMBOL 	Defines the git stash symbol. 	≡



