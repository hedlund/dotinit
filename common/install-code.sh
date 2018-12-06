#!/bin/bash

if [ -z "$(which code)" ]; then
  echo "Visual Studio Code not available. Skipping!"
else

  # Extensions
  code --install-extension christian-kohler.npm-intellisense
  code --install-extension christian-kohler.path-intellisense
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension deerawan.vscode-dash
  code --install-extension eamodio.gitlens
  code --install-extension EditorConfig.EditorConfig
  code --install-extension esbenp.prettier-vscode
  code --install-extension formulahendry.auto-close-tag
  code --install-extension formulahendry.auto-rename-tag
  code --install-extension mitchdenny.ecdc
  code --install-extension msjsdiag.debugger-for-chrome
  code --install-extension wmaurer.change-case
  
  # Languages
  code --install-extension DotJoshJohnson.xml
  code --install-extension geequlim.godot-tools
  code --install-extension lukehoban.Go
  code --install-extension mauve.terraform
  code --install-extension ms-vscode.PowerShell
  code --install-extension PeterJausovec.vscode-docker
  
  # Themes
  code --install-extension akamud.vscode-theme-onedark
  code --install-extension file-icons.file-icons
fi
