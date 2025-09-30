#!/bin/bash
clear
echo --------------------------------------------------------------------------------
echo Stopping Spring Boot enabled DastaHub microservices
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shopt -s expand_aliases
source $DATAHUB_UTIL_BIN/set-dev-aliases.sh

stopdatahubentity
stopdatahubsearch
stopdatahubuser
stopdatahubsubmission
stopdatahubreport
stopdatahubemail
stopdatahubdownload
