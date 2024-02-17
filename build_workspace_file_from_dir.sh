#!/bin/bash 
dir=${1:-$PWD}
name=$(echo $dir | sed -e 's/\//./g' -e 's/^.//')
homeDanVimWorkspaces=".danvim/workspaces"
if test -n "${MY_VIM_WORKSPACES}"; then
	workspaceFile=${MY_VIM_WORKSPACES}/$name.workspaces
else
	mkdir -p $HOME/$homeDanVimWorkspaces
	workspaceFile=$HOME/$homeDanVimWorkspaces/$name.workspaces
fi
echo $workspaceFile
if test -r  $workspaceFile; then
	echo "Workspace file is present already!"
	exit
fi
if test -z $1; then
	echo "A <DIR> has not been given, therefore we are using $dir"
fi
echo "Building workspace $name from $dir"
#echo -e "\n\n[we are here]\n$dir/\n[search]\n-i \"\"\n[make tree]\n-I \"target|.git|node_modules|build|target\" --filelimit 50" >> $(eval echo $MY_VIM_WORKSPACES)/$name.workspaces
echo -e "\n\n[we are here]\n$dir/\n[search]\n-i \"\"\n[make tree]\n-I \"target|.git|node_modules|build|target\" --filelimit 50\n\n\n\n" >> $workspaceFile
