#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

TASK_VERSION="v3.0.0"

if ! exists task; then
  TEMP_DEB="$(mktemp)" && \
    wget -O "$TEMP_DEB" "https://github.com/go-task/task/releases/download/${TASK_VERSION}/task_linux_amd64.deb" && \
    sudo dpkg -i "$TEMP_DEB"
  rm -f "$TEMP_DEB"
fi
