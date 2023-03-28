#!/bin/bash

directory=$1

if [ ! -d "$directory" ];then
    echo "Argument mora biti direktorij"
    exit 1
fi

declare -A groups

for file in "$directory"/*; do
    filename=$(basename "$file")
    date=$(echo "$filename" | cut -d'_' -f1)
    year=${date:0:4}
    month=${date:4:2}
    year_month="$month-$year"
    if [[ -z ${groups[$year_month]} ]]; then
        groups["$year_month"]="$filename"
    else
        groups["$year_month"]+="|$filename"
    fi
done

for group in "${!groups[@]}"; do
    echo ""
    echo "$group :"
    echo "----------"
    index=1
    readarray -t -d $'|' files <<< "${groups[$group]}"
    sorted_files=($(sort -n <<< "${files[@]}"))
    for file in "${sorted_files[@]}"; do
        echo "$index. $file"
        ((index++))
    done
    total=${#files[@]}
    echo "--- Ukupno: $total slika -----"
done


