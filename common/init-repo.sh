#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

sed -i "s|https://github.com/hedlund/dotinit\(.git\)\?|git@github.com:hedlund/dotinit.git|g" "$SCRIPT_DIR/../.git/config"
