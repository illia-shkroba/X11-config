#!/bin/sh

userresources="$XDG_CONFIG_HOME/X11/xresources"
usermodmap="$XDG_CONFIG_HOME/X11/.Xmodmap"
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

[ -f "$sysresources" ] && xrdb -load "$sysresources"
[ -f "$sysmodmap" ] && xmodmap "$sysmodmap"
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*.sh; do
    [ -x "$f" ] && source "$f"
  done
fi

exec xmonad-x86_64-linux
