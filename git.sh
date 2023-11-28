#!/bin/bash

# changelog
#	v1.0 - auto push to github
#		 - usage: git.sh [commit comment]
#		 - 
#		 - 

# =-= VARIABLES =-= #
COMMENT=$@
REPO=origin
BRANCH=main

# =-= FUNCTIONS =-= #

# =-= MAIN =-= #
# vVv main script code vVv
# check if comment parameter was passed
if [ -z "${1+x}" ]; then
	read -r -p "insert commit comment: " COMMENT
fi
git add .
git commit -m "$COMMENT"
git push "$REPO" "$BRANCH"
