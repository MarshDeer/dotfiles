#!/bin/bash
NO="\033[0m"
RED="\033[38;5;196m"
GREEN="\033[38;5;10m"

## Install dotfiles

# Intro
	clear
	echo -e "\e[38;5;$((RANDOM%257))mHemlo! I'm gonna automatically clone your dotfiles now!\nBet you feel cool, asshole :P \e[0m
"

# XKB
	sudo -s rm /usr/share/X11/xkb/symbols/us
	ln xkb/us /usr/share/X11/xkb/symbols/
	echo -e "${GREEN}XKB layout hardlinked succesfully${NO}"
	echo -e "${RED}Remember to set your XKB layout to US-Dvorak!${NO}
	"

# Zathura
	if [ -x /usr/bin/zathura ] ;
		then
			ln zathura/zathurarc ~/.config/zathura/zathurarc
			echo "${GREEN}zathurarc hardlinked succesfully${NO}"
		else	
			echo -e "${RED}zathura is not installed in this computer; skipping${NO}
			"
	fi

# Vim
	rm $HOME/.vimrc
	ln -s vim/vimrc $HOME/.vimrc
	echo -e "${GREEN}.vimrc softlinked successfully"

# Bash
	rm $HOME/.bashrc
	rm $HOME/.bash_aliases
	ln -s bash/bashrc $HOME/.bashrc
	ln -s bash/bash_aliases ~/.bash_aliases
	source /home/lena/.bashrc
	echo -e "${GREEN}.bashrc and .bash_aliases softlinked and sourced succesfully${NO}
	"

# End
	echo -e "${GREEN}:)${NO}"
