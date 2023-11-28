#!/bin/bash
# author: kevinkirst
set -euo pipefail
	# 'set [+-]e' -> exits if any command has a non zero exit status
	# 'set [+-]u' -> exits if an undefined variable is referenced 
		# requires ':-' to be placed after unbound variables ('${1}' becomes '${1:-}')
	# 'set [+-]o pipefail' -> prevents error in a pipeline from being masked
IFS=$'\n\t'
	# Internal Field Separator -> set to 'new line' and 'tab'

# changelog
#	v1.0 - 
#		 - 

# =-= VARIABLES =-= #
HI="sup"

# =-= FUNCTIONS =-= #
function finish {
	#clean-up code goes here
	echo "end"
}

# =-= MAIN =-= #
trap finish exit
# vVv main script code vVv
echo "$HI"