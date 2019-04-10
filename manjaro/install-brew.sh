#!/bin/bash -e

# Install Homebrew unless it's already installed
if [ -z "$(which brew)" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
fi

# Make sure we’re using the latest Homebrew & upgrade all installed formulae.
brew update && brew upgrade

# Install some apps
#brew install direnv
#brew install envchain

# Remove outdated versions from the cellar
brew cleanup 

