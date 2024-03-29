#!/bin/bash

if [ $# -ne 2 ]; then
    echo "usage: ./rm_n.sh <dir> <n>" 1>&2
    exit 1
fi

dir=$1
n=$2

find $dir -type f -size +${n}c -exec rm -f {} \;