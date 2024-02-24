#!/bin/bash

# Goal : Automatized way to create a new session for coding project
#   ng -> 1:code 2:serve 3:cmd
#
# * Should be in root of project
# * Check if valid angular project
# * if so, create project session

PROJECT="`pwd | xargs basename`"

SCRIPT_PATH="`dirname \"$0\"`"

# Create new session
source "$SCRIPT_PATH"/tmux-new.sh $PROJECT

# Prepare session
tmux switch-client -t $PROJECT
tmux rename-window -t $PROJECT 'code'
tmux send-keys -t $PROJECT 'nv' 'C-m'

if [[ -e "$(pwd)/.angular" ]]; then
    tmux new-window -t $PROJECT -n serve
    tmux send-keys -t $PROJECT 'npm start' # not sent, just typed
fi
tmux new-window -t $PROJECT -n cmd
tmux -t $PROJECT select-window -t 1
