#!/bin/bash
#
# Check for suspected duplicates by selecting records that 
# share the same attachmentId (or pdf content).
#
# for context, see https://github.com/bat-literature/bat-literature.github.io/issues/51 
#

SCRIPT_DIR=$(dirname $0)
REFS="${SCRIPT_DIR}/../refs.tsv"

cat "${REFS}"\
 | mlr --tsvlite cut -f attachmentId\
 | sort | uniq -c | sort -nr\
 | grep -Ev "^[ ]+1"\
 | grep -o hash:.*\
 > "${SCRIPT_DIR}/../suspected-duplicate-ids.txt"

 cat\
 <(cat "${REFS}" | head -1)\
 <(cat "${REFS}" | grep -f "${SCRIPT_DIR}/../suspected-duplicate-ids.txt")\
 | mlr --itsvlite --ocsv sort -f attachmentId\
 > "${SCRIPT_DIR}/../suspected-duplicates.csv"

cat\
 <(cat "${REFS}" | head -1)\
 <(cat "${REFS}" | grep -f "${SCRIPT_DIR}/../suspected-duplicate-ids.txt")\
 | mlr --itsvlite --oxtab sort -f attachmentId\
 > "${SCRIPT_DIR}/../suspected-duplicates.txt"
