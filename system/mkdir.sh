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
# directory status for reporting defaults to 'already existed - skipped'
DIR_STATUS="${CLR_YELLOW}already existed - skipped${CLR_DEFAULT}"

# =-= FUNCTIONS =-= #
function make_dir {
	# if directory doesn't exist, creates it
	if [[ ! -d "$1" ]]; then
		mkdir -p "$1"
		DIR_STATUS="${CLR_GREEN}created${CLR_DEFAULT}"
	fi
	# changing owner (user:group)
	chown "$MYSELF":"$MYSELF" $1
	# changing permission for created/existing directory
	chmod 775 $1
	# lists created/existing directory if created successfully
	if [[ -d "$1" ]]; then
		echo -e "	-> $1 - ${DIR_STATUS}"
	else
		echo -e "${CLR_RED}${NAME}: unable to create $1 ${CLR_DEFAULT}"
	fi
}

# =-= MAIN =-= #
# vVv main script code vVv
echo "mkdir.sh: list of created directories:"
make_dir "$DIR_LOG_OK"
make_dir "$DIR_LOG_ERROR"
echo