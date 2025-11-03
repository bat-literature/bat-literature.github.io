#!/bin/bash
# 
# tracks zenodo query associated with known, versioned batlit content
#

SCRIPT_DIR=$(dirname $0)
DATA_DIR="${SCRIPT_DIR}/../zenodo"

ZENODO_ENDPOINT_URL=https://zenodo.org/
ZENODO_COMMUNITY=batlit

preston track --data-dir "${DATA_DIR}"\
 --algo md5\
 -f <(bash "${SCRIPT_DIR}/list-refs.sh"\
 | mlr --csv cut -f id\
 | tail -n+2\
 | grep -oE '[A-Z0-9]+$'\
 | sed 's+^+urn:lsid:zotero.org:groups:5435545:items:+g'\
 | xargs -I{} echo "${ZENODO_ENDPOINT_URL}/api/communities/${ZENODO_COMMUNITY}/records?q=%22{}%22&l=list&limit=1")

preston head --data-dir "${DATA_DIR}" --algo md5\
 > "${DATA_DIR}/HEAD"
