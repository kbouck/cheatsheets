#!/bin/sh 

# A small chat script made which using tmux and nc
#
# 1. Run chat server:
#
#    ./chat.sh
#
#
# 2. Run chat client:
#
#    ./chat.sh <server-host>
#
# Note:
# - ports are hard-coded
#

port1=12345
port2=12346
server_mode=true
server_host=localhost

if [ -z "${1}" ]; then 
  echo "Running in Server Mode (${port1}, ${port2})"
else 
  server_mode=false
  server_host=${1}
  echo "Running in Client Mode (${server_host}, ${port1}, ${port2})"
fi
  

# -d : don't attach (yet)
tmux kill-session -t chat
tmux new-session -d -s chat -n chat

tmux rename-window -t chat:0 'Chat Session'
# -v: one on top, one on bottom
tmux split-window -v -t chat

# top
tmux select-pane -t 0 
if [ "${server_mode}" = "true" ]; then
  tmux send-keys "clear; nc -lvp ${port1}" "C-m"
else
  tmux send-keys "clear; nc -v ${server_host} ${port2}" "C-m"
fi

# bottom
tmux select-pane -t 1 
if [ "${server_mode}" = "true" ]; then
  tmux send-keys "clear; nc -lvp ${port2}" "C-m"
else
  tmux send-keys "clear; nc -v ${server_host} ${port1}" "C-m"
fi

# -2: 256 colors
tmux -2 attach-session -t chat




