#!/bin/bash
#
# Install from configs.
#
# Parameters:
#   ./setup.sh apps  - install MacOS applications
#   ./setup.sh conda - install miniconda with some good scientific packages
#   ./setup.sh sc    - install basic audio tools: SuperCollider and Audacity

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    exit 1
fi

# Common installation
brew bundle --file Brewfile
cp ".zsh_aliases" "$HOME/.zsh_aliases"
cp ".zshrc" "$HOME/.zshrc"

# apps installation
if [ $1 == "apps" ]; then
    cd apps
    ./setup.sh
fi

# conda installation
if [ $1 == "conda" ]; then
    cd conda
    ./setup.sh
fi

# SuperCollider installation
if [ $1 == "sc" ]; then
    cd supercollider
    ./setup.sh
fi
