#!/bin/bash

# -----------------------------------------------
# Setup Homebrew and install packages
# -----------------------------------------------

./brew.sh
./brew-cask.sh



# -----------------------------------------------
# Setup NodeJS and install packages
# -----------------------------------------------

./nodejs.sh



# -----------------------------------------------
# Symlink dotfiles into the home directory
# -----------------------------------------------

./setup-symlinks.sh
