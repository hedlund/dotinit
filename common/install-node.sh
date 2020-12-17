#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/helpers.sh"

# Install n! & update node
if ! exists n; then
  echo "Installing n!..."
  export N_PREFIX="$HOME/.n"
  export PATH="$N_PREFIX/bin:$PATH"
  mkdir -p "$N_PREFIX"
  sudo npm install -g n

  # Install latest version of node
  n latest
fi

if ! exists npm; then
  echo "NPM not available. Skipping!"
else
  npm install -g nodemon
  npm install -g now
  npm install -g serve
fi
