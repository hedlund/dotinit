#!/bin/bash -e

open -a "1Password 7"
open -a Arduino
open -a Docker
open -a "iStat Menus"
open -a "Micro Snitch"

# On macOS Sierra and later accessibility mode cannot be enabled automatically
open /System/Library/PreferencePanes/Security.prefPane/

# Open up the Little Snitch installer
LITTLESNITCH_PATH="/usr/local/Caskroom/little-snitch"
if [[ "$(brew cask info little-snitch)" =~ $LITTLESNITCH_PATH/([0-9]+\.[0-9]+\.?[0-9]*) ]]; then
    VERSION="${BASH_REMATCH[1]}"
    open "$LITTLESNITCH_PATH/$VERSION/LittleSnitch-$VERSION.dmg"
fi

#TODO: do we need to put a delay or a prompt here?
