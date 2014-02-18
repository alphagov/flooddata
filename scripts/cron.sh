#!/bin/bash
exec >> /var/log/flooddata 2>&1

. ~/flooddata.env

echo ::::::::::::::::
date
cd ${FLOODDATA:?}

set -x
time scripts/pull.sh
time scripts/unzip.sh
time scripts/stations.sh
time scripts/3df.sh
time scripts/publish.sh
time scripts/push.sh
set +x

date
echo ::::::end:::::::

exit 0
