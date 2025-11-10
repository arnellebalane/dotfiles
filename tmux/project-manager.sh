#!/usr/bin/env bash

function select_project() {
    project_path="$(/opt/homebrew/bin/fd . ~/dev --type directory --max-depth 1 | /opt/homebrew/bin/fzf)" || return
    project_name="$(echo $project_path | cut -d '/' -f 5)"
    session_name="$(echo $project_name | sed "s/\./_/g")"

    /opt/homebrew/bin/tmux has-session -t $session_name 2> /dev/null
    if [ $? -ne 0 ]; then
        /opt/homebrew/bin/tmux new-session -ds $session_name -c $project_path -n code -- /opt/homebrew/bin/nvim
        /opt/homebrew/bin/tmux new-window -dt "${session_name}:" -c $project_path -n cli
    fi
    /opt/homebrew/bin/tmux switch-client -t $session_name
}

select_project
