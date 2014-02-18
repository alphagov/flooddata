#!/bin/bash

#
#  generate indexes, publish data
#
set -e -x
mkdir -p $FLOODDATA/data
cd $FLOODDATA/data

mkdir -p www
gzip -c < ~/data/stations.tsv > ~/www/stations.tsv.gz
