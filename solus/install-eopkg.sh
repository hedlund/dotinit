#!/bin/bash -e

# Update the system
sudo eopkg ur && sudo eopkg upgrade -y

# it -y the packages
sudo eopkg it -y direnv
sudo eopkg it -y docker docker-compose
sudo eopkg it -y dropbox
sudo eopkg it -y etcher
sudo eopkg it -y font-firacode-otf
sudo eopkg it -y ghostwriter
sudo eopkg it -y gnome-tweaks
sudo eopkg it -y golang
sudo eopkg it -y gufw
sudo eopkg it -y httpie
sudo eopkg it -y intel-microcode
sudo eopkg it -y jq
sudo eopkg it -y libusb-compat ccid pcsc-tools
sudo eopkg it -y nodejs
sudo eopkg it -y tig
sudo eopkg it -y tree
sudo eopkg it -y vscode
sudo eopkg it -y whois
sudo eopkg it -y yarn

# blackbox
# envchain
# hub
# java



# it -y MS fonts (interactive)
sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/solus-project/3rd-party/master/desktop/font/mscorefonts/pspec.xml
sudo eopkg it -y mscorefonts*.eopkg; sudo rm mscorefonts*.eopkg
