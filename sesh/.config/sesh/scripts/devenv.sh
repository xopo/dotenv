#!/usr/bin/env sh

# get current window name
first_window=$(tmux display-message -p '#I')
# add new window
tmux new-window -n 'perf'
tmux split-window -h
tmux send-keys "htop" Enter
tmux split-window -vl 60%
tmux send-keys "btop" Enter

# select left pane
tmux select-pane -L
tmux send-keys "love you"

# go back to main window
tmux select-window -t "$first_window"
# and start nvim
tmux send-keys "nvim" Enter
