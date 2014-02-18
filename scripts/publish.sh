#!/bin/bash

#
#  turn data/stations.tsv into a latest and daily files
#
set -e -x
mkdir -p $FLOODDATA/data
cd $FLOODDATA/data


#
# compress and publish to the www directory
#
gzip -c < ~/data/stations.tsv > ~/www/stations.tsv.gz
