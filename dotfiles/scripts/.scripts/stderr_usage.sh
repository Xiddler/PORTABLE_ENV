#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

 the_best_dinosaur() {
  echo "Thinking..." >&2
  sleep 2
  echo "stegosaurus"
}

# Runs `the_best_dinosaur` function, storing its output in the variable `dino`.
dino="$(the_best_dinosaur)"

echo "The best dinosaur is $dino."


