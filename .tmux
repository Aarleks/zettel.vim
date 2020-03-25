#!/bin/sh

# stuff and things
set -e

if tmux has-session -t zettel 2> /dev/null; then
    tmux attach -t zettel
    exit
fi

# set up a new session

tmux new-session -d -s zettel -n main

# 1. Main window: vim, lf, git status
tmux send-keys -t zettel:main "nvim -c Files" Enter
tmux split-window -t zettel:main -h -c "$PWD"
tmux send-keys -t zettel:main.right "git status" Enter

# Start it up!
tmux attach -t zettel:main.left
