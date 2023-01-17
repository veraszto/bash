#!/bin/bash
source $HOME/git/my-bash/my_custom_bashrc.sh
unset GNOME_TERMINAL_SCREEN
tmux -S $MY_TMUX_SOCKET has-session -t myTmux &> /dev/null
hasSession=$?
base='tmux -S $MY_TMUX_SOCKET'
selectLayoutTiled="select-layout tiled"
if test $hasSession -gt 0; then
	andThen='-f $MY_TMUX_CONF new-session -s myTmuxSession -t myTmuxGroup \; '\
'splitw "man bash" \; select-layout even-horizontal \; '\
'new-window \; splitw \; splitw "journalctl --follow" \; splitw "TERM=xterm-256color htop" \; select-layout tiled \; '\
'new-window "vim" \; splitw -h \; '\
'new-window \; splitw -h' 
	built="$base $andThen"
else
	andThen='new-session -t myTmuxGroup'
	built="$base $andThen"
fi
echo $built
gnome-terminal --full-screen -- /bin/bash -c "$built"

tmuxInside="$MY_VIM_LOADERS_DIR_BASE/tmux.inside.vim"
#gnomeProject="$MY_PUBLIC_BASH_DIR/build_workspace_file_from_dir.sh && gnome-terminal --full-screen -- vim -S $tmuxInside"
gnomeProject="gnome-terminal --full-screen -- vim -S $tmuxInside"
cd $MY_JAVA_DIR && eval $gnomeProject
cd $MY_JS_DIR && eval $gnomeProject
#gnome-terminal --full-screen
#'splitw "man bash" \; swap-pane -U \; select-layout even-horizontal \; '\
