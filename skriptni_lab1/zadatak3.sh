#!/bin/bash

directory=$1

if [ ! -d "$directory" ];then
    echo "Argument mora biti direktorij"
    exit 1
fi

for logfile in $(ls $directory/localhost_access_log.*-02-*.txt); do
    datum=$(echo $logfile | sed -n "s/.*localhost_access_log.\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9]\)\.txt/\3-\2-\1/p")
    echo "datum: $datum"
    echo '--------------------------------------------------'
    grep -o '"[^"]*"' $logfile | sort | uniq -c | sort -nr
done