#!/bin/bash

INSTR="dnf"

# Basic tools
sudo $INSTR install curl git tmux tree zip jq

# Modern vim text editor
sudo $INSTR install neovim
# PLugin manager for Neovim: Vim-Plug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# Make symbolic link from vim to nvim
ln /usr/bin/nvim /usr/bin/vim


# Dotfiles Manager: yadm

# Basic tools replacements

sudo $INSTR install fd-find fzf ripgrep

# Update forgit?


# Other nice tools
sudo $INSTR install tldr translate-shell 

sudo $INSTR install pandoc

# difftastic
# taskell

## Python
sudo $INSTR install pip python3-devel
pip install pipx

# Terminal file manager
sudo $INSTR install fuse-zip vifm
