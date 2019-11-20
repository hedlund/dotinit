#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/helpers.sh"

if ! exists npm; then
  echo "NPM not available. Skipping!"
else
  if ! exists nvm; then
    # Configure Node to install global packages without needing sudo
    mkdir -p ${HOME}/.npm-packages
    npm config set prefix ${HOME}/.npm-packages
  fi

  npm install -g depcheck
  npm install -g serve
  npm install -g typescript
  npm install -g yo
  npm install -g nodemon
fi
