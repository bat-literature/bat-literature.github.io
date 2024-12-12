#!/bin/bash
# 
# tracks zenodo query associated with known, versioned batlit content
#

SCRIPT_DIR=$(dirname $0)
DATA_DIR="${SCRIPT_DIR}/../zenodo"

preston track --data-dir "${DATA_DIR}"\
 --algo md5\
 -f <(bash "${SCRIPT_DIR}/list-refs.sh"\
 | mlr --csv cut -f attachmentId\
 | tail -n+2\
 | xargs -I{} echo "https://zenodo.org/api/communities/batlit/records?q=%22{}%22&l=list&limit=1")

preston head --data-dir "${DATA_DIR}" --algo md5\
 > "${DATA_DIR}/HEAD"
