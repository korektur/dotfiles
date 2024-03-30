#!/bin/bash

cp ~/.zshrc .
cp ~/.fzf.zsh .
cp ~/.p10k.zsh .
cp ~/.tmux.conf .

mkdir -p ./config/nvim/
cp -r ~/.config/nvim/lua config/nvim/
cp -r ~/.config/lazygit config/
