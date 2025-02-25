#!/bin/bash

# get args as name of session

SESSION_NAME = $1


tmux new-session -d -s $SESSION_NAME

tmux new-window -t $SESSION_NAME -n 'Editor'
tmux send-keys -t $SESSION_NAME:2 'nvim .' C-m

tmux new-window -t $SESSION_NAME -n 'Logs'
# tmux send-keys -t mysession:3 'tail -f /var/log/syslog' C-m

tmux attach -t  $SESSION_NAME

