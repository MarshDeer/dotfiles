#
# ~/.bashrc
#

#------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

#------------------------------------------------------------
## Use the up and down arrow keys for finding a command in history
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#------------------------------------------------------------
## Some generally useful functions.

_open_files_for_editing() {
    #    - Do not use for executable files!
    #    - Uses 'mime' bindings, so you may need to use

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------
## Aliases

source ~/.bash_aliases

#------------------------------------------------------------
## Prompt

export PS1="\[\033[35m\]\]\[\033[0m\]\]\[\033[30;45m\]\]\$(hostname | colrm 1 4)\[\033[0m\]\]\[\033[35m\]\]\[\033[0m\]\]\[\033[96m\]\]\[\033[0m\]\]\[\033[30;106m\]\]\w\[\033[0m\]\]\[\033[96m\]\]\[\033[0m\]\]\[\033[34m\]\]\[\033[0m\]\]\[\033[30;44m\]\]\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[\033[0m\]\]\[$(tput sgr0)\]\[\033[34m\]\]\[\033[0m\]\] "

#------------------------------------------------------------
## Check window size

shopt -s checkwinsize

#------------------------------------------------------------
## Clean history
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

#------------------------------------------------------------
## Automatically cd
shopt -s autocd

# Created by `pipx` on 2024-01-13 21:29:40
export PATH="$PATH:/home/lena/.local/bin"
