#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

for f in .bash_profile .gitconfig .tmux.conf .vimrc; do
    if [ -e "$HOME/$f" ]; then
        backup="/tmp/$f.$(date +%Y%m%d%H%M%S).bak"
        cp "$HOME/$f" "$backup"
        echo "backed up $HOME/$f -> $backup"
    fi
    cp "$f" "$HOME/$f"
    echo "installed $f"
done
