#!/bin/bash

# MacOS-specific setup
if [ "$(uname -s)" = "Darwin" ]; then
  ### System settings, see https://macos-defaults.com/ for more

  # General Preferences
  defaults write com.apple.swipescrolldirection -bool "false"

  # Dock/Menubar
  defaults write com.apple.dock "orientation" -string "left"
  defaults write com.apple.dock "tilesize" -int "50"
  defaults write com.apple.menuextra.battery "ShowPercent" "YES"
  killall Dock

  # Finder
  defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
  defaults write com.apple.Finder "AppleShowAllFiles" -bool "true"
  killall Finder

  # TextEdit
  defaults write com.apple.TextEdit "RichText" -bool "false"

  # iTerm2
  # Disables resizing to whole character widths only
  defaults write com.googlecode.iterm2 DisableWindowSizeSnap -integer 1

  # Game Controller
  # Disable PS4 controller menu button launching "Games" folder,
  # as well as Steam wanting to jump to foreground.
  defaults write com.apple.GameController bluetoothPrefsMenuLongPressAction -integer 0

  # SSH
  ssh-add --apple-use-keychain ~/.ssh/identity
fi
