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

	    #
	    # remove gates
            #
            grep -v 'Gate Position' |

	    #
	    # fixup groundwater locations
	    #
	    awk -F$'\t' '
		BEGIN { OFS=FS }
		{
		    if ($7 ~ /Groundwater/) {
			$4 = gensub(/^(..)([0-9][0-9])...([0-9][0-9])...$/, "\\1\\2\\3", "", $4);
			$4 = gensub(/^(..)([0-9][0-9])..([0-9][0-9])..$/,"\\1\\2\\3", "", $4);
			$4 = gensub(/^(..)([0-9][0-9]).([0-9][0-9]).$/,"\\1\\2\\3", "", $4);
		    }
		    print;
		}' > $tsv

            #
            #  capture header
            #
            head -1 $tsv > $header

            #
            #  add to daily file
            #
            cat $tsv |
            awk -F$'\t' '
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
#  generate short feed of latest results
#
ls -1 www/stations/*.tsv |
    tail -2 | (
	cat $header
        xargs cat |
	tail -10000
    ) |
    sort -n |
    uniq > www/stations.tsv

#
#  gzip latest stations.tsv
#  - for backwards compatibility with the big file made for the #floodhack hackday
#
gzip -c < www/stations.tsv > www/stations.tsv.gz
