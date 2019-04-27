#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

# Enable U2F devices
if [ ! -f /etc/udev/rules.d/70-u2f.rules ]; then
  echo "Copying U2F udev rules (requires sudo)..."
  sudo cp "${SCRIPT_DIR}/../common/70-u2f.rules" /etc/udev/rules.d/70-u2f.rules
fi

# Enable gcloud updater to be able to install components
if [ -f /opt/google-cloud-sdk/lib/googlecloudsdk/core/config.json ]; then
  sudo sed -i 's/"disable_updater": true,/"disable_updater": false,/g' /opt/google-cloud-sdk/lib/googlecloudsdk/core/config.json
fi
