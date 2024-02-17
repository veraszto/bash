#!/bin/bash
export PULL_MY_NON_PUBLIC_SCRIPT="$HOME/git/my-bash/my-custom-bashrc.sh"
source $HOME/git/bash/my-custom-bashrc.sh
unset GNOME_TERMINAL_SCREEN
#sessionName=myTmuxSession
#sessionGroup=myTmuxGroup
#tmux -S $MY_TMUX_SOCKET has-session -t $sessionName &> /dev/null
#hasSession=$?
#selectLayoutTiled="select-layout tiled"
#splitw="splitw -l5 \; select-pane -t -1"

basic='tmux -S $MY_TMUX_SOCKET -f $MY_TMUX_CONF new-session'
reports='"journalctl --follow" \; splitw "TERM=xterm-256color htop" \; select-layout even-horizontal'

#if test $hasSession -gt 0; then
#	andThen='-f $MY_TMUX_CONF new-session -s '"$sessionName"' -t '"$sessionGroup"' \; '\
#"$splitw"' \; '"$splitw"' \; '"$splitw"' \; splitw "journalctl --follow" \; '\
#'swap-pane -t4 \; '\
#'splitw "TERM=xterm-256color htop" \; select-layout tiled \; '\
#'swap-pane -t5 \; '\
#'select-pane -t0 \; '\
#'new-window "vim" \; '\
#'new-window "vim" \; '\
#'new-window \; '\
#'select-window -t 0'
#	built="$base $andThen"
#else
#	andThen='new-session -t '"$sessionGroup"
#	built="$base $andThen"
#fi
#echo $built

geometry="270x70"
maximize="--maximize"
fullScreen="--full-screen"
gnome-terminal $fullScreen -- /bin/bash -c "$basic -s 'Reports' $reports"
gnome-terminal --title "Bash" $fullScreen -- /bin/bash -c "$basic -s Bash"


gnome-terminal --title "Vim" $fullScreen -- /bin/bash -c "$basic -s Vim \
vim \"+cd $HOME\" \"+call g:danvim.modules.state_manager.InflateState()\" \; \
new-window vim \"+cd $MY_DANVIM_DIR\" \"+call g:danvim.modules.state_manager.InflateState()\""


gnome-terminal --title "Cloud Virtual Machine" $fullScreen
gnome-terminal --title "Manuals/Readings" $fullScreen -- /bin/bash -c "$basic -s 'Manuals/Readings'"
gnome-terminal --title "Launcher" $maximize

#tmuxInside="$MY_VIM_LOADERS_DIR_BASE/tmux.inside.vim"
#gnomeProject="$MY_PUBLIC_BASH_DIR/build_workspace_file_from_dir.sh && gnome-terminal --full-screen -- vim -S $tmuxInside"
#gnomeProject="gnome-terminal --full-screen -- vim -S $tmuxInside"
#cd $MY_JAVA_DIR && eval $gnomeProject
#cd $MY_JS_DIR && eval $gnomeProject
#gnome-terminal --full-screen
#'splitw "man bash" \; swap-pane -U \; select-layout even-horizontal \; '\
