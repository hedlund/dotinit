#!/bin/bash -e

# Make sure we are up to date
sudo pacman -Syu

# Install the packages
#sudo pacman -Syu --noconfirm brave
sudo pacman -Syu --noconfirm code
sudo pacman -Syu --noconfirm docker docker-compose
sudo pacman -Syu --noconfirm go
sudo pacman -Syu --noconfirm httpie
sudo pacman -Syu --noconfirm hub
sudo pacman -Syu --noconfirm libusb-compat ccid pcsc-tools
sudo pacman -Syu --noconfirm nodejs
sudo pacman -Syu --noconfirm npm
sudo pacman -Syu --noconfirm otf-fira-code
sudo pacman -Syu --noconfirm ruby-irb
sudo pacman -Syu --noconfirm tig
sudo pacman -Syu --noconfirm tree
sudo pacman -Syu --noconfirm yarn


# Enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Not installed at the moment:
#  arduino
#  chrome
#  etcher
#  google-cloud-sdk
#  java
#  now
  
# *alfred
# *caffeine
# *dash