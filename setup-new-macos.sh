#!/bin/bash

# -----------------------------------------------
# Setup Homebrew and install packages
# -----------------------------------------------

./Development/mac-setup/dotfiles/brew.sh
./Development/mac-setup/dotfiles/brew-cask.sh

# -----------------------------------------------
# Setup oh-my-zsh
# -----------------------------------------------

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# -----------------------------------------------
# Symlink dotfiles into the home directory
# -----------------------------------------------

./setup-symlinks.sh
