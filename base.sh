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
MODULE=$(basename $0)
HI="sup"

# =-= FUNCTIONS =-= #
function help {
	echo "$MODULE: $MODULE [--help]
	[description]
	
	Options:
		--help		print the help page"
	exit 0
}

# =-= MAIN =-= #
# if first parameter is '--help' show help
if [[ "${1:-}" = "--help" ]]; then help; fi
# with '!' - if ANY parameter is passed, show help
# without '!' - if NO parameter is passed, show help
if ! [[ -z "${1:-}" ]]; then help; fi
# vVv main script code vVv
echo "$HI"
echo $0
echo $MODULE