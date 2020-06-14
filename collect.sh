#!/bin/bash

#
# simple script to copy relevant dotfiles into this directory
#


# for ease of use. follows links, acts recursively, doesn't overwrite up-to-date files, and prints
# verbosely.
copy='cp -L -r -u -v'

### ensure subdirs exist (github doesn't upload empty dirs, hoping to reduce maintenance on this script) ###
mkdir -p ./.config/i3
mkdir -p ./.config/nvim

### i3 configs ###
$copy ~/.config/i3/* ./.config/i3/

### neovim configs ###
$copy ~/.config/nvim/* ./.config/nvim/

### bash configs ###
$copy ~/.bashrc ./.bashrc
$copy ~/.bash_profile ./.bash_profile

### tmux configs ###
$copy ~/.tmux.conf ./.tmux.conf
