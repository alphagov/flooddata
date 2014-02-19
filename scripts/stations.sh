#!/bin/bash

#
#  process new unzipped stations xml files into an equivalent tsv
#
set -e

cd ${FLOODDATA:?}
mkdir -p cache

find files/ENT_7001 -name \*.xml |
    while read xml
    do
        tsv=cache/$xml.tsv
        if [ "$xml" -nt "$tsv" ]
        then
            mkdir -p $(dirname "$tsv")
            (
                set -x
                xsltproc templates/stations.xsl $xml
            ) | grep -v 'Gate Position' > $tsv
        fi
    done

find cache/files/ENT_7001 -name \*.tsv |
    xargs cat |
    sort -n |
    uniq > data/stations.tsv

#
#  zip latest stations.tsv
#  - for backwards compatibility with big file made for the hackday
#
gzip -c < data/stations.tsv > data/stations.tsv.gz

