#!/bin/bash

# Handle creation of tmux new session, from within tmux supported.

if [ -z "$TMUX" ]
then
    tmux new-session -s $1
else
    tmux has-session -t $1
    if [ $? != 0 ]
    then
        tmux new-session -s $1 -d
    fi
    tmux switch-client -t $1
fi
