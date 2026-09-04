#!/bin/bash

# -----------------------------------------------
# Install Homebrew
# -----------------------------------------------

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we're using the latest Homebrew
brew update

# Upgrade already-installed formulae
brew upgrade



# -----------------------------------------------
# Install Homebrew packages
# Based on https://github.com/paulirish/dotfiles/blob/master/brew.sh
# -----------------------------------------------

# GNU core utilities (those that come with macOS are outdated)
brew install coreutils
brew install moreutils
brew install findutils

# Git
brew install git
brew install git-lfs

# Development
brew install mise
brew install neovim
brew install gh
brew install tig
brew install httpie
brew install git-delta
brew install tmux

# Databases
brew install postgresql

# Other usefil binaries
brew install tree
brew install bat
brew install eza
brew install ripgrep
brew install fd
brew install fzf
brew install topgrade



# -----------------------------------------------
# Remove oudated package versions
# -----------------------------------------------

brew cleanup
