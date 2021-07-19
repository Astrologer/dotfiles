#!/bin/bash
dir=$(timeout 1 tmux display-message -p '#{pane_current_path}')
git -C $dir status >/dev/null 2>&1
if [ $? -eq 0 ]; then
    branch_name=$(git -C $dir symbolic-ref --short HEAD)
    project_name=$(git -C $dir rev-parse --show-toplevel)
    project_name=$(echo $project_name | rev | cut -d / -f 1 | rev)
    echo [$project_name] $branch_name
fi
