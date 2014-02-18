#!/bin/bash

#
#  push information to http://flooddata.alphagov.co.uk
#

s3cmd sync ~/www/ s3://flooddata.alphagov.co.uk
