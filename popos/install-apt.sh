#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

sudo apt-get install -y caffeine
sudo apt-get install -y flameshot
sudo apt-get install -y fonts-firacode
sudo apt-get install -y ghostwriter
sudo apt-get install -y gnome-sushi
sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y slack-desktop
sudo apt-get install -y spotify-client

if ! exists balena-etcher-electron; then
  echo "Installing Balena Etcher..."
  echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
  sudo apt-get update && sudo apt-get install -y balena-etcher-electron
fi

if ! exists 1password; then
  echo "Installing 1Password..."
  sudo apt-key --keyring /usr/share/keyrings/1password.gpg adv --keyserver keyserver.ubuntu.com --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian edge main' | sudo tee /etc/apt/sources.list.d/1password.list
  sudo apt update && sudo apt install 1password
fi

# This is interactive, so put it at the end
sudo apt-get install -y ttf-mscorefonts-installer


#chrome
