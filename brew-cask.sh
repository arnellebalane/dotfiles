#!/bin/bash

# -----------------------------------------------
# Install desktop apps with brew-cask
# -----------------------------------------------

# Dev packages
brew cask install iterm2
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install atom
brew cask install atom-beta

# Browsers
brew cask install google-chrome-canary
brew cask install google-chrome
brew cask install firefox
brew cask install firefox-developer-edition
brew cask install chromium

# Communications
brew cask install slack
brew cask install discord
brew cask install skype
brew cask install rambox

# Media
brew cask install spotify
brew cask install vlc

# Other useful applications
brew cask install alfred
brew cask install notion
brew cask install typora
brew cask install transmission
brew cask install figma

brew cask install postman
brew cask install tableplus
brew cask install daisydisk

brew cask install docker
brew cask install virtualbox
brew cask install wireshark



# -----------------------------------------------
# Remove oudated package versions
# -----------------------------------------------

brew cask cleanup
