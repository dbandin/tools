#!/bin/bash

if [[ -z $1 ]]; then
    echo "Missing argument"
    echo "usage: ${0} inventory_file_name"
    exit 1
fi

INVENTORY=$1

echo "* Inventory file: ${1}"

echo "  * Processing hosts"

# Rough counter to identify first line, because the first line is expected to be the ansible controller
line_counter=0
split_list=()
while read -a line; do
    echo "    ** Processing line ${line_counter}"
    echo "    * Host: ${line[0]} - Port: ${line[1]} - Login: ${line[2]}"

    if [[ line_counter -eq 0 ]];then
        session_command="ssh -p ${line[1]} -l ${line[2]} localhost"
    else
        split_list+=( split-pane ssh -l ${line[2]} -p ${line[1]} localhost ';' )
    fi

    let line_counter++
done < $1

# Un-comment the synchronize-panes option if you want to enable broadcasting the commands to all panes.
tmux new-session "${session_command}" ';' \
    "${split_list[@]}" \
    select-layout tiled ';'
    # set-option -w synchronize-panes

exit 0