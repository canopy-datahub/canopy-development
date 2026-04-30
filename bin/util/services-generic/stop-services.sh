#!/bin/bash
clear
echo --------------------------------------------------------------------------------
echo Stopping Spring Boot enabled Canopy microservices
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shopt -s expand_aliases
source $CANOPY_UTIL_BIN/set-dev-aliases.sh

stopcanopyentity
stopcanopysearch
stopcanopyuser
stopcanopysubmission
stopcanopyreport
stopcanopyemail
stopcanopydownload
