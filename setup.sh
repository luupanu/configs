#!/bin/bash
#
# Install from configs.

# check if we have arguments
if [ $# -eq 0 ]; then
    echo "No arguments supplied."
    printf "\n"
    echo "Usage:"
    echo "  ./setup.sh setup    - install brew and XCode Command Line Tools"
    echo "  ./setup.sh common   - install essential brew formulae"
    echo "  ----------------------------------------------------------------------------------"
    echo "  ./setup.sh apps     - install MacOS applications"
    echo "  ./setup.sh conda    - install miniconda with some essential scientific packages"
    echo "  ./setup.sh formulae - install non-essential brew formulae"
    echo "  ./setup.sh music    - install basic audio tools such as SuperCollider and Audacity"
    printf "\n"
    exit 1
fi

# setup
if [ $1 == "setup" ]; then
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# common installation
if [ $1 == "common" ]; then
    cd common
    ./setup.sh
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
    cd music
    ./setup.sh
fi
