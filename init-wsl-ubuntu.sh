#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install basic stuff
${SCRIPT_DIR}/ubuntu/install-apt.sh --no-docker

# Install NodeJS stuff
${SCRIPT_DIR}/common/install-node.sh

# Install Golang stuff
${SCRIPT_DIR}/common/install-golang.sh

# Make sure we have some common folders
${SCRIPT_DIR}/common/create-folders.sh

# Init the .git repo
${SCRIPT_DIR}/common/init-repo.sh
