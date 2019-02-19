#!/bin/bash

LOCUST_CMD="/usr/local/bin/locust"
LOCUST_OPTS="-f $SCENARIO_FILE --host=$TARGET_URL"
LOCUST_MODE=${LOCUST_MODE:-standalone}

if [[ -z "${SCENARIO_FILE}" ]]; then
  echo "You must add path to -e SCENARIO_FILE=/locustfile.py"
  exit 1
fi
if [[ -z "${TARGET_URL}" ]]; then
  echo "You must add -e TARGET_URL=https://example.com"
  exit 1
fi

if [ "$LOCUST_MODE" = "master" ]; then
  LOCUST_OPTS="$LOCUST_OPTS --master"
elif [ "$LOCUST_MODE" = "slave" ]; then
  LOCUST_OPTS="$LOCUST_OPTS --slave --master-host=$MASTER_HOST"
fi

echo "=> Starting locust"
echo "$LOCUST_CMD $LOCUST_OPTS"
cd $WORKDIR
$LOCUST_CMD $LOCUST_OPTS
