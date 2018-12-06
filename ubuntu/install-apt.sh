#!/bin/bash

# Make sure we are up to date
sudo apt update && sudo apt upgrade -y

# Just make sure some basics are there
sudo apt install -y curl wget nano rsync telnet
sudo apt install -y apt-transport-https
sudo apt install -y git git-lfs
sudo apt install -y gpg scdaemon

# Then install a bunch of stuff
sudo apt install -y direnv
sudo apt install -y httpie
sudo apt install -y tree
sudo apt install -y xsel

#ack, blackbox, dep?
#envchain, fzf, gopass?
#hub, node, pstree
#yarn, z?

# Cleanup
sudo apt autoremove -y
