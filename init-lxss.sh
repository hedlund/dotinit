#!/bin/bash
set -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install Docker
${SCRIPT_DIR}/ubuntu/install-docker.sh
