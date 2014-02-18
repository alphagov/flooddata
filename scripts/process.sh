#!/bin/bash

#
#  process xml files into a tsv
#
[ -z "$FLOODDATA" ] && export FLOODDATA=.

mkdir -p $FLOODDATA/data

cd $FLOODDATA/files/ENT_7001

(
	find . -name \*.xml |
		xargs xsltproc ~/scripts/stations.xsl 
) |
	grep -v 'Gate Position' |
	sort -n |
	uniq > ~/data/stations.tsv

#
# compress and publish to the www directory
#
gzip -c < ~/data/stations.tsv > ~/www/stations.tsv.gz
