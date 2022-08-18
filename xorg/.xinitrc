#!/bin/sh

if [ -f "$HOME/.Xresources" ]; then
  xrdb -merge "$HOME/.Xresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Set cursor
xsetroot -cursor_name left_ptr

# Start session
exec dbus-launch leftwm
