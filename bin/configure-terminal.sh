#!/usr/bin/env zsh

# Установка необходимых программ и утилит
brew install --cask alacritty
brew install bash git zoxide eza bat tmux neovim fastfetch cargo wget nvm goenv stow ripgrep

# Копируем .zshrc в ~/.zshrc
cp ./.zshrc ~/.zshrc

# Установка пакетного менеджера для Zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

# Установка Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Установка Starship
curl -sS https://starship.rs/install.sh | sh
