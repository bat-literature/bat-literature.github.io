#!/bin/bash
# 
# tracks zenodo query associated with no longer active Zotero BatLit Records
#

SCRIPT_DIR=$(dirname $0)
DATA_DIR="${SCRIPT_DIR}/../zenodo-to-retire"

preston track --data-dir "${DATA_DIR}"\
 --algo md5\
 -f <(bash "${SCRIPT_DIR}/list-retired-zotero-items.sh"\
 | xargs -I{} echo "https://zenodo.org/api/communities/batlit/records?q=%22{}%22&l=list&limit=1")

preston head --data-dir "${DATA_DIR}" --algo md5\
 > "${DATA_DIR}/HEAD"
