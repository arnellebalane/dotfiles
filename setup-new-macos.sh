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
# Setup oh-my-zsh
# -----------------------------------------------

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions



# -----------------------------------------------
# Symlink dotfiles into the home directory
# -----------------------------------------------

./setup-symlinks.sh
