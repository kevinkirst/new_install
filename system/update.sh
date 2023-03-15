#!/bin/bash
set -euo pipefail
	# 'set [+-]e' -> exits if any command has a non zero exit status
	# 'set [+-]u' -> exits if an undefined variable is referenced 
		# requires ':-' to be placed after unbound variables ('${1}' becomes '${1:-}')
	# 'set [+-]o pipefail' -> prevents error in a pipeline from being masked
IFS=$'\n\t'
	# Internal Field Separator -> set to 'new line' and 'tab'

# changelog
#	v1.0 - script for automatic system update
#		 - created help function
#		 - source 'config' file from './'
#		 - logs successfull and error operations to separate folders
#		 - 

# =-= VARIABLES =-= #
source config #'config' file should be in the same directory
LOG_OK=${DIR_LOG_OK}update.log
LOG_ERROR=${DIR_LOG_ERROR}update.log

# =-= FUNCTIONS =-= #
function finish {
	#clean-up code goes here
	exit 0
}
function help {
	echo "update.sh: update.sh [--help]
	Update the Linux system.
	
	Execute this script to update the Linux system.
	
	Options:
		--help		print the help page"
}
function header {
	echo "${DASH}
DATE: ${MY_DATE}
TIME: ${MY_TIME}
"
}

# =-= MAIN =-= #
trap finish exit
# vVv main script code vVv
if [[ "${1:-}" = "--help" ]]; then help & finish; fi
if ! [[ -z "${1:-}" ]]; then help & finish; fi
header>> ${LOG_OK}
header>> ${LOG_ERROR}
apt-get update -y >> ${LOG_OK} 2>> ${LOG_ERROR}
echo>> ${LOG_OK}
echo>> ${LOG_ERROR}