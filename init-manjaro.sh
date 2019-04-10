#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install the basics using pacman
${SCRIPT_DIR}/manjaro/install-pacman.sh

# Install a bunch of AURs
${SCRIPT_DIR}/manjaro/install-aur.sh

# Install Homebrew and a few more things
${SCRIPT_DIR}/manjaro/install-brew.sh

# Make sure we have some common folders
${SCRIPT_DIR}/common/create-folders.sh

# Install some Visual Studio Code extension
${SCRIPT_DIR}/common/install-code.sh

# Install some global Node packages
${SCRIPT_DIR}/common/install-node.sh
