#!/bin/bash
cd $(dirname "$0")

#-------------------------------------------------------------------------------
## check deps
#-------------------------------------------------------------------------------
if [ ! which dialog ] || [ ! which stow ]; then
	echo "ERROR - Install script requires 'dialog' and 'stow' to be available in \$PATH"
	exit 2
fi

#-------------------------------------------------------------------------------
## app-dotfiles
#-------------------------------------------------------------------------------
cd app-dotfiles

choices=$(dialog --stdout --no-items --keep-window --checklist \
	"Select the dotfiles to be stowed in $HOME" \
	25 45 15 \
	$(dir -d -1 */ | tr -d / | awk '{print $1, "off"}')
)

for package in $choices; do
	if command -v "$package" >/dev/null 2>&1; then
		stow $package -Rt "$HOME"
	else
		dialog --title "ERROR" --msgbox "'$package' is not in \$PATH; not installed? Skipping..." 6 45
	fi
done

#-------------------------------------------------------------------------------
## scripts
#-------------------------------------------------------------------------------
cd ../scripts

choices=$(dialog --stdout --no-items --keep-window --checklist \
	"Select the scripts to be installed in $HOME/.local/bin" \
	25 45 15 \
	$(dir -d -1 */ | tr -d / | awk '{print $1, "off"}')
)

if [ ! -d "$HOME/.local/bin" ]; then
	mkdir "$HOME/.local/bin"
fi

for script in $choices; do
	stow $script -Rt "$HOME"
done

#-------------------------------------------------------------------------------
## images
#-------------------------------------------------------------------------------
cd ../images

choices=$(dialog --stdout --no-items --keep-window --checklist \
	"Select the image files to put in $HOME/.config" \
	25 45 15 \
	$(dir -1 | awk '{print $1, "off"}')
)

for image in $choices; do
	cp $image $HOME/.config/
done

#-------------------------------------------------------------------------------
## xkb
#-------------------------------------------------------------------------------
if dialog --yesno "Do you want to add Spanish characters to the us(dvorak) keyboard layout?" 6 50; then
	cd ../other
	sudo ln -sfb $(pwd)/xkb/us /usr/share/X11/xkb/symbols/us
	dialog --msgbox "Done! Old xkb symbols definition backed up in '/usr/share/X11/xkb/symbols/us~'" 6 50
fi
