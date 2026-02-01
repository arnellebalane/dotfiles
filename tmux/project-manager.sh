#!/usr/bin/env bash

function open_project() {
    project_path="$(/opt/homebrew/bin/fd . ~/dev --type directory --max-depth 1 | /opt/homebrew/bin/fzf)" || return
    project_name="$(echo $project_path | cut -d '/' -f 5)"
    session_name="$(echo $project_name | sed "s/\./_/g")"

    /opt/homebrew/bin/tmux has-session -t $session_name 2> /dev/null
    if [ $? -ne 0 ]; then
        /opt/homebrew/bin/tmux new-session -ds $session_name -c $project_path -n code -- /opt/homebrew/bin/nvim --listen $project_path/nvim.sock
        /opt/homebrew/bin/tmux new-window -dt "${session_name}:" -c $project_path -n cli
    fi
    /opt/homebrew/bin/tmux switch-client -t $session_name
}

function select_session() {
    selected_session="$(/opt/homebrew/bin/tmux list-sessions -F "#S" | awk '$1 !~ "default" { print $1 }' | /opt/homebrew/bin/fzf)" || return
    /opt/homebrew/bin/tmux switch-client -t $selected_session
}

command=$1

case $command in
    "open-project")
        open_project;;

    "select-session")
        select_session;;
esac
