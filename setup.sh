#!/bin/bash
#
# Install from configs.
#
# Parameters:
#   ./setup.sh common   - install brew and XCode Command Line Tools
#   ./setup.sh apps     - install MacOS applications
#   ./setup.sh conda    - install miniconda with some essential scientific packages
#   ./setup.sh formulae - install non-essential brew formulae
#   ./setup.sh music    - install basic audio tools such as SuperCollider and Audacity

# check if we have arguments
if [ $# -eq 0 ]; then
    echo "No arguments supplied."
    printf "\n"
    echo "Usage:"
    echo "  ./setup.sh common   - install brew and XCode Command Line Tools"
    echo "  ----------------------------------------------------------------------------------"
    echo "  ./setup.sh apps     - install MacOS applications"
    echo "  ./setup.sh conda    - install miniconda with some essential scientific packages"
    echo "  ./setup.sh formulae - install non-essential brew formulae"
    echo "  ./setup.sh music    - install basic audio tools such as SuperCollider and Audacity"
    printf "\n"
    exit 1
fi

# Common installation
if [ $1 == "common" ]; then
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    brew bundle --file Brewfile
    cp ".zsh_aliases" "$HOME/.zsh_aliases"
    cp ".zshrc" "$HOME/.zshrc"
fi

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

# formulae installation
if [ $1 == "formulae" ]; then
    cd formulae
    ./setup.sh
fi

# music installation
if [ $1 == "music" ]; then
    cd supercollider
    ./setup.sh
fi
