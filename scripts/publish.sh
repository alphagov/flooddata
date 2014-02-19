#!/bin/bash

#
#  generate static site in www
#
set -e

cd ${FLOODDATA:?}

mkdir -p www tmp

#
#  generate index page
#
cd $FLOODDATA/www
php ../templates/index.php > index.html
