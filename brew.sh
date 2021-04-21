#!/bin/bash

# -----------------------------------------------
# Install Homebrew
# -----------------------------------------------

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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

# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some macOS tools
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh

# zsh
brew install zsh

# Git
brew install git
brew install tig

# Databases
brew install postgresql
brew install redis

# Development
brew install simplehttp2server
brew install nginx

# -----------------------------------------------
# Remove oudated package versions
# -----------------------------------------------

brew cleanup
