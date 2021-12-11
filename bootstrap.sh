#!/bin/bash
set -e # -e: exit on error

## Bootstrap script for Github Codespaces,
## which checks the repo out to ~/dotfiles.
## Interactive installs should use `sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply jamie`

## Install chezmoi binary locally
if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsLS https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

## Then chezmoi init from that checkout.
## Codespaces ofc does not have private encryption keys, and does not run interactive,
## so we should avoid attempting to decrypt files on initial bootstrap.
# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# exec: replace current process with chezmoi init
exec "$chezmoi" init --apply "--source=$script_dir" --exclude=encrypted
