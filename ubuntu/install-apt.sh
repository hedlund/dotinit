#!/bin/bash -e

# As this script not only is used for native OS installations,
# but also WSL, it should avoid installing desktop apps.

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

# Make sure we are up to date
sudo apt-get update && sudo apt-get upgrade -y

# Just make sure some basics are there
sudo apt-get install -y curl wget nano rsync telnet
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-get install -y git git-lfs
sudo apt-get install -y gpg scdaemon gnupg-agent
sudo apt-get install -y software-properties-common

# Then install a bunch of stuff
sudo apt-get install -y ack
sudo apt-get install -y default-jdk
sudo apt-get install -y direnv
sudo apt-get install -y golang
sudo apt-get install -y httpie
sudo apt-get install -y nodejs npm
sudo apt-get install -y protobuf-compiler
sudo apt-get install -y ruby ruby-dev
sudo apt-get install -y shellcheck
sudo apt-get install -y snapd
sudo apt-get install -y tig
sudo apt-get install -y tree
sudo apt-get install -y whois
sudo apt-get install -y xsel

# Docker is not needed in all environments
if [ "$1" != "--no-docker" ]; then
  sudo apt-get install -y docker.io docker-compose
fi

# Some libraries that are needed down the line
sudo apt-get install -y libreadline-dev
sudo apt-get install -y libsecret-1-dev

# Install Yarn
if ! exists yarn; then
  echo "Installing Yarn..."
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install -y yarn
fi

# Install Google Cloud SDK
if ! exists gcloud; then
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl -sS https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
  sudo apt-get update && sudo apt-get install -y google-cloud-sdk
fi

# Install Github CLI
if ! exists gh; then
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
  sudo apt-add-repository https://cli.github.com/packages
  sudo apt update && sudo apt install -y gh
fi

# Cleanup
sudo apt-get autoremove -y
