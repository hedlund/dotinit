#!/bin/bash -e

# Configure versions
DOCKER_CHANNEL=stable
DOCKER_COMPOSE_VERSION=1.24.1
DOCKER_COMPOSE_DIR=/usr/local/bin
# If install is failing on Ubuntu 18.10 (cosmic), hard-code to bionic
CODE_NAME="$(lsb_release -cs)"

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

if ! exists docker; then
    echo "Installing Docker..."

    # Update the apt package index
    sudo apt-get update

    # Install packages to allow apt to use a repository over HTTPS
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    # Add the Docker GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Verify the fingerprint
    sudo apt-key fingerprint 0EBFCD88

    # Add the Docker release channel repository
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${CODE_NAME} ${DOCKER_CHANNEL}"

    # Update the apt package index
    sudo apt-get update

    # Install the latest versionn of Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Allow the normal user access to the Docker CLI without needing root
    #sudo usermod -aG docker $USER

fi

if ! exists docker-compose; then
    echo "Installing Docker Compose..."

    sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o ${DOCKER_COMPOSE_DIR}/docker-compose
    sudo chmod +x ${DOCKER_COMPOSE_DIR}/docker-compose

fi
