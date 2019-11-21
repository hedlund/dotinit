#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"


# Install n & node
if [ ! -d "$HOME/.n" ]; then
  if exists node; then
    echo "Uninstalling old Node.js version..."
    sudo apt-get remove -y nodejs
  fi

  echo "Installing n..."
  export N_PREFIX="$HOME/.n"
  export PATH="$PATH:$N_PREFIX/bin"
  curl -L https://git.io/n-install | bash
fi

# Install Yarn
if ! exists yarn; then
  echo "Installing Yarn..."
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update
  sudo apt-get install -y yarn
fi
