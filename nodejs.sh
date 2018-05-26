#!/bin/bash

# -----------------------------------------------
# Install NodeJS via nvm
# -----------------------------------------------

# Tells nvm to update the `.zsh_profile` profile
export PROFILE="$HOME/.zsh_profile"

# Instal nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Reload shell profile to load nvm script
source $PROFILE



# -----------------------------------------------
# Install npm packages
# -----------------------------------------------

npm install -g git-open         # Opens a repository's Github page
npm install -g diff-so-fancy    # Fancy `git diff` display
npm install -g trash-cli        # Safe alternative to `rm`
npm install -g fkill-cli        # Kill processes
npm install -g gtop             # System monitoring

npm install -g firebase-tools
npm install -g polymer-cli
npm install -g netlify-cli
npm install -g surge
npm install -g npm-check
npm install -g serve
npm install -g lice
npm install -g yarn

# Alfred plugins
npm install -g alfred-fkill
npm install -g alfred-show-network-info
