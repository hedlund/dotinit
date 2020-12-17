#!/bin/bash -e

# Make sure snapd is enabled
sudo systemctl start snapd

sudo snap install task --classic
