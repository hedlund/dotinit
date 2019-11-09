#!/bin/bash -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

function ceil() {
  float=$1
  int=${float/.*}
  echo $(($int+1))
}

# Enable U2F devices
if [ ! -f /etc/udev/rules.d/70-u2f.rules ]; then
  echo "Copying U2F udev rules (requires sudo)..."
  sudo cp "${SCRIPT_DIR}/../common/70-u2f.rules" /etc/udev/rules.d/70-u2f.rules
fi

# Create swapfile
if [ ! -f /swapfile ]; then

  # Get the amount of RAM on the machine
  mem=$(ceil $(awk '/MemTotal/ { printf "%f", $2/1024/1024 }' /proc/meminfo))G

  # Create and use the swapfile
  sudo fallocate -l ${mem} /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile

  # Add swapfile to fstab
  if ! grep -iq '/swapfile' /etc/fstab; then
    echo '/swapfile  swap  swap  defaults  0 0' | sudo tee -a /etc/fstab
  fi
fi

