#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/helpers.sh"

if ! exists npm; then
  echo "NPM not available. Skipping!"
else
  npm install -g depcheck
  npm install -g serve
  npm install -g typescript
  npm install -g yo
  npm install -g nodemon
  npm install -g node-gyp node-gyp-build
fi
