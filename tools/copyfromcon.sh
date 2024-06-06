#!/bin/bash

set -eu

contop=/home/yoh/proj/CON/talks
for f in "$@"; do
    fcon=$(find "$contop" -iname "$f" | grep -v '2022-nih-compcore')
    if [ -z "$fcon" ]; then
        echo "Got no hits for $fcon" >&2
        exit 1
    fi
    fconr=$(relpath "$fcon" "$contop")
    d=$(dirname "$fconr")
    if [ ! -e "$d" ]; then
        mkdir "$d";
    fi
    cp "$fcon" "$fconr"
done
