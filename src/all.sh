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

# ignore main, master
git branch |grep -v main |grep -v master |xargs -l git branch -D
exit 0
