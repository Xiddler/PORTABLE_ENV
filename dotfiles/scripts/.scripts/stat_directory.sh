#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR


previous="$(stat *)"

while sleep 60; do
    current="$(stat *)"
    if  [[ $current != $previous ]]; then
        echo "Some files changed."
    fi
    previous=$current
done

