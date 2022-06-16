#!/bin/bash

# MacOS-specific setup
if [ "$(uname -s)" = "Darwin" ]; then
  echo "$ run_onchange_darwin.sh"

  ### System settings, see https://macos-defaults.com/ for more

  # Dock
  defaults write com.apple.dock "orientation" -string "left"
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

  # SSH
  ssh-add -K ~/.ssh.identity

  ### Homebrew

  # install homebrew if it's missing
  if ! [ -x "$(command -v brew)" ]; then
    echo "> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # TODO: Current dayjob has the OS locked down, and installing to
    #       /usr/local (Intel) or /opt/homebrew (M1) will fail.
    #       Alas the installscript hardcodes there, so need to figure out a
    #       recovery plan to manually install to ~/.homebrew instead.
  fi

  # ... assuming brew has installed, either in this script or externally
  if [ -x "$(command -v brew)" ]; then
    # Use ~/.Brewfile (home/dot_Brewfile from this repo) to install packages
    brew bundle --global
  fi

fi
