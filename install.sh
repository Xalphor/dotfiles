#!/bin/bash

set -eu

if [ -n "${DEBUG:-}" ]; then
    set -x
fi

# One line to get the exact location of this script.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# INSTALLS and CONFIGURES NeoVIM
setup_nvim() {
    if ! command -v nvim &> /dev/null;
    then
            echo "NeoVIM not found. Please check https://neovim.io/ on how to install it."
            exit 1
    fi

    echo "Configuring NeoVIM..."

    ln -sf "$SCRIPT_DIR/init.vim" ~/.config/nvim/init.vim

}

echo "- Starting Dotfile Setup v1.0 -"

setup_nvim

echo "- DONE -"
