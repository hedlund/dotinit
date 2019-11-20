#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install basic stuff
${SCRIPT_DIR}/ubuntu/install-apt.sh

# Install Docker
${SCRIPT_DIR}/ubuntu/install-docker.sh

# Install NodeJS
${SCRIPT_DIR}/ubuntu/install-node.sh
${SCRIPT_DIR}/common/install-node.sh

# Install Golang
${SCRIPT_DIR}/ubuntu/install-golang.sh
${SCRIPT_DIR}/common/install-golang.sh
