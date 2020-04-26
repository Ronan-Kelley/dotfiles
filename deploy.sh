#!/bin/bash

#
# simple dotfile deploying script, plus backup by default.
#
# args:
# 	-S 		deploy Scripts from my github repository
# 	-SB 	deploy scripts from my github repository without backing up previous scripts folder, should it exist
#   -D 		automatically deploy all dotfiles
#   -DB 	automatically deploy all dotfiles without backing up previous folders/files for each respective dotfile
#
#

### functions ###
deploy_scripts() {
	[ -d ~/Scripts ] && [ -z $1 ] && mv ~/Scripts ~/Scripts_bak
	[ -d ~/Scripts ] && [ ! -z $1 ] && echo "are you sure? This will permanently erase the contents of ~/Scripts! [y/n]" && read are_you_sure && [ "$are_you_sure" == "y" ] && rm -rf ~/Scripts || echo "cancelling Script deployment..." && return
	git clone https://github.com/Ronan-Kelley/Scripts.git ~/Scripts
}

backup_dotfiles() {
	### i3 ###
	mv -v ~/.config/i3 ~/.config/i3_bak
	
	### neovim ###
	mv -v ~/.config/nvim ~/.config/nvim_bak
	mv -v ~/.vim ~/.vim_bak

	### bash configs ###
	mv ~/.bashrc ~/.bashrc.bak
	mv ~/.bash_profile ~/.bash_profile.bak
}

remove_conflicting_dotfiles() {
	### i3 ###
	rm -rf ~/.config/i3

	### neovim ###
	rm -rf ~/.config/nvim
	rm -rf ~/.vim

	### bash configs ###
	rm ~/.bashrc
	rm ~/.bash_profile

	return 0
}

deploy_dotfiles() {
	[ -z $1 ] && backup_dotfiles
	[ ! -z $1 ] && echo "are you sure? This will permanently erase any dotfiles in its way! [y/n]" && read are_you_sure && [ "$are_you_sure" == "y" ] && remove_conflicting_dotfiles || echo "deployment of dotfiles cancelled" && return
	# alias for copy
	copy='cp -r -u -v'

	### i3 ###
	$copy ./.config/i3 ~/.config/i3
	
	### neovim ###
	$copy ./.config/nvim ~/.config/nvim
	$copy ./.vim ~/.vim

	### bash configs ###
	$copy ./.bashrc ~/.bashrc
	$copy ./.bash_profile ~/.bash_profile
}

for arg in $@
do
	case $arg in
		"-S")
			echo "found option -S"
			deploy_scripts
			;;
		"-SB")
			echo "found option -SB"
			deploy_scripts n
			;;
		"-D")
			echo "found option -D"
			deploy_dotfiles
			;;
		"-DB")
			echo "found option -DB"
			deploy_dotfiles n
			;;
	esac
done
