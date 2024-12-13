#!/bin/bash
# 
# associate Zenodo DOIs with content in BatLit 
#

SCRIPT_DIR=$(dirname $0)

bash "${SCRIPT_DIR}/list-refs.sh"\
 | mlr --csv join -f <(bash ${SCRIPT_DIR}/hash2zenodo.sh) -j attachmentId\
 | mlr --csv reorder -e -f attachmentId,corpusId,alternativeDoi,alternativeDoiUrl,zenodoResponseCorpusId
