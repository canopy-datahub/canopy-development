#!/bin/bash
echo --------------------------------------------------------------------------------
echo Stopping DataHub $1 service
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shopt -s expand_aliases
source $DATAHUB_UTIL_BIN/set-dev-aliases.sh

BASE_PORT=8080
service=$1

case "$service" in
  download)   OFFSET=6; PATH="api/download/v1" ;;
  email)      OFFSET=5; PATH="api/email/v1" ;;
  entity)     OFFSET=7; PATH="api/entity/v1" ;;
  report)     OFFSET=4; PATH="api/report/v1" ;;
  search)     OFFSET=1; PATH="api/search/v1" ;;
  submission) OFFSET=3; PATH="api/submission-service/v1" ;;
  user)       OFFSET=2; PATH="api/user/v1" ;;
  *)
    echo "Unknown service: $service"
    echo "Available services: download email entity report search submission user"
    exit 1
    ;;
esac

PORT=$((BASE_PORT + OFFSET))

CURL=$(command -v curl || echo /usr/bin/curl)

echo "Stopping $service service on port $PORT..."
$CURL -i \
  -u "${DATAHUB_SPRING_MANAGEMENT_USER}:${DATAHUB_SPRING_MANAGEMENT_PASSWORD}" \
  -X POST "http://localhost:${PORT}/${PATH}/actuator/shutdown"
