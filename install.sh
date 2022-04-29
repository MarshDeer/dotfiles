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
			ln /home/lena/git/zathura/zathurarc /home/lena/.config/zathura/zathurarc
			echo -e "${GREEN}zathurarc hardlinked succesfully${NO}"
		else	
			echo -e "${RED}zathura is not installed in this computer; skipping${NO}
			"
	fi

# Vim
	rm /home/lena/.vimrc
	ln -s /home/lena/git/vim/vimrc /home/lena/.vimrc
	ln -s /home/lena/git/vim/statusline.vim /home/lena/config/vim/statusline.vim
	echo -e "${GREEN}.vimrc and status line softlinked successfully${NO}
	"
	

# Bash
	rm /home/lena/.bashrc
	rm /home/lena/.bash_aliases
	ln -s /home/lena/git/bash/bashrc /home/lena/.bashrc
	ln -s /home/lena/git/bash/bash_aliases /home/lena/.bash_aliases
	source /home/lena/.bashrc
	echo -e "${GREEN}.bashrc and .bash_aliases softlinked and sourced succesfully${NO}
	"

# Neofetch
	if [ -x /usr/bin/neofetch ] ;
		then
			rm -rf /home/lena/.config/neofetch
			ln /home/lena/git/neofetch /home/lena/.config/neofetch
			echo -e "${GREEN}neofetch dotfiles hardlinked successfully${NO}
			"
		else
			echo -e"${RED}neofetch is not installed in this computer; skipping${NO}"
	fi

# End
	echo -e "${GREEN}:)${NO}"
