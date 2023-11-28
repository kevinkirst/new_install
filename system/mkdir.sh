#!/bin/bash
# author: kevinkirst
# changelog
#	v1.0 - script for automatic folder creation
#		 - to be sourced by new_install
#		 - checks if directory exists
#		 - changes directory permission to 'read/execute' for all (555)
#		 - changes owner of all folders to myself
#		 - 

# =-= VARIABLES =-= #

# =-= FUNCTIONS =-= #
function make_dir {
	# if directory doesn't exist, creates it
	if [[ ! -d "$1" ]]; then
		mkdir -p "$1"
	fi
	# changing owner (user:group)
	chown "$MYSELF":"$MYSELF" $1
	# changing permission for created/existing directory
	chmod 775 $1
	# lists created/existing directory if created successfully
	if [[ -d "$1" ]]; then
		echo "	-> $1"
	else
		echo "${NAME}: unable to create $1"
	fi
}

# =-= MAIN =-= #
# vVv main script code vVv
echo "mkdir.sh: list of created directories:"
make_dir "$DIR_LOG_OK"
make_dir "$DIR_LOG_ERROR"
echo