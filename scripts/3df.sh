#!/bin/bash

#
#  process 3DF.XML into dated file
#
set -e

cd ${FLOODDATA:?}
mkdir -p cache data/3df

xml=files/ENT_7006/3DF.XML
date=$(xsltproc templates/3df_date.xsl $xml)
dayfile=data/3df/$date.xml
cp $xml $dayfile

cp $xml data/3df.xml
