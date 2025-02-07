#!/bin/bash

# Bootstrap requires install homebrew on MacOS
if [ "$(uname -s)" = "Darwin" ]; then
  # install homebrew if it's missing
  if ! [ -x "$(command -v brew)" ]; then
    echo "> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # TODO: Current dayjob has the OS locked down, and installing to
    #       /usr/local (Intel) or /opt/homebrew (M1) will fail.
    #       Alas the installscript hardcodes there, so need to figure out a
    #       recovery plan to manually install to ~/.homebrew instead.
  fi
fi
