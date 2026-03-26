#!/bin/bash

echo "Updating system..."
sudo apt update

echo "Installing core packages..."
sudo apt install -y git vim tmux ranger curl wget

echo "Creating config directories..."
mkdir -p ~/.config

echo "Linking dotfiles..."

# core configs
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# ranger config
ln -sf ~/dotfiles/ranger ~/.config/ranger

echo "Reloading bash..."
source ~/.bashrc

echo "Setup complete ✅"
