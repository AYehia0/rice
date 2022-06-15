#!/bin/bash

projects="/home/none/Things/github"

# checking if the project is nodejs
is_node=true

if [[ $1 = 'no' ]]
then
	is_node=false
fi

# check if the project exists
project_name="$(find $projects -maxdepth 1 -type d -print | fzf --prompt 'Projects: ' )"


if [ $project_name ] 
then

	# creating a session by that project
	session="$( basename $project_name )"

	cd $project_name

	# First window (0) : nvim
	tmux new-session -d -s $session
		
	tmux rename-window -t $session:0 
	tmux send-keys -t $session:0 'nvim .' C-m

	if [ "$is_node" = true ]
	then
		
		# Testing window (1) : npm run test
		tmux new-window -t $session:1
		tmux rename-window -t $session:1 'Test'
		tmux send-keys -t $session:1 'npm run test' C-m
		
		# Server window
		tmux new-window -t $session:2
		tmux rename-window -t $session:2 'Server'
		tmux send-keys -t $session:2 'npm run dev' C-m
	
	else
		tmux new-window -t $session:1
		tmux rename-window -t $session:1  'Term'
	fi
	
	tmux attach-session -t $session

else
	echo "Project not found"
fi