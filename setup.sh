#!/bin/bash

# Basic tools
sudo apt install git tmux tree 

# Modern vim text editor
sudo apt install neovim
# PLugin manager for Neovim: Vim-Plug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Dotfiles Manager
# https://github.com/thoughtbot/rcm

# Install docker
