#!/bin/bash

sockets=$(env | grep -i "my.tmux.socket" | grep -oi "^.*=" | sed -e 's/.$//')
for socket in $sockets; do
	echo $socket
	tmux -S ${!socket} list-sessions
	echo
done
