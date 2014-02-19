#!/bin/bash

#
#  unzip files
#
cd ${FLOODDATA:?}/files/ENT_7001

for zip in *.zip
do
	dir=$(basename $zip .zip)
	mkdir -p $dir
	unzip -q -LL -u -o $zip -d $dir
done
