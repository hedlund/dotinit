#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/../common/helpers.sh"

START_DIR="$PWD"
cd "$HOME/Downloads/"

# Dropbox
if ! exists docker; then
  gpg --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
  git clone https://aur.archlinux.org/dropbox.git
  (cd dropbox && makepkg -s --noconfirm)
  sudo pacman -U --noconfirm dropbox/dropbox*.pkg.tar.xz
  rm -rf dropbox
fi

# Wavebox
if ! exists wavebox; then
  git clone https://aur.archlinux.org/wavebox-bin.git
  (cd wavebox-bin && makepkg -s --noconfirm)
  sudo pacman -U --noconfirm wavebox-bin/wavebox-bin*.pkg.tar.xz
  rm -rf wavebox-bin
fi

# envchain
if ! exists envchain; then
  git clone https://aur.archlinux.org/envchain.git
  (cd envchain && makepkg -s --noconfirm)
  sudo pacman -U --noconfirm envchain/envchain*.pkg.tar.xz
  rm -rf envchain
fi

# MS TTF fonts
if [ ! -f /usr/share/fonts/TTF/webdings.ttf ]; then
  git clone https://aur.archlinux.org/ttf-ms-fonts.git
  (cd ttf-ms-fonts && makepkg -s --noconfirm)
  sudo pacman -U --noconfirm ttf-ms-fonts/ttf-ms-fonts*.pkg.tar.xz
  rm -rf ttf-ms-fonts
fi

# Postman
if ! exists postman; then
  git clone https://aur.archlinux.org/postman.git
  (cd postman && makepkg -s --noconfirm)
  sudo pacman -U --noconfirm postman/postman*.pkg.tar.xz
  rm -rf postman
fi

# Spotify
if ! exists spotify; then
  gpg --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  git clone postmanhttps://aur.archlinux.org/spotify.git
  (cd spotify && makepkg -s --noconfirm)
  sudo pacman -U --noconfirm spotify/spotify*.pkg.tar.xz
  rm -rf spotify
fi

# direnv
if ! exists direnv; then
  git clone https://aur.archlinux.org/direnv.git
  (cd direnv && makepkg -s --noconfirm)
  sudo pacman -U --noconfirm direnv/direnv*.pkg.tar.xz
  rm -rf direnv
fi

cd "$START_DIR"
