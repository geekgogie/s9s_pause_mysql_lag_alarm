#!/bin/bash

# set the vars below
CID=1 ## change this to the cluster id you need
HOURS_ACCEPTABLE_LAG=24 ## change the hours value that is acceptable to the lag you can
PAUSE_LOG_FILE="/var/log/s9s_pause_lag_alarm.log"

# constant vars
SBM=$(( ${HOURS_ACCEPTABLE_LAG} * (60 * 60) ))


if [[ $(s9s job --cluster-id ${CID} --list|egrep 'RUNNING.*Create.*Backup') ]]; then
   echo "Setting max_replication_lag option to ${SBM} seconds..." >> ${PAUSE_LOG_FILE}
   s9s cluster --change-config --cluster-id=${CID} --opt-name=max_replication_lag --opt-value=${SBM}
else
   # 10 seconds is default max_replication_lag value
   echo "Setting max_replication_lag option to 10 seconds..." >> ${PAUSE_LOG_FILE}
   s9s cluster --change-config --cluster-id=${CID} --opt-name=max_replication_lag --opt-value=10
fi
