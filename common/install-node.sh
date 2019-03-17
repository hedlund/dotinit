#!/bin/bash -e

if [ -z "$(which npm)" ]; then
  echo "NPM not available. Skipping!"
else
  # Configure Node to install global packages without needing sudo
  mkdir -p ${HOME}/.npm-packages
  npm config set prefix ${HOME}/.npm-packages

  npm install -g depcheck
  npm install -g serve
  npm install -g typescript
  npm install -g yo
  npm install -g nodemon
fi
