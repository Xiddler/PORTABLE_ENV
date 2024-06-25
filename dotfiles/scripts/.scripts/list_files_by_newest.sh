#!/usr/sbin/env bash 

# 2024-06-16
# https://mywiki.wooledge.org/BashFAQ/099

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

files=(*) 

newest=${files[0]}

for f in "${files[@]}"; do

  if [[ $f -nt $newest ]]; then

    newest=$f
    echo $newest

  fi

done



