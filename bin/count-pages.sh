#!/bin/bash
#
# count pages in provided pdf contentid/hash
#
#

REMOTES=${2:-https://example.org/data}

preston cat --no-progress --remote ${REMOTES} --no-cache "$1"\
 | identify -\
 | wc -l

