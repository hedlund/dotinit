#!/bin/bash -e

# Make sure we are up to date
sudo apt-get update && sudo apt-get upgrade -y

# Just make sure some basics are there
sudo apt-get install -y curl wget nano rsync telnet
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-get install -y git git-lfs
sudo apt-get install -y gpg scdaemon gnupg-agent
sudo apt-get install -y software-properties-common

# Then install a bunch of stuff
sudo apt-get install -y direnv
sudo apt-get install -y httpie
sudo apt-get install -y tree
sudo apt-get install -y xsel

#ack, blackbox, dep?
#envchain, fzf, gopass?
#hub, node, pstree
#yarn, z?

# Cleanup
sudo apt-get autoremove -y
