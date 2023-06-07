#!/bin/bash

set -eu

if [ -n "${DEBUG:-}" ]; then
    set -x
fi

# One line to get the exact location of this script.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
