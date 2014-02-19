#!/bin/bash

#
#  process new unzipped stations xml files into an equivalent tsv
#
set -e

cd ${FLOODDATA:?}
mkdir -p cache www www/stations
export tmpfile=/tmp/stations.$$
export header=/tmp/stations-header

find files/ENT_7001 -name \*.xml |
    while read xml
    do
        tsv=cache/$xml.tsv
        if [ "$xml" -nt "$tsv" ]
        then
            #
            #  convert XML to TSV
            #  - filter information deemed sensitive
            #
            mkdir -p $(dirname "$tsv")
            (
                set -x
                xsltproc templates/stations.xsl $xml
            ) |
            grep -v 'Gate Position' > $tsv

            #
            #  capture header
            #
            head -1 $tsv > $header

            #
            #  add to daily file
            #
            cat $tsv |
            awk -F'	' '
               $1 ~ /^20[0-9][0-9]-[0-9][0-9]-[0-9][0-9]/ {
                    day=$1;
                    sub(/T.*$/,"",day);
                    gsub(/-/,"",day);
                    file="www/stations/" day ".tsv";
                    print >> file;
                    print file
               }'
        fi
    done |

    #
    #  de-dupe updated daily files
    #
    sort -u |
    while read file
    do
        echo "updating $file .." >&2
        (
            cat $header
            cat $file
        ) |
        sort -n |
        uniq > $tmpfile
        mv $tmpfile $file
    done

#
#  generate latest file
#
ls -1 www/stations/*.tsv |
    tail -2 |
    xargs cat |
    tail -2000 |
    sort -n |
    uniq > www/stations.tsv

#
#  zip latest stations.tsv
#  - for backwards compatibility with big file made for the hackday
#
gzip -c < www/stations.tsv > www/stations.tsv.gz
