#!/bin/bash

# Just make sure some basics are there
sudo apt install -y curl wget nano rsync telnet
sudo apt install -y apt-transport-https
sudo apt install -y git git-lfs

# Then install a bunch of stuff
sudo apt install -y direnv
sudo apt install -y httpie
sudo apt install -y tree

#ack, blackbox, dep?
#envchain, fzf, gopass?
#hub, node, pstree
#yarn, z?
