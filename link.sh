#!/bin/sh

# Unwanted lines can be obviously be commented out before running this script.
# Otherwise, existing dotfiles will be overwritten.

(cd
ln -sf ~/dotfiles/Xmodmap .Xmodmap
mkdir -p .i3
ln -sf ~/dotfiles/i3/config .i3/config
mkdir -p .oh-my-zsh/custom/themes
ln -sf ~/dotfiles/oh-my-zsh/custom/themes/ericmathison.zsh-theme .oh-my-zsh/custom/themes/ericmathison.zsh-theme
ln -sf ~/dotfiles/bashrc .bashrc
ln -sf ~/dotfiles/vimrc .vimrc
ln -sf ~/dotfiles/gitconfig .gitconfig
ln -sf ~/dotfiles/pentadactylrc .pentadactylrc
ln -sf ~/dotfiles/pryrc .pryrc
ln -sf ~/dotfiles/zshrc .zshrc
ln -sf ~/dotfiles/gitignore_global .gitignore_global
mkdir -p .w3m
ln -sf ~/dotfiles/w3m/keymap .w3m/keymap
mkdir -p .config/fish
ln -sf ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/editorconfig .editorconfig
[ ! -d .config/vis/editorconfig ] && git clone https://github.com/vktec/vis-editorconfig "$HOME/.config/vis/editorconfig"
[ ! -d .config/vis/vis-commentary ] && git clone https://github.com/lutobler/vis-commentary "$HOME/.config/vis/vis-commentary"
mkdir -p .config/vis
ln -sf ~/dotfiles/visrc.lua ~/.config/vis/visrc.lua
)
