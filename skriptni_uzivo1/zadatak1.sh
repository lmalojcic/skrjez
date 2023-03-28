#!/bin/bash

pattern=$1
file=$2

if [ $# != 2 ] ; then
    echo "Treba upisati 2 argumenta"
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "Drugi argument mora biti postojeća datoteka"
    exit 1
fi

echo "-------------------------------------------"
echo "Broj pristupa stranici: $pattern"
echo "  IP adresa   |  Br. pristupa"
echo "-------------------------------------------"

to_print=$(grep -E "$pattern" $file | grep -o -E "\b([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})\b" | sort | uniq -c | sort -nr | sed 's/^[[:space:]]*//')

array=(${to_print//\n/ })
for i in "${!array[@]}"; do
    if [ $((i%2)) = 0 ];then
        if [ "${array[i]}" -ne "1" ]; then
            echo -e "${array[$((i+1))]}\t${array[i]}"
        fi
    fi
done
echo "-------------------------------------------"