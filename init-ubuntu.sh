#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install some basics
${SCRIPT_DIR}/ubuntu/install-apt.sh

# Install Docker
${SCRIPT_DIR}/ubuntu/install-docker.sh

# Install Golang & Gcloud
${SCRIPT_DIR}/ubuntu/install-golang.sh

# Install Node.js
${SCRIPT_DIR}/ubuntu/install-node.sh

# Make sure we have some common folders
${SCRIPT_DIR}/common/create-folders.sh

# Run setup
${SCRIPT_DIR}/ubuntu/setup-ubuntu.sh

# Init the .git repo
${SCRIPT_DIR}/common/init-repo.sh
