#!/bin/sh

# stuff and things
set -e

if tmux has-session -t zettel.vim 2> /dev/null; then
    tmux attach -t zettel.vim
    exit
fi

# set up a new session

tmux new-session -d -s zettel.vim -n main

# 1. Main window: vim, lf, git status
tmux send-keys -t zettel.vim:main "nvim -c Files" Enter
tmux split-window -t zettel.vim:main -h -c "$PWD"
tmux send-keys -t zettel.vim:main.right "git status" Enter

# Start it up!
tmux attach -t zettel.vim:main.left
