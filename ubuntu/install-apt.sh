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
sudo apt-get install -y docker.io docker-compose
sudo apt-get install -y direnv
sudo apt-get install -y golang
sudo apt-get install -y hub
sudo apt-get install -y httpie
sudo apt-get install -y nodejs npm
sudo apt-get install -y ruby
sudo apt-get install -y tig
sudo apt-get install -y tree
sudo apt-get install -y whois
sudo apt-get install -y xsel

# Install Yarn
if ! exists yarn; then
  echo "Installing Yarn..."
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update
  sudo apt-get install -y yarn
fi



#envchain
#google cloud sdk
#blackbox

#now

#fzf, pstree, z,


# Cleanup
sudo apt-get autoremove -y
