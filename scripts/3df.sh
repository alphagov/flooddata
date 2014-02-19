#!/bin/bash

#
#  process 3DF.XML into dated file
#
set -e

cd ${FLOODDATA:?}
mkdir -p cache www/3df

xml=files/ENT_7006/3DF.XML
date=$(xsltproc templates/3df_date.xsl $xml)
dayfile=www/3df/$date.xml
cp $xml $dayfile

cp $xml www/3df.xml
