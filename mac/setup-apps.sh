#!/bin/bash -e

###############################################################################
# Google Chrome                                                               #
###############################################################################

# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false


###############################################################################
# Spectacle.app                                                               #
###############################################################################

# Enable automatic update checks
defaults write com.divisiblebyzero.Spectacle SUEnableAutomaticChecks -bool true

# Hide icon in menu bar
defaults write com.divisiblebyzero.Spectacle StatusItemEnabled -bool false


###############################################################################
# Caffeine                                                                    #
###############################################################################

# Do not activate on launch
defaults write com.lightheadsw.caffeine ActivateOnLaunch -bool false

# Set the default duration to one hour
defaults write com.lightheadsw.caffeine DefaultDuration -int 60

# Do not show launch message
defaults write com.lightheadsw.caffeine SuppressLaunchMessage -bool true


###############################################################################
# iStat Menus                                                                 #
###############################################################################

# Orange graphs
defaults write com.bjango.istatmenus6.extras MenubarSkinColor-Dark -int 1

# Black dropdown theme
defaults write com.bjango.istatmenus6.extras DropdownTheme-Dark -int 1

# Slow update frequency
defaults write com.bjango.istatmenus6.extras TimerFrequency -int 0


###############################################################################
# Todoist                                                                     #
###############################################################################

# Show in Dock, but not in the menubar
defaults write "com.todoist.mac.Todoist" ShowInDock -bool true
defaults write "com.todoist.mac.Todoist" ShowTodoistMenuBar -bool false


###############################################################################
# Little Snitch & Micro Snitch                                                #
###############################################################################

# Don't show the warning when closing Little Snitch configuration
defaults write "at.obdev.LittleSnitchConfiguration" ShowTerminationAlert -int 0

#TODO: disable default keyboard shortcut

# Set Micro Snitch to open at login
defaults write "at.obdev.MicroSnitch" OpenAtLogin -int 1


###############################################################################
# Arduino                                                                     #
###############################################################################

[ ! -d "$HOME/Projects/arduino" ] && mkdir -p "$HOME/Projects/arduino"

if [ -f ${HOME}/Library/Arduino15/preferences.txt ]; then
    sed -i "s|sketchbook.path=.*|sketchbook.path=${HOME}/Projects/arduino|g" ${HOME}/Library/Arduino15/preferences.txt
fi
