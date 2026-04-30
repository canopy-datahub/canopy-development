#!/bin/bash
clear
echo --------------------------------------------------------------------------------
echo Starting Spring Boot enabled Canopy microservices
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shopt -s expand_aliases
source $CANOPY_UTIL_BIN/set-dev-aliases.sh

startcanopyentity
sleepbetweenstarts
startcanopysearch
sleepbetweenstarts
startcanopyuser
sleepbetweenstarts
startcanopysubmission
sleepbetweenstarts
startcanopyreport
sleepbetweenstarts
startcanopyemail
sleepbetweenstarts
startcanopydownload
