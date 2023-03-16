#!/bin/bash

# changelog
#	v1.0 - check is a package is installed, name of the package must be passed as parameter when calling this script
#		 - if running this script straight from terminal, 'source' it
#		 - 

# =-= USAGE =-= #
# source ${DIR_PROGRAMS}/chk_pkg_install.sh PACKAGE_NAME

# =-= MAIN =-= #
# vVv main script code vVv
# if initial parameter is empty, errors out
if [[ -z "$1" ]]; then 
	echo "chk_install: no package name was provided."
	return 2
fi
# check if pkg is installed
#	$?=0 if package is installed
#	$?=1 if it isn't
#	$?=2 if no parameter was provided
if ! hash "$1" 2>/dev/null
then
	return 1
else
	echo "chk_install: $1 was already installed on this machine."
	return 0
fi