#!/bin/bash
echo --------------------------------------------------------------------------------
echo Starting Canopy $1 server
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shopt -s expand_aliases
source $CANOPY_UTIL_BIN/set-dev-aliases.sh

cd $CANOPY_HOME/canopy-service-$1
mvn spring-boot:run &
echo --------------------------------------------------------------------------------
echo
