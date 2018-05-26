#!/bin/bash

# Configure zsh-autosuggestions
bindkey "^[x" autosuggest-execute
bindkey "^[t" autosuggest-toggle
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"



# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"



# Load zmv built-in function
autoload zmv
