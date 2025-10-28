#!/bin/bash
#
# assumes ZOTERO_TOKEN available as environment variables.
#

SCRIPT_DIR=$(dirname $0)
HEAD=$(cat "${SCRIPT_DIR}/../HEAD")


preston track\
       	--anchor ${HEAD}\
       	--algo md5 https://www.zotero.org/groups/5435545/bat_literature_project

