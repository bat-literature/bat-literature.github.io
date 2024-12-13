#!/bin/bash
#
# generates a list of references in most recent version of the bat literature corpus
#
#

set -x

SCRIPT_DIR=$(dirname $0)
HEAD=$(cat "${SCRIPT_DIR}/../HEAD")

mlr --csv join -j attachment\
 -f\
 <(cat <(echo "attachment,id,authors,date,title,type,volume,pages,journal,doi")\
 <(preston cat ${HEAD}\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat --algo md5\
 | jq -c .[]\
 | jq --raw-output -c 'select(.data.creators != null) | select(.links.attachment.href != null) | [.links.attachment.href, .links.alternate.href, (.data.creators | map(.lastName) | join(" | ")), ( .data.date, .data.title, .data.publicationTitle, .data.itemType, .data.volume, .data.pages, .data.DOI)] | @csv'\
 | sort)\
 | tr '\t' ' ')\
 <(cat <(echo "attachment,corpusId,attachmentId")\
 <(preston cat ${HEAD}\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat --algo md5\
 | jq -c .[]\
 | jq --raw-output --arg HEAD "$HEAD" 'select(.data.md5 != null) | [.links.self.href, $HEAD, .data.md5] | @csv'\
 | sort))\
 | mlr --csv reorder -e -f id,attachment,corpusId,attachmentId\
 | sed -E 's+([a-f0-9]{32})$+hash://md5/\1+g'\
 | mlr --csv reorder -e -f id,attachment,attachmentId,corpusId\
 
