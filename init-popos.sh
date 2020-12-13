#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install the Ubuntu basics
${SCRIPT_DIR}/ubuntu/install-apt.sh

# Install stuff from the Pop OS repos
${SCRIPT_DIR}/popos/install-apt.sh

# Install some snaps
${SCRIPT_DIR}/popos/install-snap.sh

# Install some flatpaks
${SCRIPT_DIR}/popos/install-flat.sh

# Run setup
${SCRIPT_DIR}/popos/setup-ubuntu.sh

# Make sure we have some common folders
${SCRIPT_DIR}/common/create-folders.sh

# Install some global Node packages
${SCRIPT_DIR}/common/install-node.sh

# Install some Visual Studio Code extension
${SCRIPT_DIR}/common/install-code.sh

# Install the remaining things from source
${SCRIPT_DIR}/common/install-git.sh

# Init the .git repo
${SCRIPT_DIR}/common/init-repo.sh
