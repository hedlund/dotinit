#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"


# Install nvm
if ! exists nvm; then
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
  
  # Update the current shell with the nvm config
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

fi

# Install Node
if ! exists node; then
  echo "Installing Node.js..."
  nvm install node

  #curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
  #sudo apt-get install -y nodejs
fi

# Install Yarn
if ! exists yarn; then
  echo "Installing Yarn..."
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update
  sudo apt-get install -y yarn
fi
