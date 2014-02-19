#!/bin/bash

#
#  pull files from fwfi server
#
set -e

for dir in ENT_7001 ENT_7006
do
	mkdir -p ${FLOODDATA:?}/files/$dir
	cd ${FLOODDATA}/files/$dir

	sftp -q -i ${FLOODDATA_SFTP_IDENTITY} -oPort=${FLOODDATA_SFTP_PORT} ${FLOODDATA_SFTP_PATH} <<-!
cd $dir
get *
!
done
