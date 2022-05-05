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
	ln /home/lena/git/xkb/us /usr/share/X11/xkb/symbols/
	echo -e "${GREEN}XKB layout hardlinked succesfully${NO}"
	echo -e "${RED}Remember to REset your XKB layout to US-Dvorak!${NO}
	"

# Zathura
	if [ -x /usr/bin/zathura ] ;
		then
			stow zathura -t /home/lena/
			echo -e "${GREEN}zathurarc stowed succesfully${NO}"
		else	
			echo -e "${RED}zathura is not installed in this computer; skipping${NO}
			"
	fi

# Vim
	rm /home/lena/.vimrc
	stow vim -t /home/lena/
	echo -e "${GREEN}.vimrc and status line softlinked successfully${NO}
	"
	

# Bash
	rm /home/lena/.bashrc
	rm /home/lena/.bash_aliases
	stow bash -t /home/lena/
	source /home/lena/.bashrc
	echo -e "${GREEN}.bashrc and .bash_aliases softlinked and sourced succesfully${NO}
	"

# Neofetch
	if [ -x /usr/bin/neofetch ] ;
		then
			rm -rf /home/lena/.config/neofetch
			stow neofetch -t /home/lena/
			echo -e "${GREEN}neofetch dotfiles hardlinked successfully${NO}
			"
		else
			echo -e"${RED}neofetch is not installed in this computer; skipping${NO}"
	fi

# End
	echo -e "${GREEN}:)${NO}"
