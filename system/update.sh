#!/bin/bash

# changelog
#	v1.0 - script for automatic system update
#		 - created help function
#		 - logs successfull and error operations to separate folders
#		 - checks if variables from config file are set, this is so the script can be used on its own instead of only being usable by sourcing through 'new_install'
#		 - checks if script is being executed as root
#		 - 
# rearranged some stuff for more basic functionality
# sometimes the simpler answer is the right answer

# =-= VARIABLES =-= #
LOG_OK=${DIR_LOG_OK}/update.log
LOG_ERROR=${DIR_LOG_ERROR}/update.log

# =-= FUNCTIONS =-= #
# ease of reading for the logs
function header {
	echo "${DASH}
DATE: ${MY_DATE}"$LOG_OK" 2>> "$LOG_ERROR"
TIME: ${MY_TIME}
"
}
# success log
function log_ok {
	header >> $LOG_OK
	cat $FILE_TMP >> $LOG_OK
	# emptying $FILE_TMP
	echo>> $FILE_TMP
	echo>> $LOG_OK
}
# error log
function log_error {
	header >> $LOG_ERROR

	echo>> $LOG_ERROR
}

# =-= MAIN =-= #
echo "update.sh: updating..."
apt-get update -y &>> "$FILE_TMP"
if [[ $? -eq 0 ]]; then
	log_ok
else
	log_error
fi