#!/bin/bash

# -----------------------------------------------
# Install desktop apps with brew-cask
# -----------------------------------------------

# Dev packages
brew install --cask iterm2
brew install --cask visual-studio-code

# Browsers
brew install --cask google-chrome
brew install --cask firefox
brew install --cask firefox-developer-edition

# Communications
brew install --cask slack
brew install --cask discord

# Media
brew install --cask spotify
brew install --cask vlc

# Other useful applications
brew install --cask notion

brew install --cask postman

brew install --cask docker

brew install --cask rectangle


# -----------------------------------------------
# Remove oudated package versions
# -----------------------------------------------

brew cleanup
