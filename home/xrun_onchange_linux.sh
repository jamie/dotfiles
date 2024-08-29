#!/bin/bash

# This script is still WIP
exit 0

# Linux-specific setup
if [ "$(uname -s)" = "Linux" ]; then
  echo "$ run_onchange_linux.sh"

  ## ZSH
  if ! command -v zsh >/dev/null 2>&1; then
    echo "Bootstrapping zsh..."
    sudo apt install -y zsh
    chsh -s `which zsh`
    echo "Log out and in to enable zsh"
  fi

  ## SSH
  ssh-add ~/.ssh/identity

  ## Commandline Tools

  echo "> Installing a lot from apt"
  # Dependencies for building ruby
  sudo apt install -y libssl-dev libreadline-dev zlib1g-dev
  # Generic rails dependencies, with redundancy
  sudo apt install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

  echo "> Installing mise"
  if ! command -v mise >/dev/null 2>&1; then
    sudo apt install -y mise
  fi

  ## Desktop tools
  # TODO: add a guard to skip installing in Codespaces

  # Snaps (since no Brewfile available)
  sudo apt install -y snap
  sudo snap install vscode --classic

fi
