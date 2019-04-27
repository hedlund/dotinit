#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

# Enable U2F devices
if [ ! -f /etc/udev/rules.d/70-u2f.rules ]; then
  echo "Copying U2F udev rules (requires sudo)..."
  sudo cp "${SCRIPT_DIR}/../common/70-u2f.rules" /etc/udev/rules.d/70-u2f.rules
fi
