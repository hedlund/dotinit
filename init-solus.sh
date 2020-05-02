#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/common/helpers.sh"

# Install the basics using eopkg
${SCRIPT_DIR}/solus/install-eopkg.sh

# Install a bunch of snaps
${SCRIPT_DIR}/solus/install-snap.sh

# Setup Solus
${SCRIPT_DIR}/solus/setup.sh

# Make sure we have some common folders
${SCRIPT_DIR}/common/create-folders.sh

# Install some Visual Studio Code extension
${SCRIPT_DIR}/common/install-code.sh

# Install some global Node packages
${SCRIPT_DIR}/common/install-node.sh

# Init the .git repo
${SCRIPT_DIR}/common/init-repo.sh
