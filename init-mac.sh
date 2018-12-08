#!/bin/bash -e

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Not running on Mac OS X. Aborting!"
  exit 1
fi

# Install everything using Homebrew
${SCRIPT_DIR}/mac/install-brew.sh

# Start a few applications to get the config started
${SCRIPT_DIR}/mac/start-apps.sh

# Make sure we have some common folders
${SCRIPT_DIR}/common/create-folders.sh

# Configure the system
${SCRIPT_DIR}/mac/setup-macos.sh

# Configure the applications
${SCRIPT_DIR}/mac/setup-apps.sh

# Install some Visual Studio Code extension
${SCRIPT_DIR}/common/install-code.sh

# Install some global Node packages
${SCRIPT_DIR}/common/install-node.sh

# Install some Golang tools
${SCRIPT_DIR}/common/install-golang.sh

# Output some useful info...
printf "\nRemember to enable Accessibility access for the following applications:\n"
printf "    Alfred 3\n"
printf "    Dropbox\n"
printf "    Spectacle\n"
printf "Go to System Preferences > Security & Privacy > Privacy > Accessibility\n\n"

printf "Login to 1Password to get the passwords syncing.\n"
printf "Login to Dropbox and let it finish the first sync.\n"
printf "Then install Little Snitch and let it restart the computer...\n\n"
