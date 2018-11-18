#!/bin/bash
set -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

if ! exists go; then
    echo "Installing Golang..."
    sudo add-apt-repository -y ppa:gophers/archive
    sudo apt-get update
    sudo apt-get install -y golang-1.10-go
fi

if ! exists gcloud; then
    echo "Installing Google Cloud SDK..."
    CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
    echo "deb http://packages.cloud.google.com/apt ${CLOUD_SDK_REPO} main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    sudo apt-get update && sudo apt-get install -y google-cloud-sdk
fi