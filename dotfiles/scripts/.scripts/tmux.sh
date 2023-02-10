#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# 2023-02-01



tmux new-session -d -s mysession
# tmux send-keys -t mysession "s_books" Enter
tmux send-keys -t mysession "cd ~ && clear" Enter

tmux split-window -h -t mysession
# tmux send-keys -t mysession "cd ~ && clear" Enter
tmux send-keys -t mysession "s_books" Enter

tmux split-window -v -p 50 -t mysession
tmux send-keys -t mysession "sshrpi" Enter
tmux select-pane -t mysession:0.0

tmux split-window -v -p 50 -t mysession
tmux send-keys -t mysession "s_passwords" Enter
tmux select-pane -t mysession:0.0

# Attach to session 
tmux attach -t mysession

#!/bin/sh

# tmux new-session -d -s mysession # make session but don't attach to it
# tmux send-keys -t mysession "cd ~" Enter
# tmux split-window -h -t mysession
# tmux send-keys -t mysession "watch -n 1 df -H" Enter
# tmux split-window -v -p 50 -t mysession
# tmux send-keys -t mysession "htop" Enter
# tmux select-pane -t mysession:0.0
# tmux split-window -v -p 50 -t mysession
# tmux send-keys -t mysession "cd ~" Enter
# tmux select-pane -t mysession:0.0
# # Attach to session 
# tmux attach -t mysession

