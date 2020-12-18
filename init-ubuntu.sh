#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install some basics
${SCRIPT_DIR}/ubuntu/install-apt.sh

# Install NodeJS stuff
${SCRIPT_DIR}/common/install-node.sh

# Install Golang stuff
${SCRIPT_DIR}/common/install-golang.sh

# Make sure we have some common folders
${SCRIPT_DIR}/common/create-folders.sh

# Run setup
${SCRIPT_DIR}/ubuntu/setup-ubuntu.sh

# Install the remaining things from source
${SCRIPT_DIR}/common/install-git.sh

# Init the .git repo
${SCRIPT_DIR}/common/init-repo.sh
