#!/bin/bash

foldl() {
    f="$@"
    read acc
    while read elem; do
        acc="$(printf "$acc\n$elem" | $f)"
    done
    echo $acc
}

