#!/bin/bash

# changelog
#	v1.0 - script for automatic folder creation
#		 - to be sourced by new_install
#		 - 

# =-= VARIABLES =-= #
LOG_OK=${DIR_LOG_OK}update.log
LOG_ERROR=${DIR_LOG_ERROR}update.log

# =-= FUNCTIONS =-= #
function header {
	echo "${DASH}
DATE: ${MY_DATE}
TIME: ${MY_TIME}
"
}

# =-= MAIN =-= #
# vVv main script code vVv
echo "update.sh: updating..."
header>> ${LOG_OK}
header>> ${LOG_ERROR}
apt-get update -y >> ${LOG_OK} 2>> ${LOG_ERROR}
echo>> ${LOG_OK}
echo>> ${LOG_ERROR}