#!/bin/bash

#
#  generate static site in www
#
set -e

cd ${FLOODDATA:?}

mkdir -p data www tmp

#
#  copy files
#
rsync -a data/* www/
rm www/stations.tsv

#
#  zip index
#  - for backwards compatibility with big file made for the hackday
#
gzip -c < data/stations.tsv > tmp/stations.tsv.gz
mv tmp/stations.tsv.gz www/

#
#  index
#
cd $FLOODDATA/www
php ../templates/index.php > index.html
