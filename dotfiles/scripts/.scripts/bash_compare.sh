#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# TO COMPARE STRINGS 
# Prints "Equal"
if [[ "foo" == "foo" ]]; then
  echo "Equal"
else
  echo "Not equal"
fi

# Prints "Not equal"
if [[ "foo" != "bar" ]]; then
  echo "Not equal"
else
  echo "Equal"
fi

# TO COMPARE NUMBERS

# Prints "Equal"
if [[ 1 -eq 1 ]]; then
  echo "Equal"
else
  echo "Not equal"
fi

# Prints "Equal"
if [[ 1 -ne 2 ]]; then
  echo "Not equal"
else
  echo "Equal"
fi

# Prints "5 is greater"
if [[ 5 -gt 4 ]]; then
  echo "5 is greater"
else
  echo "5 is not greater"
fi


