#!/bin/bash
#provjera postoje li 2 argumenta
if [ $# != 2 ] ; then
    echo "Treba upisati 2 argumenta"
    exit 1
fi

directory1="$1"
directory2="$2"
#provjera jesu li ti argumenti direktoriji
if [ ! -d "$directory1" ] || [ ! -d "$directory2" ]; then
    echo "Oba argumenta moraju biti postojeći direktoriji"
    exit 1
fi

for file in "$directory1"/*; do #iteriranje kroz datoteke u prvom direktoriju
    filename=$(basename "$file") #uzimanje samo imena datoteke (zato sto file ima cijeli path)
    if [ -f "$directory2/$filename" ]; then
        if [ "$file" -nt "$directory2/$filename" ]; then #ako datoteka vec postoji u drugom direktoriju, obavlja se provjera koja je novija
            echo "$file --> $directory2/$filename"
        fi
    else
        echo "$file --> $directory2/$filename" #ako datoteka ne postoji, samo je kopiramo u drugi direktorij
    fi
done

for file in "$directory2"/*; do
    filename=$(basename "$file")
    if [ -f "$directory1/$filename" ]; then
        if [ "$file" -nt "$directory1/$filename" ]; then
            echo "$file --> $directory1/$filename"
        fi
    else
        echo "$file --> $directory1/$filename"
    fi
done