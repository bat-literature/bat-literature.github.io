#!/bin/bash
#
# generates a list of references in most recent version of the bat literature corpus
#
#

cat <(echo "authors,date,title,journal")\
 <(preston head\
 | preston cat\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat\
 | jq -c .[]\
 | jq --raw-output -c '.data | select(has("creators")) | [(.creators | map(.lastName) | join(" | ")),  .date, .title, .publicationTitle] | @csv')

