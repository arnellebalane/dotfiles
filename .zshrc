#!/bin/bash

# -----------------------------------------------
# Enable Powerlevel10k instant prompt
# -----------------------------------------------

# Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# -----------------------------------------------
# Configure and load oh-my-zsh
# -----------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh



# -----------------------------------------------
# Additional zsh setup
# -----------------------------------------------

# https://github.com/rupa/z
. $HOME/bin/z.sh

# Configure zsh-autosuggestions plugin
# https://github.com/zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080, bold"

# Configure autocomplete
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh




# -----------------------------------------------
# Basic shell setup
# -----------------------------------------------

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"




# -----------------------------------------------
# Configure PATH variable
# -----------------------------------------------

# Initial PATH, taken from oh-my-zsh's defaults
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Binaries in home directory
export PATH="$HOME/bin:$PATH"



# -----------------------------------------------
# Configure PYENV
# -----------------------------------------------

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PIP_REQUIRE_VIRTUALENV=true




# -----------------------------------------------
# Python setup
# -----------------------------------------------

# Load virtualenvwrapper
# https://virtualenvwrapper.readthedocs.io/en/latest/install.html
source /usr/local/bin/virtualenvwrapper.sh



# -----------------------------------------------
# Load individual configuration modules
# -----------------------------------------------

. ~/.aliases
. ~/.functions



# -----------------------------------------------
# Load local .extra file, machine-specific and is not
# committed to the repository.
# -----------------------------------------------

[ -f ~/.extra ] && . ~/.extra

