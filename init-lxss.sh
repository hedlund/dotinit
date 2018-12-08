#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install basic stuff
${SCRIPT_DIR}/ubuntu/install-apt.sh

# Install Docker
${SCRIPT_DIR}/ubuntu/install-docker.sh

# Install some global Node packages
${SCRIPT_DIR}/common/install-node.sh

# Install some Golang tools
${SCRIPT_DIR}/common/install-golang.sh

# Symlink the Windows folders
WINDOWS_USER=$(\ls /mnt/c/Users | grep 'henrik\?')
if [ ! -z "$WINDOWS_USER" ]; then
  [ -d "/mnt/c/Users/${WINDOWS_USER}/Projects" ] && ln -sf "/mnt/c/Users/${WINDOWS_USER}/Projects" "${HOME}/Projects"
  [ -d "/mnt/c/Users/${WINDOWS_USER}/Temp" ] && ln -sf "/mnt/c/Users/${WINDOWS_USER}/Temp" "${HOME}/Temp"
else
  echo "Unable to locate Windows user. Skipping folder linking!"
fi
