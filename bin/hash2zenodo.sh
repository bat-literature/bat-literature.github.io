#!/bin/bash
# 
# associate zenodo deposit ids of known zenodo response corpus to known batlit content hashes
#

set -x

SCRIPT_DIR=$(dirname $0)
DATA_DIR="${SCRIPT_DIR}/../zenodo"

ZENODO_VERSION=$(preston head --algo md5 --data-dir "${DATA_DIR}")


logDepositId() {
 preston cat --data-dir "${DATA_DIR}"\
 | jq\
 --arg version "${ZENODO_VERSION}"\
 --raw-output\
 'select(.hits.hits | length > 0) | .hits.hits[0] | [(.metadata.alternate_identifiers[] | select(.identifier | test("hash://md5/[0-9a-f]{32}"?)) | .identifier), .doi, .doi_url, $version] | @csv' 
}

cat <(echo "attachmentId,alternativeDoi,alternativeDoiUrl,zenodoResponseCorpusId")\
 <(preston cat --data-dir "${DATA_DIR}" "${ZENODO_VERSION}"\
 | grep hasVersion\
 | grep -Eo "<hash://md5/[0-9a-f]{32}"\
 | tr -d '<'\
 | logDepositId)
