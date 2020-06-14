### autostart ###
# don't execute on non-interactive sessions
[ -z "$PS1" ] && return
# for some reason tmux keeps trying to source this?
[ ! -z "$TMUX" ] && source $HOME/.bashrc && return
# don't execute on tty3, in case I fuck up my configs
[ $(tty) == '/dev/tty3' ] && return
# if on tty1, launch i3
[ -z "$(pgrep xfce)" ] && [ $(tty) == '/dev/tty1' ] && startx
# if on tty2, launch xfce4
[ -z "$(pgrep i3)" ] && [ $(tty) == '/dev/tty2' ] && startxfce4

### set keyboard leds ###
# attempt to enable numpad
setleds -D +num
# attempt to disable capslock
setleds -D -caps

### attempt to set monitor settings ###
[ ! -z $(pgrep -i xorg) ] && xrandr --output DVI-D-0 --mode 1920x1080 --rate 144

source $HOME/.bashrc
