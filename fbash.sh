#!/bin/bash

fold() {
    funct="$@"
	read acc
	while read elem; do
        acc="$(printf "%d$acc\n$elem" | $funct)"
    done
    echo $acc
}

list() {
    for i in "$@"; do
		echo "$i"
    done
}

rlist() {
	i="$#"
	while [ $i -gt 0 ]; do
  		eval "f=\${$i}"
  		echo "$f "
  		i=$((i-1))
	done
}

lambda() {
    lam() {
        unset last 
        
        for last; do
            shift
            if [[ $last = ":" ]]; then
                echo "$@"
                return
            else
                echo "read $last;"
            fi
        done
    }
    y="stdin"
    for i in "$@"; do
        if [[ $i = ":" ]]; then
            y="args"
        fi
    done
    if [[ "$y" = "stdin" ]]; then
        read funct
        eval $(lam "$@ : $funct")
    else
        eval $(lam "$@")
    fi
    unset y
    unset i
    unset funct 
}
