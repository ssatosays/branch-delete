#!/bin/bash

PWD=`pwd`
if [ ! -e ./.git ]; then
    echo "failed: not a git repository. (${PWD})"
    exit 1
fi

c=`git branch |grep -v main |grep -v master| wc -l`
if [ ${c} -eq 0 ]; then
    echo "failed: no target branch. (${PWD})"
    exit 1
fi

ARGN=${#}
ARGS=("${@}")
for i in $(seq ${ARGN})
do
TARGET=${ARGS[${i}-1]}
# ignore main, master
if [ ! ${TARGET} == "main" ] && [ ! ${TARGET} == "master" ]; then
    git branch -D ${TARGET}
fi
done
exit 0
