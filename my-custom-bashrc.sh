#!/bin/bash

export MY_GIT_HOME=$HOME/git
export MY_DANVIM_DIR=$MY_GIT_HOME/danvim
export MY_PUBLIC_BASH_DIR="$MY_GIT_HOME/bash"
export MY_GRACEFUL_GNU=$MY_GIT_HOME/graceful-gnu
export MY_GNOME_TERMINAL_PROJECTS_LAUNCHER_INITIALIZATOR="gnome-terminal --maximize --full-screen"

if test -n "$(echo -n $XDG_SESSION_DESKTOP | grep -i xorg)"; then
	export MY_CLIPBOARD_MANAGER_IN="xclip -in -selection CLIPBOARD"
	export MY_CLIPBOARD_MANAGER_OUT="xclip -out -selection CLIPBOARD"
elif test "$(uname)" = "Darwin"; then
	export MY_CLIPBOARD_MANAGER_IN="pbcopy"
	export MY_CLIPBOARD_MANAGER_OUT="pbpaste"
else
	export MY_CLIPBOARD_MANAGER_IN="wl-copy"
	export MY_CLIPBOARD_MANAGER_OUT="wl-paste"
fi

export DANVIM_CLIPBOARD_MANAGER_COPY=$MY_CLIPBOARD_MANAGER_IN
export DANVIM_CLIPBOARD_MANAGER_PASTE=$MY_CLIPBOARD_MANAGER_OUT

if test $(echo $SHELL | grep -i bash &> /dev/null ; echo $?) -eq 0; then
	HISTSIZE=-1
	HISTFILESIZE=-1
	HISTCONTROL=ignoreboth
elif test $(echo -n "$SHELL" | grep -i zsh); then
	HISTSIZE=1000
	SAVEHIST=1000
fi

export MY_TMP_BRIDGE="$HOME/tmp/bridge"
export MY_VIM_ADDITIONAL_RUNTIME_DIR="$MY_GRACEFUL_GNU/vim/additional.runtime"
export MY_VIM_INITIAL_DIR="~/git"
export DANVIM_INITIAL_DIR=$MY_VIM_INITIAL_DIR
export MY_VIM_OVERLAY_NAVIGATOR_OFF=1

export MY_TMUX_SESSION="Main"
export MY_TMUX_TOOLBOX_SESSION="Toolbox"
export MY_TMUX_SOCKET="$HOME/TMUX.SOCKET"
#export MY_TMUX_SOCKET_TOOLBOX="$HOME/TMUX.SOCKET.TOOLBOX"
#export MY_TMUX_SOCKET_BASH_CONTEXT="$HOME/TMUX.SOCKET.BASHCONTEXT"
#export MY_TMUX_SOCKET_TOOLBOX_BASH_CONTEXT="$HOME/TMUX.SOCKET.TOOLBOX.BASHCONTEXT"
#export MY_TMUX_SOCKET_TOOLBOX="$HOME/TMUX.SOCKET.TOOLBOX"
export MY_TMUX_CONF="$MY_GRACEFUL_GNU/tmux/default.conf"
#export MY_TMUX_CONF_BASH_CONTEXT="$MY_GRACEFUL_GNU/tmux/bash.context.conf"
export EDITOR="vim -u /etc/vim/vimrc"

if command -v shopt &> /dev/null; then
	shopt -s autocd
elif command -v setopt &> /dev/null; then
	setopt autocd
fi

for s in $(find $MY_PUBLIC_BASH_DIR -regex ".*_rc_.*")
do
	test -r "$s" && source "$s"
done

test -r "$PULL_MY_NON_PUBLIC_SCRIPT" && source "$PULL_MY_NON_PUBLIC_SCRIPT"

if [ -n "$(echo $- | grep -io 'i')" ]; then
	echo "Hello how are you?"
	echo "We have $(wc -l $HISTFILE | grep -o "^[0-9]\+") lines of history"
fi 
