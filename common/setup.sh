#!/bin/bash

brew bundle --file Brewfile

# zsh profile
cp ".zsh_aliases" "$HOME/.zsh_aliases"
cp ".zshrc" "$HOME/.zshrc"

# apple system preferences
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g com.apple.swipescrolldirection -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSWindowResizeTime -float 0
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.controlcenter.plist BatteryShowPercentage -bool true
defaults write com.apple.controlcenter.plist Bluetooth -int 18
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock tilesize -int 24
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.finder DisableAllAnimations -bool true

