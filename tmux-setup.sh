#!/bin/bash
tmux new-session -d -s mysession

tmux rename-window -t mysession:1 'Main'
tmux send-keys -t mysession:1 'htop' C-m

tmux new-window -t mysession -n 'Editor'
tmux send-keys -t mysession:2 'vim' C-m

tmux new-window -t mysession -n 'Logs'
tmux send-keys -t mysession:3 'tail -f /var/log/syslog' C-m

tmux attach -t mysession
