# Check for an interactive session
[ -z "$PS1" ] && return

### I have a vendetta against caps lock ###
# note: this solution does not function properly when run inside of tmux #
if [ ! -z "$TMUX" ]; then
	[ ! -z "$(pgrep -i xorg)" ] && setxkbmap -option caps:none
	[ "$(tty)" == *"/tty/"* ] && setleds -D -caps
fi

### aliases ###

# ls
alias ls='ls -hF --color=auto'
alias ll='ls -hFl --color=auto'
alias l='ls -hF --color=auto'
alias rd='fc -s'

# bashrc
alias resource='source ~/.bashrc'
alias modsource='nvim ~/.bashrc'

# quickstart
alias t='tmux'
alias n='nvim'
alias r='ranger'
alias s='spt'
alias vpn='sudo protonvpn c -f -p udp'

# package management
alias aurbuild='makepkg -sic'
alias aurfind='aur search'

alias grub-update='sudo os-prober && sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias update="sudo pacman -Syu"

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
export VISUAL=nvim
export BROWSER=brave
export PAGER=less
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig

### prompt settings/aliases ###
TEAL="\[$(tput setaf 120)\]"
BLUE="\[$(tput setaf 81)\]"
PINK="\[$(tput setaf 170)\]"
ORANGE="\[$(tput setaf 202)\]"
GREEN="\[$(tput setaf 34)\]"
RESET="\[$(tput sgr0)\]"

### show time, username, and current directory name ###
#PS1="${PINK}[\A \u \W]${BLUE}>${RESET}"

### show username and current directory name ###
PS1="${PINK}[\u \W]${BLUE}>${RESET}"

### quick function for ease of real-time modification of PS1 variable, retaining desired formatting ###
function prompt_prepend() {
	[ ${#PS1} -lt 1 ] && return;
	PS1="${PINK}[$* ${PINK}${PS1:$(( ${#PINK} + 1 )):$(( ${#PS1} - ${#PINK} - 1 ))}";
}

### append "ranger" if user is in a ranger subshell ###
[ ! -z "$RANGER_LEVEL" ] && prompt_prepend ${ORANGE}ranger && alias r='exit' && alias ranger='exit'

### append "tmux" if user is in a tmux subshell ###
[ ! -z "$TMUX" ] && prompt_prepend ${GREEN}tmux && alias t='' && alias tmux=''
