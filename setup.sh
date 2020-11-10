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

# grep -> ripgrep (rg)  https://github.com/BurntSushi/ripgrep

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

# find -> fd https://github.com/sharkdp/fd

curl -LO https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_amd64.deb
sudo dpkg -i fd_7.4.0_amd64.deb

# fzf!
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Update forgit?

# Cat replacement
sudo apt install bat

# Other nice tools
sudo apt install tldr translate-shell asciidoctor


# Install docker
