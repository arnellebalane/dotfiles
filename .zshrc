#!/bin/bash

# -----------------------------------------------
# Configure and load oh-my-zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"

plugins=("zsh-autosuggestions")

source $ZSH/oh-my-zsh.sh



# -----------------------------------------------
# Additional zsh setup

# https://github.com/rupa/z
. $HOME/bin/z.sh

autoload zmv

# Configure zsh-autosuggestions plugin
# https://github.com/zsh-users/zsh-autosuggestions
bindkey "^[x" autosuggest-execute
bindkey "^[t" autosuggest-toggle

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"



# -----------------------------------------------
# Basic shell setup

export PS1="🐈 "

# Set default editors
export EDITOR="vim"
export GIT_EDITOR="vim"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"



# -----------------------------------------------
# Configure PATH variable

# Initial PATH, taken from oh-my-zsh's defaults
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Binaries in home directory
export PATH="$HOME/bin:$PATH"



# -----------------------------------------------
# Android SDK setup

export PATH="$PATH:$HOME/.android-sdk/tools"
export PATH="$PATH:$HOME/.android-sdk/tools/bin"
export PATH="$PATH:$HOME/.android-sdk/platform-tools"



# -----------------------------------------------
# NodeJS setup

# https://github.com/Schniz/fnm
eval `fnm env`

# Add binaries in current node_modules to PATH
export PATH="./node_modules/.bin:$PATH"



# -----------------------------------------------
# Python setup

# Load virtualenvwrapper
# https://virtualenvwrapper.readthedocs.io/en/latest/install.html
source /usr/local/bin/virtualenvwrapper.sh



# -----------------------------------------------
# Ruby setup

# Load rbenv
# https://github.com/rbenv/rbenv#installation
eval "$(rbenv init -)"



# -----------------------------------------------
# Load individual configuration modules

. ~/.aliases
. ~/.functions



# -----------------------------------------------
# Load local .extra file, machine-specific and is not
# committed to the repository.

[ -f ~/.extra ] && . ~/.extra
