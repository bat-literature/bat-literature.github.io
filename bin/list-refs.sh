#!/bin/bash
#
# generates a list of references in most recent version of the bat literature corpus
#
#

cat <(echo "id,authors,date,title,journal,doi")\
 <(preston head --algo md5\
 | preston cat --algo md5\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat --algo md5\
 | jq -c .[]\
 | jq --raw-output -c 'select(.data.creators != null) | [.links.alternate.href, (.data.creators | map(.lastName) | join(" | ")), ( .data.date, .data.title, .data.publicationTitle, .data.DOI)] | @csv')

