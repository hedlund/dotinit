#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

# Install Node
if ! exists node; then
  echo "Installing Node.js..."
  curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
  sudo apt install -y nodejs
fi

# Install Yarn
if ! exists yarn; then
  echo "Installing Yarn..."
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update
  sudo apt install -y yarn
fi

# Configure Node to install global packages without needing sudo
mkdir ${HOME}/.npm-packages
npm config set prefix ${HOME}/.npm-packages
