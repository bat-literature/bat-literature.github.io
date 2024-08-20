#!/bin/bash
#
# Generates Zenodo metadata records associated with BatLit references.
#
#

set -x

SCRIPT_DIR=$(dirname $0)
HEAD=$(cat ${SCRIPT_DIR}/../HEAD)
ZENODO_COMMUNITY=batlit-review-md5-26f7ce5dd404e33c6570edd4ba250d20

stream_matching_items() {
  preston cat ${HEAD}\
  | grep -f "$1"\
  | grep -E "cut:hash://md5"\
  | grep hasVersion\
  | preston zotero-stream --algo md5 --communities $ZENODO_COMMUNITY
}

random_closed_articles() {
  preston cat $HEAD\
  | grep cut:\
  | grep hasVersion\
  | preston cat\
  | jq --raw-output -c\
  'select(.data.itemType == "journalArticle") | select(.data.date | test("2[0-9]{3}")) | .key'\
  | shuf\
  | head
}

random_closed_articles() {
  preston cat $HEAD\
  | grep cut:\
  | grep hasVersion\
  | preston cat\
  | jq --raw-output -c\
  'select(.data.itemType == "journalArticle") | select(.data.date | test("2[0-9]{3}")) | .key'\
  | shuf\
  | head
}

random_closed_non_articles() {
  preston cat $HEAD\
  | grep cut:\
  | grep hasVersion\
  | preston cat\
  | jq --raw-output -c\
  'select(.data.itemType != "journalArticle") | select(.data.date | test("2[0-9]{3}")) | .key'\
  | shuf\
  | head
}

random_open_non_articles() {
  preston cat $HEAD\
  | grep cut:\
  | grep hasVersion\
  | preston cat\
  | jq --raw-output -c\
  'select(.data.itemType != "journalArticle") | select(.data.date | test("2[0-9]{3}") | not) | .key'\
  | shuf\
  | head
}

random_open_articles() {
  preston cat $HEAD\
  | grep cut:\
  | grep hasVersion\
  | preston cat\
  | jq --raw-output -c\
  'select(.data.itemType == "journalArticle") | select(.data.date | test("2[0-9]{3}") | not) | .key'\
  | shuf\
  | head
}



stream_matching_items <(random_open_articles)
stream_matching_items <(random_closed_articles)
stream_matching_items <(random_open_non_articles)
stream_matching_items <(random_closed_non_articles)
