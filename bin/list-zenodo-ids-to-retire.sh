#!/bin/bash
#
# lists zenodo deposit ids marked for retirement
#

SCRIPT_DIR=${dirname $0}
DATA_DIR="${SCRIPT_DIR}/../zenodo-to-retire"

preston ls --data-dir "${DATA_DIR}"\
 | grep hasVersion\
 | grep "zenodo.org/api/communities/batlit"\
 | preston cat --data-dir "${DATA_DIR}"\
 | jq '.["hits"] | select( .hits | length > 0) | .["hits"][0].id'
