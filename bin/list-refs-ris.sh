#!/bin/bash
#
# Generates a list of references in most recent version of the bat literature corpus
# in RIS format.
#
#

set -x

SCRIPT_DIR=$(realpath $(dirname $0))
HEAD=$(cat "${SCRIPT_DIR}/../HEAD")

PRESTON_OPTS="--algo md5 --data-dir ${SCRIPT_DIR}/../data"

preston cat ${PRESTON_OPTS} "${HEAD}" \
 | grep "items" \
 | grep -v "file/view" \
 | preston zotero2ris ${PRESTON_OPTS} --anchor "${HEAD}"
