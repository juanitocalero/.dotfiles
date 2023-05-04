#!/bin/bash

# Basic tools
sudo apt install curl git tmux tree zip jq

# Modern vim text editor
sudo apt install neovim
# PLugin manager for Neovim: Vim-Plug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Dotfiles Manager: https://github.com/thoughtbot/rcm
sudo apt install rcm

# Basic tools replacements

sudo apt install fd-find fzf ripgrep

# Update forgit?

# Cat replacement
sudo apt install bat

# Other nice tools
sudo apt install tldr translate-shell asciidoctor

# difftastic
# taskell


# Install docker
