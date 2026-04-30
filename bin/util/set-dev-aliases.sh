#!/bin/bash

#DEV Util common locations
export CANOPY_UTIL_BIN=${CANOPY_DEVELOP_HOME}/bin/util/

# Repo location aliases

alias gocanopyentity='cd $CANOPY_HOME/canopy-service-entity'
alias gocanopysearch='cd $CANOPY_HOME/canopy-service-search'
alias gocanopyuser='cd $CANOPY_HOME/canopy-service-user'
alias gocanopysubmission='cd $CANOPY_HOME/canopy-service-submission'
alias gocanopyreport='cd $CANOPY_HOME/canopy-service-report'
alias gocanopyemail='cd $CANOPY_HOME/canopy-service-email'
alias gocanopydownload='cd $CANOPY_HOME/canopy-service-download'

alias gocanopyui='cd $CANOPY_HOME/canopy-ui-main'

alias sleepbetweenstarts='sleep 2'

alias startcanopyentity='$CANOPY_UTIL_BIN/services-generic/start-spring-boot.sh entity &'
alias stopcanopyentity='$CANOPY_UTIL_BIN/services-generic/stop-spring-boot.sh entity'

alias startcanopysearch='$CANOPY_UTIL_BIN/services-generic/start-spring-boot.sh search &'
alias stopcanopysearch='$CANOPY_UTIL_BIN/services-generic/stop-spring-boot.sh search'

alias startcanopyuser='$CANOPY_UTIL_BIN/services-generic/start-spring-boot.sh user &'
alias stopcanopyuser='$CANOPY_UTIL_BIN/services-generic/stop-spring-boot.sh user'

alias startcanopysubmission='$CANOPY_UTIL_BIN/services-generic/start-spring-boot.sh submission &'
alias stopcanopysubmission='$CANOPY_UTIL_BIN/services-generic/stop-spring-boot.sh submission'

alias startcanopyreport='$CANOPY_UTIL_BIN/services-generic/start-spring-boot.sh report &'
alias stopcanopyreport='$CANOPY_UTIL_BIN/services-generic/stop-spring-boot.sh report'

alias startcanopyemail='$CANOPY_UTIL_BIN/services-generic/start-spring-boot.sh email &'
alias stopcanopyemail='$CANOPY_UTIL_BIN/services-generic/stop-spring-boot.sh email'

alias startcanopydownload='$CANOPY_UTIL_BIN/services-generic/start-spring-boot.sh download &'
alias stopcanopydownload='$CANOPY_UTIL_BIN/services-generic/stop-spring-boot.sh download'

alias startcanopyservices='$CANOPY_UTIL_BIN/services-generic/start-services.sh'
alias stopcanopyservices='$CANOPY_UTIL_BIN/services-generic/stop-services.sh'
