#!/bin/bash

#
#  generate static site in www
#
set -e

cd ${FLOODDATA:?}

mkdir -p data tmp www www/stations

gzip -c < data/stations.tsv > tmp/stations.tsv.gz
mv tmp/stations.tsv.gz www/

#
#  index
#
cd $FLOODDATA/www
php ../templates/index.php > index.html
