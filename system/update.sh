#!/bin/bash

# changelog
#	v1.0 - script for automatic system update
#		 - created help function
#		 - logs successfull and error operations to separate folders
#		 - checks if variables from config file are set, this is so the script can be used on its own instead of only being usable by sourcing through 'new_install'
#		 - checks if script is being executed as root
#		 - 

# check if running as root, if not, prompts for root password
if [[ ${EUID} -ne 0 ]]
	then
		exec sudo -- "$0" "$@"
fi

# =-= VARIABLES =-= #
# check if config.cfg variable is set, sources config.cfg if not
if [ -z "${DIR_LOG_OK+x}" ]; then 
	cd "/etc/new_install"
	source ./lib/config.cfg
fi
LOG_OK=${DIR_LOG_OK}/update.log
LOG_ERROR=${DIR_LOG_ERROR}/update.log

# =-= FUNCTIONS =-= #
function help {
	echo "update.sh: update.sh [--help]
	Update the Linux system.
	
	Execute this script to update the Linux system.
	
	Options:
		--help		print the help page"
	exit 0
}
function header {
	echo "${DASH}
DATE: ${MY_DATE}
TIME: ${MY_TIME}
"
}

# =-= MAIN =-= #
# vVv main script code vVv
if [[ "${1:-}" = "--help" ]]; then help; fi
if ! [[ -z "${1:-}" ]]; then help; fi
echo "update.sh: updating..."
header>> "$LOG_OK"
header>> "$LOG_ERROR"
apt-get update -y >> "$LOG_OK" 2>> "$LOG_ERROR"
echo>> "$LOG_OK"
echo>> "$LOG_ERROR"