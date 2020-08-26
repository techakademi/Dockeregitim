#!/bin/bash
tmux new -s MonitorDroid -d 
tmux split-window -v 
tmux selectp -t 1 
tmux send-keys -t 1 "stressdroid.sh" C-m
tmux selectp -t 0
tmux send-keys -t 0 "stats.sh" C-m
tmux attach-session