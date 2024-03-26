#!/bin/bash

if [[ "$XMODIFIERS" =~ "fcitx" ]]; then
  [ -z "$GTK_IM_MODULE" ] && export GTK_IM_MODULE=fcitx
elif [[ "$XMODIFIERS" =~ "ibus" ]]; then
  [ -z "$GTK_IM_MODULE" ] && export GTK_IM_MODULE=ibus
fi

if [ ! -L /etc/lsb-release ]; then
  ln -s /app/etc/lsb-release /etc/lsb-release
fi

exec zypak-wrapper.sh /app/electron/electron /app/lib/app.asar "$@"
