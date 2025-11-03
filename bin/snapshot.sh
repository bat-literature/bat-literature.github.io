#!/bin/bash
#
# Creates a snapshot (aka a bill of material) associated with the literature references in Zotero group.
# Following, the metadata associated with the snapshot appended to the data/ folder. 
# Also, the zotero/refs files are updated as well as the _data/versions.csv and versions/ directory. 
# Once this workflow completes, the results can be shared by committing the changes to a git repository if desired.
#
# Usage:
# ./bin/snapshot.sh
# 
# The scripted workflow prompts user to enter Zotero API Key and Zotero Group URL before creating the snapshot.
#
# Requirements:
# This workflow relies on the commandline programs Preston, mlr, jq, pv. Please make sure to install them before running this workflow.
# 
 

set -x

SCRIPT_DIR=$(realpath $(dirname $0))

ZOTERO_GROUP_URL="https://example.org"
TOKEN=


DIST_DIR_REL=${SCRIPT_DIR}/../target/$(uuidgen)
mkdir -p ${DIST_DIR_REL}/data ${DIST_DIR_REL}/tmp
ln -n -f -s ${DIST_DIR_REL} ${SCRIPT_DIR}/../target/zotero 

DIST_DIR=$(realpath ${DIST_DIR_REL})

DIST_DATA_DIR=$(realpath ${DIST_DIR}/data)
DIST_TMP_DIR=$(realpath ${DIST_DIR}/tmp)

DATA_DIR=${SCRIPT_DIR}/../data

PRESTON_OPTS="--algo md5 --data-dir ${DATA_DIR} --remote file://${DIST_DATA_DIR}"
PRESTON_SNAPSHOT_OPTS="--algo md5 --data-dir ${DIST_DATA_DIR} --remote file://${DATA_DIR}"

snapshot_id() {
  preston head ${PRESTON_OPTS}
}

echo Creating a Zotero Snapshot...

gather_config() {
  read -s -p "Enter Zotero API Token: " TOKEN
  echo
  read -p "Enter Zotero Group URL: " ZOTERO_GROUP_URL
}
gather_config

export ZOTERO_TOKEN="${TOKEN}"

echo Current snapshot has id:
echo $(snapshot_id)

echo "Creating next snapshot (this may take a while)"

LOG="${DIST_DIR/snapshot.nq}"
LOG_ERROR="${DIST_DIR/snapshot.err}"

make_snapshot() {
  # first, populate history index
  preston history ${PRESTON_SNAPSHOT_OPTS}

  preston track ${PRESTON_SNAPSHOT_OPTS} ${ZOTERO_GROUP_URL}
}

make_snapshot 

echo "Propagating recent Zotero metadata snapshot..."
preston head --no-progress ${PRESTON_OPTS}\
 | tee ${SCRIPT_DIR}/../HEAD\
 | preston cat --no-progress ${PRESTON_OPTS}\
 | grep "https://api.zotero.org/groups/"\
 | grep -v "file/view"\
 | preston cat --no-progress ${PRESTON_OPTS}\
 | pv\
 > /dev/null 

echo "updating refs"

${SCRIPT_DIR}/list-refs.sh > ${SCRIPT_DIR}/../zotero/refs.csv
cat ${SCRIPT_DIR}/../zotero/refs.csv | head -n101 > ${SCRIPT_DIR}/../zotero/refs-100.csv
cat ${SCRIPT_DIR}/../zotero/refs.csv | mlr --icsv --otsvlite cat > ${SCRIPT_DIR}/../zotero/refs.tsv
cat ${SCRIPT_DIR}/../zotero/refs.tsv | head -n101 > ${SCRIPT_DIR}/../zotero/refs-100.tsv

VERSION=$(cat ${SCRIPT_DIR}/../_data/versions.csv | tail -n1 | grep -oE "^[^,]+")
VERSION_SUFFIX=$(echo $VERSION | grep -oE "[0-9]+$")
VERSION_SUFFIX_NEXT=$((VERSION_SUFFIX+1))
VERSION_PREFIX=$(echo ${VERSION} | sed -E "s/[0-9]+$//g")
VERSION_NEXT=${VERSION_PREFIX}${VERSION_SUFFIX_NEXT}
echo -ne "${VERSION_NEXT},"\
 >> ${SCRIPT_DIR}/../_data/versions.csv  
preston head ${PRESTON_OPTS}\
 >> ${SCRIPT_DIR}/../_data/versions.csv 

echo $(preston head $PRESTON_OPTS})\
 > ${SCRIPT_DIR}/../versions/${VERSION_NEXT}

echo "Zotero snapshot ${VERSION_NEXT} complete."
echo "Please review local changes and commit when approved." 
echo "Then, proceed with bin/deposit.sh to deposit associated records with Zenodo."
