#!/bin/bash

# -----------------------------------------------
# Symlink the dotfiles to ~/
# Based on https://github.com/paulirish/dotfiles/blob/master/symlink-setup.sh
# -----------------------------------------------

# Utility functions

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -n 1
    printf "\n"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] $1\e[0m"
}

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1\e[0m\n"
}

print_info() {
    # Print output in purple
    printf "\e[0;35m  $1\e[0m\n\n"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    [ "$3" == "true" ] \
        && [ $1 -ne 0 ] \
        && exit
}

execute() {
    $1 &> /dev/null
    print_result $? "${2:-$1}"
}



# Links to create, as "source (relative to this repo):target (absolute)" pairs

declare -a LINKS=(
    # Top-level dotfiles
    ".aliases:$HOME/.aliases"
    ".functions:$HOME/.functions"
    ".gitconfig:$HOME/.gitconfig"
    ".gitignore:$HOME/.gitignore"
    ".tigrc:$HOME/.tigrc"
    ".vimrc:$HOME/.vimrc"
    ".watchmanconfig:$HOME/.watchmanconfig"
    ".zshrc:$HOME/.zshrc"

    # Custom files and directories that don't follow the "dotfile at repo
    # root links to same-named file at $HOME root" convention above
    "bin:$HOME/bin"
    "nvim:$HOME/.config/nvim"
    "wezterm:$HOME/.config/wezterm"
    "tmux/.tmux.conf:$HOME/.tmux.conf"
)



# Actually create the symlinks
main() {

    local entry=""
    local sourceRelative=""
    local sourceFile=""
    local targetFile=""

    for entry in "${LINKS[@]}"; do

        sourceRelative="${entry%%:*}"
        targetFile="${entry#*:}"
        sourceFile="$(pwd)/$sourceRelative"

        mkdir -p "$(dirname "$targetFile")"

        if [ -e "$targetFile" ] || [ -L "$targetFile" ]; then
            if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"

                if answer_is_yes; then
                    execute "mv $targetFile $targetFile.bak" "Backed up $targetFile → $targetFile.bak"
                    execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
                else
                    print_error "$targetFile → $sourceFile"
                fi

            else
                print_success "$targetFile → $sourceFile"
            fi
        else
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        fi

    done

}

main
