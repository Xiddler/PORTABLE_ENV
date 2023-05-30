#!/bin/bash

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# no hangup - i.e. keep running

nohup python3 ~/Applications/flask_htmx_lanner/app.py > /dev/null 2>&1 &


