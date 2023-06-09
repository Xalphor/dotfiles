#!/bin/bash

set -eu

if [ -n "${DEBUG:-}" ]; then
    set -x
fi

# One line to get the exact location of this script.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

check_dependencies(){
    # CHECKS if all dependency packages are installed. 
    missing_packages=""

    if ! command -v fzf &> /dev/null;
    then
        missing_packages="fzf "
    fi

    if ! command -v yarn &> /dev/null;
    then
        missing_packages="yarn "
    fi

    if ! command -v node &> /dev/null;
    then
        missing_packages="node "
    fi

    if ! command -v git &> /dev/null;
    then
        missing_packages="git "
    fi

    if ! command -v pip3 &> /dev/null;
    then
        missing_packages="pip3 "
    fi

    if [ ! -z $missing_packages ]
    then
        echo "The following packages are required but missing, please install them first and then return this script: $missing_packages"
    fi
}

setup_nvim() {
    # INSTALLS and CONFIGURES NeoVIM
    if ! command -v nvim &> /dev/null;
    then
            echo "NeoVIM not found. Please check https://neovim.io/ on how to install it."
            exit 1
    fi

    echo "Configuring NeoVIM..."

    mkdir -p ~/.config/nvim/
    ln -sf "$SCRIPT_DIR/init.vim" ~/.config/nvim/init.vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    pip3 install neovim


}

echo "- Starting Dotfile Setup v1.0 -"


check_dependencies
setup_nvim

echo "- DONE -"
