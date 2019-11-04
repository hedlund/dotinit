#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

# Usage: installAur <name>
function installAur() {
  git clone https://aur.archlinux.org/$1.git
  (cd $1 && makepkg -si --noconfirm)
  rm -rf $1
}

START_DIR="$PWD"
cd "$HOME/Downloads/"

# Dropbox
if ! exists docker; then
  gpg --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
  installAur dropbox
fi

# Google Chrome
if ! exists google-chrome-stable; then
  installAur google-chrome
fi

# envchain
if ! exists envchain; then
  installAur envchain
fi

# MS TTF fonts
if [ ! -f /usr/share/fonts/TTF/webdings.ttf ]; then
  installAur ttf-ms-fonts
fi

# Postman
if ! exists postman; then
  installAur postman-bin
fi

# Spotify
if ! exists spotify; then
  gpg --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  installAur spotify
fi

# Ghostwriter
if ! exists ghostwriter; then
  installAur ghostwriter
fi

# direnv
if ! exists direnv; then
  installAur direnv
fi

# Google Cloud SDK
if ! exists gcloud; then
  installAur google-cloud-sdk
fi

if ! exists slack; then
  installAur slack-desktop
fi

# Some things should only be installed on touch devices...
if has_flag "--touch"; then

  # Screen rotation - https://wiki.archlinux.org/index.php/Tablet_PC#With_a_KDE_module
  if ! exists orientation-helper; then
    installAur iio-sensor-proxy-git
    installAur kded-rotation-git
  fi

  # Touchegg
  if ! exists touchegg; then
    installAur frame
    installAur grail 
    installAur geis
    installAur touchegg
  fi

fi

cd "$START_DIR"
