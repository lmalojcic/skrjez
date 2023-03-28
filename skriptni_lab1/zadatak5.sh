#!/bin/bash

echo "$@"

if [ $# != 2 ] ; then
    echo "Treba upisati 2 argumenta"
    exit 1
fi

directory=$1
pattern=$2

if [ ! -d "$directory" ];then
    echo " Prvi argument mora biti direktorij"
    exit 1
fi

find "$directory" -name "$pattern" -exec cat {} + | wc -l