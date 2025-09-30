#!/bin/bash
clear
echo --------------------------------------------------------------------------------
echo Starting Spring Boot enabled DastaHub microservices
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shopt -s expand_aliases
source $DATAHUB_UTIL_BIN/set-dev-aliases.sh

startdatahubentity
sleepbetweenstarts
startdatahubsearch
sleepbetweenstarts
startdatahubuser
sleepbetweenstarts
startdatahubsubmission
sleepbetweenstarts
startdatahubreport
sleepbetweenstarts
startdatahubemail
sleepbetweenstarts
startdatahubdownload
