#!/bin/bash -e

# Install Homebrew unless it's already installed
if [ -z "$(which brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
fi

# Make sure we’re using the latest Homebrew & upgrade all installed formulae.
brew update && brew upgrade

# Tap a few extra repositories
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

# Update the core utilities (those that come with OS X are outdated)
brew install bash
brew install bash-completion2
brew install coreutils
brew install findutils
brew install git git-lfs && git lfs install
brew install gnu-sed --with-default-names
brew install grep --with-default-names
brew install moreutils
brew install nano
brew install openssh
brew install screen
brew install wget --with-iri

# Install other useful binaries.
brew install ack
brew install blackbox
brew install dep
brew install direnv
brew install envchain
brew install fzf
brew install gh
brew install go
brew install gpg pinentry-mac
brew install httpie
brew install node
brew install pstree
brew install rsync
brew install scons
brew install telnet
brew install tfenv
brew install tig
brew install tree
brew install yarn
brew install z

# Install some UI apps
brew cask install 1password
brew cask install alfred
brew cask install ao
brew cask install appzapper
brew cask install arduino
brew cask install boostnote
brew cask install caffeine
brew cask install daisydisk
brew cask install docker
brew cask install etcher
brew cask install firefox-developer-edition
brew cask install google-chrome
brew cask install google-cloud-sdk
brew cask install hyper
brew cask install istat-menus
#brew cask install iterm2
brew cask install java
brew cask install little-snitch
brew cask install micro-snitch
brew cask install now
brew cask install owasp-zap
brew cask install postman
brew cask install slack
brew cask install spectacle
brew cask install spotify
#brew cask install virtualbox
brew cask install visual-studio-code

# Install some fonts
brew cask install font-fira-code
brew cask install font-inconsolata

# Remove outdated versions from the cellar
brew cleanup && brew cask cleanup
