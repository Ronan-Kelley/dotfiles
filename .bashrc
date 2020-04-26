# Check for an interactive session
[ -z "$PS1" ] && return

### as a safety measure, don't execute on tty3 - in case I mess up this file ###
[ $(tty) == '/dev/tty3' ] && return

### aliases ###
alias ls='ls -hF --color=auto'
alias ll='ls -hFl --color=auto'
alias l='ls -hF --color=auto'

# quickstart
alias n='nvim'
alias r='ranger'
alias s='spt'
alias vpn='sudo protonvpn c -f -p udp'

# package management
alias aurbuild='makepkg -si'
alias aurfind='aur search'

alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias update="sudo pacman -Syu"
alias shutdown-now="yes | sudo pacman -Syu && shutdown now"
alias pkill="pkill -kill"

# steam
alias steam="steam-native"
alias steamAlt="steam-runtime"

# misc
alias neofetch="neofetch | lolcat"

### functions ###
function pyPrint() {
	python3 -c "print($*)"
}

### environment variables ###
export TERM=xterm-256color
export NVIMC=$HOME/.config/nvim
export PATH=${PATH}:~/Scripts:~/.cargo/bin:~/.local/bin
export EDITOR=nvim
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig

### prompt settings ###
TEAL="\[$(tput setaf 120)\]"
BLUE="\[$(tput setaf 81)\]"
YELLOW="\[$(tput setaf 190)\]"
TAN="\[$(tput setaf 180)\]"
PINK="\[$(tput setaf 170)\]"
ORANGE="\[$(tput setaf 202)\]"
RESET="\[$(tput sgr0)\]"

### show time, username, and current directory name ###
#PS1="${PINK}[\A \u \W]${BLUE}>${RESET}"

### show username and current directory name ###
PS1="${PINK}[\u \W]${BLUE}>${RESET}"

### show the regular PS1 with regular colors but with the text "ranger" just inside the first "[" ###
### so that it's clear when the shell is a running inside of an instance of ranger                ###
[ ! -z "$RANGER_LEVEL" ] && PS1="${PINK}[${ORANGE}ranger ${PINK}${PS1:$(( ${#PINK} + 1 )):$(( ${#PS1} - ${#PINK} - 1 ))}"
