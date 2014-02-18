#!/bin/bash
exec >> /var/log/flooddata 2>&1

. ~/flooddata.env

echo ::::::::::::::::
date

set -x
time $FLOODDATA/scripts/pull.sh
time $FLOODDATA/scripts/unzip.sh
time $FLOODDATA/scripts/process.sh
time $FLOODDATA/scripts/push.sh
set +x

date
echo ::::::end:::::::

exit 0
