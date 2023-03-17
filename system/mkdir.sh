#!/bin/bash

# changelog
#	v1.0 - script for automatic folder creation
#		 - to be sourced by new_install
#		 - 

# =-= VARIABLES =-= #

# =-= FUNCTIONS =-= #
function make_dir {
	# if directory doesn't exist, creates it
	if [[ ! -e "$1" ]]; then
		mkdir "$1"
	fi
	# lists created/existing directory
	echo "	-> $1"
}

# =-= MAIN =-= #
# vVv main script code vVv
echo "mkdir.sh: list of created directories:
"
make_dir "$DIR_LOG_OK"
make_dir "$DIR_LOG_ERROR"
echo