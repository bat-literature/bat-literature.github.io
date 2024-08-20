#!/bin/bash
#
# 
#

SCRIPT_DIR=$(dirname $0)

cat ${SCRIPT_DIR}/../refs.tsv\
 | cut -f6\
 | grep -Eo "10[.][0-9]+/.*"\
 | sed 's+^+https://doi.org/+g'\
 | xargs -L1 curl -s -o /dev/null -w '%{http_code}\t%{url}\n'
