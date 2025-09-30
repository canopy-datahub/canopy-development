#!/bin/bash
echo --------------------------------------------------------------------------------
echo Starting DataHub $1 server
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shopt -s expand_aliases
source $DATAHUB_UTIL_BIN/set-dev-aliases.sh

godh
cd datahub-service-$1
mvn spring-boot:run &
echo --------------------------------------------------------------------------------
echo
