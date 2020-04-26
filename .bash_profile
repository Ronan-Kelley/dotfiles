# don't execute on non-interactive sessions
[ -z "$PS1" ] && return
# don't execute on tty3, in case I fuck up my configs
[ $(tty) == '/dev/tty3' ] && return
# if on tty1, launch xfce4
[ -z "$(pgrep xfce)" ] && [ $(tty) == '/dev/tty1' ] && startxfce4
# if on tty2, launch i3
[ -z "$(pgrep i3)" ] && [ $(tty) == '/dev/tty2' ] && startx

# enable numpad
setleds -D +num

source $HOME/.bashrc
