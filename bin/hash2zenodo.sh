#!/bin/bash
# 
# associate zenodo deposit ids to provided md5 hashes
#

SCRIPT_DIR=$(dirname $0)

cat <(echo "attachmentId,doi") <(preston track --data-dir "${SCRIPT_DIR}/../zenodo"\
 --algo md5\
 -f <(bash "${SCRIPT_DIR}/list-refs.sh" | mlr --csv cut -f attachmentId | tail -n+2 | xargs -I{} echo "https://zenodo.org/api/communities/batlit/records?q=%22{}%22&l=list&limit=1")\
 | grep hasVersion\
 | grep "<hash://md5"\
 | preston cat --data-dir "${SCRIPT_DIR}/../zenodo/"\
 | jq --raw-output 'select(.hits.hits | length > 0) | .hits.hits[0] | [(.metadata.alternate_identifiers[] | select(.identifier | test("hash://md5/[0-9a-f]{32}"?)) | .identifier), .doi] | @csv')
