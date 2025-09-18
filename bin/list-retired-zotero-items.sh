#!/bin/bash
#
# Lists Zotero record items available in older BatLit versions, 
# but not in the current one.

SCRIPT_DIR=$(dirname $0)
DATA_DIR="${SCRIPT_DIR}/../data"

list_all() {
  preston ls --algo md5 --data-dir ${DATA_DIR}\
  | grep "items[?]"\
  | grep hasVersion\
  | preston cat --algo md5 --data-dir ${DATA_DIR}\
  | jq --raw-output .[].key\
  | sort\
  | uniq
}

list_current() {
  cat ${SCRIPT_DIR}/../HEAD\
  | preston cat --data-dir ${DATA_DIR}\
  | grep "items[?]"\
  | grep hasVersion\
  | preston cat --algo md5 --data-dir ${DATA_DIR}\
  | jq --raw-output .[].key\
  | sort\
  | uniq
}

list_retired() {
 diff <(list_all) <(list_current)\
  | grep "< "\
  | grep -Eo "[A-Z0-9]{8}"\
  | sed 's/^/urn:lsid:zotero.org:groups:5435545:items:/g'
}

list_retired  
