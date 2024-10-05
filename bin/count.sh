#!/bin/bash
#
# counts number of pages of pdfs in a version of batlit,
# with each line the page count of a publication included in batlit.
# Depends on Preston, GNU's parallel and imagemagick's identify. 
# 
# usage: 
#   ./count.sh [url of remote with pdfs]
#
# example:
#    ./count.sh https://example.org/data
#    8
#    8
#    9
#    4
#    ...
#


set -x
SCRIPT_DIR=${PWD}/$(dirname $0)
HEAD=$(cat "${SCRIPT_DIR}/../HEAD")

REMOTES=${1:-"https://example.org/data"}

preston cat --no-cache --remote "${REMOTES}" "${HEAD}"\
       	| grep "file/view"\
       	| grep hasVersion\
       	| grep -Eo "hash[^>]+"\
       	| sort\
       	| uniq\
       	| parallel "bash ${SCRIPT_DIR}/count-pages.sh {1} ${REMOTES}"
