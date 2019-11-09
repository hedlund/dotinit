#!/bin/bash -e

# Make sure snapd is enabled
sudo systemctl start snapd.seeded.service

sudo snap install google-cloud-sdk --classic
#sudo snap install hub --classic
sudo snap install postman
sudo snap install skype --classic
sudo snap install slack --classic
sudo snap install spotify
sudo snap install zaproxy --classic

# Chrome
