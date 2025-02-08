#!/bin/bash

# Chezmoi bootstrap does an initial clone via https,
# but I need to switch that repo to use git ssh protocol
# for authentication if I want to push changes from it.

# NB: the -i '' is a Mac-ism, linux only needs -i without argument.

sed -i '' 's#https://github.com/#git@github.com:#g' ~/.local/share/chezmoi/.git/config
