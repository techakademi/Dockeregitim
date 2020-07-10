#!/bin/bash
tmux new -s YDengele -d 
tmux split-window -h 
tmux selectp -t 1 
tmux send-keys -t 1 "ctop" C-m
tmux selectp -t 0
tmux send-keys -t 0 "ab.sh" C-m
tmux attach-session
