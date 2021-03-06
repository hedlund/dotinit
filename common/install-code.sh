#!/bin/bash -e

code=code
if [ -z "$(which $code 2>/dev/null)" ]; then
  if [ -z "$(which code-oss 2>/dev/null)" ]; then
    echo "Visual Studio Code not available. Skipping!"
    exit 1
  fi

  code=code-oss
fi

# Extensions
# $code --install-extension christian-kohler.npm-intellisense
# $code --install-extension christian-kohler.path-intellisense
# $code --install-extension dbaeumer.vscode-eslint
# $code --install-extension eamodio.gitlens
# $code --install-extension EditorConfig.EditorConfig
# $code --install-extension esbenp.prettier-vscode
# $code --install-extension formulahendry.auto-close-tag
# $code --install-extension formulahendry.auto-rename-tag
# $code --install-extension mitchdenny.ecdc
# $code --install-extension msjsdiag.debugger-for-chrome
# $code --install-extension wmaurer.change-case

# Languages
$code --install-extension mauve.terraform
$code --install-extension ms-vscode.Go
$code --install-extension ms-vscode.PowerShell
$code --install-extension castwide.solargraph
$code --install-extension wingrunr21.vscode-ruby
$code --install-extension zxh404.vscode-proto3
$code --install-extension ms-azuretools.vscode-docker
# $code --install-extension DotJoshJohnson.xml
# $code --install-extension geequlim.godot-tools

# Themes
$code --install-extension Equinusocio.vsc-material-theme
$code --install-extension PKief.material-icon-theme
$code --install-extension cometeer.spacemacs
