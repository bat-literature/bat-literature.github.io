#!/bin/bash
#
# count pages in provided pdf contentid/hash
#
#

preston cat "$1"\
 | identify -\
 | wc -l

