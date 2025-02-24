#!/usr/bin/env zsh

# Copy some files
cp ./.zshrc ~/.zshrc

# Install the configs
stow -D .
stow .

# Source the zsh
source ~/.zshrc
