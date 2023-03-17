#!/bin/bash

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
		mkdir "$1"
	fi
	# changing owner (user:group)
	chown "$MYSELF":"$MYSELF" $1
	# changing permission for created/existing directory
	chmod 775 $1
	# lists created/existing directory
	echo "	-> $1"
}

# =-= MAIN =-= #
# vVv main script code vVv
echo "mkdir.sh: list of created directories:"
make_dir "$DIR_LOG_OK"
make_dir "$DIR_LOG_ERROR"
echo