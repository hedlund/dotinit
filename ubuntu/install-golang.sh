#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

if ! exists go; then
  echo "Installing Golang..."
  sudo add-apt-repository -y ppa:longsleep/golang-backports
  sudo apt update
  sudo apt install -y golang-go
fi

if ! exists gcloud; then
  echo "Installing Google Cloud SDK..."
  CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
  echo "deb http://packages.cloud.google.com/apt ${CLOUD_SDK_REPO} main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  sudo apt update
  sudo apt install -y google-cloud-sdk
fi
