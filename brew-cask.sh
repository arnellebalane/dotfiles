#!/bin/bash

# -----------------------------------------------
# Install desktop apps with brew-cask
# -----------------------------------------------

# Dev packages
brew install --cask wezterm
brew install --cask sublime-text
brew install --cask visual-studio-code
brew install --cask claude
brew install --cask claude-code
brew install --cask codex
brew install --cask font-hack-nerd-font
brew install --cask font-meslo-lg-nerd-font
brew install --cask gpg-suite
brew install --cask docker
brew install --cask docker-desktop

# Browsers
brew install --cask google-chrome
brew install --cask firefox
brew install --cask chromium

# Communications
brew install --cask slack
brew install --cask discord

# Media
brew install --cask spotify
brew install --cask iina

# Other useful applications
brew install --cask raycast
brew install --cask rectangle
brew install --cask figma
brew install --cask tableplus
brew install --cask daisydisk
brew install --cask 1password



# -----------------------------------------------
# Remove oudated package versions
# -----------------------------------------------

brew cleanup
