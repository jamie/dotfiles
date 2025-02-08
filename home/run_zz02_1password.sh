#!/bin/bash

if [ -d ~/Applications/1Password.app ]; then
  echo "Moving 1Password app to system Applications folder"
  sudo mv ~/Applications/1Password.app /Applications/
fi
