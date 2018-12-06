#!/bin/bash

if [ -z "$(which npm)" ]; then
  echo "NPM not available. Skipping!"
else
  npm install -g depcheck
  npm install -g serve
  npm install -g typescript
  npm install -g yo
fi
