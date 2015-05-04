#!/bin/bash

t=1

while true; do
    $*;
    if [[ $? -eq 0 ]]; then
        break;
    fi
    echo "sleeping $t seconds before retry...";
    sleep $t;
    t=$(($t * 2))
done;
