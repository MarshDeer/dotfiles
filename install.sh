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
	ln ./xkb/us /usr/share/X11/xkb/symbols/
	echo -e "${GREEN}XKB layout hardlinked succesfully${NO}"
	echo -e "${RED}Remember to set your XKB layout to US-Dvorak!${NO}
	"

# Zathura
	if [ -x /usr/bin/zathura ] ;
		then
			ln ./zathura/zathurarc /home/lena/.config/zathura/zathurarc
			echo -e "${GREEN}zathurarc hardlinked succesfully${NO}"
		else	
			echo -e "${RED}zathura is not installed in this computer; skipping${NO}
			"
	fi

# Vim
	rm /home/lena/.vimrc
	ln -s ./vim/vimrc /home/lena/.vimrc
	echo -e "${GREEN}.vimrc softlinked successfully${NO}
	"

# Bash
	rm /home/lena/.bashrc
	rm /home/lena/.bash_aliases
	ln -s ./bash/bashrc /home/lena/.bashrc
	ln -s ./bash/bash_aliases /home/lena/.bash_aliases
	source /home/lena/.bashrc
	echo -e "${GREEN}.bashrc and .bash_aliases softlinked and sourced succesfully${NO}
	"

# End
	echo -e "${GREEN}:)${NO}"
