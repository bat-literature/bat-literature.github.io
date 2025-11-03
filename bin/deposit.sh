#!/bin/bash
#
# Deposit previously tracked Zotero literature records in Zenodo
#
# Usage: 
#
# ./deposit.sh
#
# Prompts user for Zenodo endpoint url, Zenodo community id, Zenodo API token, and method of update.
#
# Deposit methods include:
#  - only add new records - skips deposits associated with existing Zotero records, only deposit new records
#  - update metadata only - updates all Zenodo record metadata associated with existing deposits.
#  - new version - create new version for new and existing deposits associated with tracked Zotero records.
#

set -xe

SCRIPT_DIR=$(realpath $(dirname $0))

ZOTERO_GROUP_URL="https://example.org"
TOKEN=

DIST_DIR_REL=${SCRIPT_DIR}/../target/$(uuidgen)
mkdir -p ${DIST_DIR_REL}/data ${DIST_DIR_REL}/tmp
ln -n -f -s ${DIST_DIR_REL}/ ${SCRIPT_DIR}/../target/zenodo 

DIST_DIR=$(realpath ${DIST_DIR_REL})
DATA_DIR_ZOTERO=${SCRIPT_DIR}/../target/zotero/data

DIST_DATA_DIR=$(realpath ${DIST_DIR}/data)
DIST_TMP_DIR=$(realpath ${DIST_DIR}/tmp)

DATA_DIR=${SCRIPT_DIR}/../data

PRESTON_OPTS="--algo md5 --data-dir ${DATA_DIR}"
PRESTON_SNAPSHOT_OPTS="--algo md5 --data-dir ${DIST_DATA_DIR}"
PRESTON_ZOTERO_SNAPSHOT_OPTS="--algo md5 --no-cache --data-dir ${DIST_DATA_DIR} --remote file://${DATA_DIR_ZOTERO}"

snapshot_id() {
  preston head ${PRESTON_OPTS}
}


PS3="Please select Zenodo deposit method: "

select lng in "Update Metadata" "Deposit New Versions" "Add New Only"
do
    case $lng in
        "Update Metadata")
           ZENODO_UPDATE_OPT="--update-metadata-only"; 
           echo "$lng - that's what we're talking about"; break;;
        "Deposit New Versions")
           ZENODO_UPDATE_OPT="--new-version"; 
           echo "$lng - is your VM ready?"; break;;
        "Add New Only")
           ZENODO_UPDATE_OPT=""; 
           echo "$lng - let's prepare for a lot of compilation"; break;;
        *)
           echo "Try again";;
    esac
done

echo $ZENODO_UPDATE_OPT

echo Depositing records in Zenodo

gather_config() {
  read -s -p "Enter Zenodo API Token: " TOKEN
  echo
  read -p "Enter Zenodo Endpoint URL: " ENDPOINT
  echo
  read -p "Enter Zenodo Communities (comma separated): " COMMUNITIES

}
gather_config

export ZENODO_TOKEN="${TOKEN}"
export ZENODO_ENDPOINT="${ENDPOINT}"
COMMUNITY_OPTS="--community ${COMMUNITIES}" 

echo Current snapshot has id:
echo $(snapshot_id)

LOG="${DIST_DIR/deposit.nq}"
LOG_ERROR="${DIST_DIR/deposit.err}"

generate_zenodo_metadata() {
  echo "generating Zenodo metadata from most recent Zotero snapshot with id $(preston head ${PRESTON_OPTS}). "
  preston head ${PRESTON_OPTS}\
  | preston cat ${PRESTON_OPTS}\
  | preston zotero-stream ${PRESTON_ZOTERO_SNAPSHOT_OPTS} ${COMMUNITY_OPTS}\
  | preston track ${PRESTON_SNAPSHOT_OPTS}
}

generate_zenodo_metadata

deposit_records() {
  preston head ${PRESTON_SNAPSHOT_OPTS}\
  | preston cat ${PRESTON_SNAPSHOT_OPTS}\
  | preston zenodo ${ZENODO_UPDATE_OPT} ${PRESTON_ZOTERO_SNAPSHOT_OPTS} ${COMMUNITY_OPTS}
} 

deposit_records


associate_records() {
  ${SCRIPT_DIR}/track-zenodo-associations.sh "${ZENODO_ENDPOINT}" $(echo ${COMMUNITIES} | tr ',' '\n' | head -1)
}
echo "record associations between Zotero records and Zenodo deposits"
associate_records

echo "update literature reference list with Zenodo associations"

${SCRIPT_DIR}/list-refs-zenodo.sh > ${SCRIPT_DIR}/../zenodo/refs.csv
cat ${SCRIPT_DIR}/../zenodo/refs.csv | head -n101 > ${SCRIPT_DIR}/../zenodo/refs-100.csv
cat ${SCRIPT_DIR}/../zenodo/refs.csv | mlr --icsv --otsvlite cat > ${SCRIPT_DIR}/../zenodo/refs.tsv
cat ${SCRIPT_DIR}/../zenodo/refs.tsv | head -n101 > ${SCRIPT_DIR}/../zenodo/refs-100.tsv

echo "Zenodo deposit of $(snapshot_id) complete."
echo "Please review local changes and commit when approved." 
echo "Then, inspect associated Zenodo records."
