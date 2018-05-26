#!/bin/bash

# -----------------------------------------------
# Configure and load oh-my-zsh
# -----------------------------------------------

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"

plugins=("zsh-autosuggestions")

source $ZSH/oh-my-zsh.sh



# -----------------------------------------------
# Load individual configuration modules
# -----------------------------------------------

. .path
. .exports
. .prompt
. .aliases
. .functions
