#!/bin/sh

# Once upon a time, my dotfiles repo had a script which would dynamically find
# and symlink all the dotfiles. Overall, it was great except when I didn't want
# ALL the dotfiles symlinked. Instead of spending a lot of time and most likely
# just complicating things anyway, I'm punting on the issue by just hard coding
# the file names. Unwanted lines can be commented out temporarily. To look at
# my previous script, do a git checkout of b244c6d74905e6abea4f029e35878bbd4891f

cd

ln -si ~/dotfiles/Xmodmap .Xmodmap
mkdir -p .i3
ln -si ~/dotfiles/i3/config .i3/config
mkdir -p .oh-my-zsh/custom/themes
ln -si ~/dotfiles/oh-my-zsh/custom/themes/ericmathison.zsh-theme .oh-my-zsh/custom/themes/ericmathison.zsh-theme
ln -si ~/dotfiles/bashrc .bashrc
ln -si ~/dotfiles/vimrc .vimrc
ln -si ~/dotfiles/gitconfig .gitconfig
ln -si ~/dotfiles/pentadactylrc .pentadactylrc
ln -si ~/dotfiles/pryrc .pryrc
ln -si ~/dotfiles/zshrc .zshrc
ln -si ~/dotfiles/gitignore_global .gitignore_global
mkdir -p .w3m
ln -si ~/dotfiles/w3m/keymap .w3m/keymap
