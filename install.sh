#!/bin/bash

echo "Installing packages..."
sudo apt update
sudo apt install -y vim tmux git curl

echo "Linking configs..."
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

echo "Done!"
