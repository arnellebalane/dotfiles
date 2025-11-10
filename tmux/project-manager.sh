#!/usr/bin/env bash

function open_project() {
    local project_path="$(fd . ~/dev --type directory --max-depth 1 | fzf)"
    local project_name="$(echo $project_path | cut -d '/' -f 5)"
    local session_name=$(get_session_name $project_name)

    tmux list-sessions -F "#S" | grep $session_name
    if [[ $? -ne 0 ]]; then
        tmux new-session -ds $session_name -c $project_path -n code -- nvim
        tmux new-window -dt "${session_name}:" -c $project_path -n cli
    fi
    tmux switch-client -t $session_name
}

function get_session_name() {
    local name=$(echo $1 | sed "s/\./_/g")
    echo $name
}

open_project
