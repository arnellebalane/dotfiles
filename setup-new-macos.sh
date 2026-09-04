#!/bin/bash

# Run relative to this script's location, regardless of the caller's cwd
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1



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

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install oh-my-zsh plugins
[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] \
    || git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"



# -----------------------------------------------
# Symlink dotfiles into the home directory
# -----------------------------------------------

./setup-symlinks.sh
