#!/bin/bash

#DEV Util common locations
export DATAHUB_UTIL_BIN=${DATAHUB_DEVELOP_HOME}/bin/util/

#CEDAR location aliases
alias godh='cd $DATAHUB_HOME'
alias envdh='source $DATAHUB_HOME/set-env.sh'
alias dhcli='source $DATAHUB_HOME/datahub-cli/cli.sh'

alias startdatahubentity='$DATAHUB_UTIL_BIN/services-generic/start-spring-boot.sh entity &'
alias stopdatahubentity='$DATAHUB_UTIL_BIN/services-generic/stop-spring-boot.sh entity'

alias startdatahubsearch='$DATAHUB_UTIL_BIN/services-generic/start-spring-boot.sh search &'
alias stopdatahubsearch='$DATAHUB_UTIL_BIN/services-generic/stop-spring-boot.sh search'

alias startdatahubuser='$DATAHUB_UTIL_BIN/services-generic/start-spring-boot.sh user &'
alias stopdatahubuser='$DATAHUB_UTIL_BIN/services-generic/stop-spring-boot.sh user'

alias startdatahubsubmission='$DATAHUB_UTIL_BIN/services-generic/start-spring-boot.sh submission &'
alias stopdatahubsubmission='$DATAHUB_UTIL_BIN/services-generic/stop-spring-boot.sh submission'

alias startdatahubreport='$DATAHUB_UTIL_BIN/services-generic/start-spring-boot.sh report &'
alias stopdatahubreport='$DATAHUB_UTIL_BIN/services-generic/stop-spring-boot.sh report'

alias startdatahubemail='$DATAHUB_UTIL_BIN/services-generic/start-spring-boot.sh email &'
alias stopdatahubemail='$DATAHUB_UTIL_BIN/services-generic/stop-spring-boot.sh email'

alias startdatahubdownload='$DATAHUB_UTIL_BIN/services-generic/start-spring-boot.sh download &'
alias stopdatahubdownload='$DATAHUB_UTIL_BIN/services-generic/stop-spring-boot.sh download'

alias startdatahubservices='$DATAHUB_UTIL_BIN/services-generic/start-services.sh'
alias stopdatahubservices='$DATAHUB_UTIL_BIN/services-generic/stop-services.sh'

#alias startinfra='$CEDAR_UTIL_BIN/services-generic/startinfra.sh'
#alias stopinfra='$CEDAR_UTIL_BIN/services-generic/stopinfra.sh'
#
#alias ij="'/Applications/IntelliJ IDEA.app/Contents/MacOS/idea'"
