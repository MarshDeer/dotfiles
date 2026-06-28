#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $(dirname "$0")

if [ ! command -v dialog ] || [ ! command -v stow ]; then
	echo "ERROR - Install script requires 'dialog' and 'stow' to be available in \$PATH"
	exit 2
fi

choices=$(dialog --stdout --no-items --keep-window --checklist \
	"Select the dotfiles to be stowed in $HOME" \
	25 45 15 \
	$(dir -d -1 */ | sed '/^xkb\/$/d' | tr -d / | awk '{print $1, "off"}')
)

for package in $choices; do
	if command -v "$package" >/dev/null 2>&1; then
		stow $package -t "$HOME"
	else
		dialog --title "ERROR" --msgbox "'$package' is not in \$PATH; not installed? Skipping..." 6 45
	fi
done

if dialog --yesno "Do you want to add Spanish characters to the us(dvorak) keyboard layout?" 6 50; then
	sudo ln -sfb $(pwd)/xkb/us /usr/share/X11/xkb/symbols/us
	dialog --msgbox "Done! Old xkb symbols definition backed up in '/usr/share/X11/xkb/symbols/us~'" 6 50
fi
