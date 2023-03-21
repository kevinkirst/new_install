#!/bin/bash

# changelog
#	v1.0 - check is a package is installed, name of the package must be passed as parameter when calling this script
#		 - if running this script straight from terminal, 'source' it
#		 - logs programs that were already installed before the script was executed to $LOG_OK
#		 - 

# =-= USAGE =-= #
# source ${DIR_PROGRAMS}/chk_pkg_install.sh PACKAGE_NAME

# =-= VARIABLES =-= #
# check if config.cfg variable is set, sources config.cfg if not
if [ -z "${DIR_LOG_OK+x}" ]; then 
	cd "/etc/new_install"
	source ./lib/config.cfg
fi
LOG_OK=${DIR_LOG_OK}chk_pkg_install.log

# =-= FUNCTIONS =-= #
function header {
	echo "${DASH}
DATE: ${MY_DATE}
TIME: ${MY_TIME}
"
}

# =-= MAIN =-= #
# vVv main script code vVv
# if initial parameter is empty, errors out
if [[ -z "$1" ]]; then 
	echo "chk_pkg_install.sh: no package name was provided."
	return 2
fi
# check if pkg is installed
#	$?=0 if package is installed
#	$?=1 if it isn't
#	$?=2 if no parameter was provided
# if ! hash "$1" 2>/dev/null
if ! dpkg -s "$1" >> "$TMP_FILE" 2> /dev/null
then
	echo "chk_pkg_install.sh: installing $1"
	return 1
else
	header>> "$LOG_OK"
	cat "$TMP_FILE">> "$LOG_OK"
	echo>> "$LOG_OK"
	# clearing temp file so it's empty for the next package log
	cat /dev/null > "$TMP_FILE"
	echo "chk_pkg_install.sh: $1 was already installed on this machine."
	return 0
fi