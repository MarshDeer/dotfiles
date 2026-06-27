# Prettier outputs
alias ls="ls -Aosh --color=auto"
alias dir="dir -A --color=auto"
alias lc="ls -ACF --color=auto"
alias grep="grep --color=auto"
alias neofetch="neofetch --ascii_colors 4 5 7 8"
alias ip="ip -c"

# Functionality
alias mv="mv -i"
alias deersay="cowsay -f ~/git/cowfiles/nicedeer.cow"

# Shortcuts
alias edit="_open_files_for_editing"
alias :q="exit"
alias update="yay -Syu --ignore bitwig-studio --ignore vintagestory"
alias nuke="sudo pacman -Rcns"

# SSH
alias server="ssh deerserver"
alias arcade="ssh pi@retropie"
alias laptop="ssh deerlaptop"

# Unfucking
alias unfuck_samba="sudo mount -a"
alias unfuck_screen="kscreen-doctor output.2.rotation.inverted"
alias unfuck_nvidia="systemctl --user restart plasma-powerdevil.service"
alias unfuck_mtp="kill -9 $(pgrep kiod6)"
