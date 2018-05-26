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



# Find all .dotfiles in this directory

declare -a DOTFILES=$(
    find . -type f -maxdepth 1 \
    -name ".*" \
    -not -name .DS_Store \
    -not -name .git \
    -not -name .osx \
    | sed -e 's|//|/|' \
    | sed -e 's|./.|.|'
)

# Include custom files and directories
DOTFILES="$DOTFILES bin"



# Actually create dotfiles symlinks
main() {

    local i=""
    local sourceFile=""
    local targetFile=""

    for i in ${DOTFILES[@]}; do

        sourceFile="$(pwd)/$i"
        targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ -e "$targetFile" ]; then
            if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"

                if answer_is_yes; then
                    rm -rf "$targetFile"
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
