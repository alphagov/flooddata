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
rsync -av data/* www/

#
#  generate index page
#
cd $FLOODDATA/www
php ../templates/index.php > index.html
