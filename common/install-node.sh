#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/helpers.sh"

if ! exists nvm; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  # Install the latest version of node
  nvm install node
fi

if ! exists npm; then
  echo "NPM not available. Skipping!"
else
  npm install -g depcheck
  npm install -g serve
  npm install -g typescript
  npm install -g yo
  npm install -g nodemon
fi
