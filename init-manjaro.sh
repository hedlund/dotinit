#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/common/helpers.sh"

# Touch devices require a bunch of extra stuff
TOUCH=""
if ask "Is this a touch device?"; then
  TOUCH="--touch"
fi

# Install the basics using pacman
${SCRIPT_DIR}/manjaro/install-pacman.sh

# Install a bunch of AURs
${SCRIPT_DIR}/manjaro/install-aur.sh ${TOUCH}

# Install Homebrew and a few more things
${SCRIPT_DIR}/manjaro/install-brew.sh

# Setup Manjaro
${SCRIPT_DIR}/manjaro/setup.sh ${TOUCH}

# Make sure we have some common folders
${SCRIPT_DIR}/common/create-folders.sh

# Install some Visual Studio Code extension
${SCRIPT_DIR}/common/install-code.sh

# Install some global Node packages
${SCRIPT_DIR}/common/install-node.sh

# Install some Google Cloud SDK components
sudo ${SCRIPT_DIR}/common/install-gcloud.sh
