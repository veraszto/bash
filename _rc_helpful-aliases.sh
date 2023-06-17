#!/bin/bash

alias .custom_bash="source $MY_PUBLIC_BASH_DIR/my-custom-bashrc.sh"
alias .ps1="source $MY_PUBLIC_BASH_DIR/_rc_ps1.sh"
alias .colors="$MY_PUBLIC_BASH_DIR/bash_colors.sh"
alias .workspace.here="$MY_PUBLIC_BASH_DIR/build_workspace_file_from_dir.sh"
alias .-="sudo su -"
alias .add.this.dir="pushd . &> /dev/null"
alias .ls.last="ls -lth | head"
alias .chmod="chmod 775 *.sh"

alias .tmux.sessions="$MY_PUBLIC_BASH_DIR/list-tmuxes.sh"
alias .tmux="tmux -f $MY_TMUX_CONF -S $MY_TMUX_SOCKET"

alias .gcfg="git config --list"
alias .gstatus="git status"
alias .gash="git stash list"
alias .gashapply="git stash apply"
alias .gashshow="git stash show"
alias .gdiff="git diff"
alias .gdnoindex="git diff --no-index"
alias .gbranch="git branch"
alias .gcompactsummary="git diff --compact-summary"
alias .glog="git log --decorate --oneline --graph --all"
alias .glognall="git log --decorate --oneline --graph"
alias .glastbranch="git switch -"
alias .gmaster="git checkout master"
alias .gprimary="git checkout primary"
alias .gmain="git checkout main"
alias .glog-1="git log -1"
alias .guseremail="git config --list | grep \"user.\(email\|name\)\""
alias .gpushnewhead="git push --set-upstream origin HEAD"

alias .dockerlsa="docker container ls -a"

alias .agent='echo "Launching SSH-AGENT and adding $MY_GIT_KEY" ; eval $(ssh-agent -s) && ssh-add $MY_GIT_KEY && ssh-add -L'

alias ls="ls --color"
alias grep="grep --color"

alias .grace="$MY_GIT_HOME/graceful-gnu"
alias .danvim="$MY_GIT_HOME/danvim"

alias .aliases="alias | grep -i \"alias\s*\.[a-z0-9]\+\|#\{5,\}\""
