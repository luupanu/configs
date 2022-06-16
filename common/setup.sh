#!/bin/bash

brew bundle --file Brewfile
cp ".zsh_aliases" "$HOME/.zsh_aliases"
cp ".zshrc" "$HOME/.zshrc"
