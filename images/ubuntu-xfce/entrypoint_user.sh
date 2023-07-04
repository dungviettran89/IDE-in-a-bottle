#!/bin/bash
set -e
echo "Starting user entrypoint"
#Environment
export WIDTH=${WIDTH:-1920}
export HEIGHT=${HEIGHT:-1080}
export VNC_PORT=${VNC_PORT:-5900}
export VNC_PASSWORD=${VNC_PASSWORD:-developer}
export LANG=${LANG:-en_GB.UTF-8}
export LC_ALL=${LC_ALL:-C}
export DISPLAY=:99
env

#Preparing files in home
if [ ! -d ~/.fluxbox/ ]; then
  mkdir -p ~/.fluxbox/
  cat <<EOT > ~/.fluxbox/menu
[begin] (fluxbox)
[exec] (Chrome) {/usr/bin/google-chrome --no-gpu --no-sandbox --disable-dev-shm-usage --disable-web-security} <>
[exec] (Firefox) {/usr/bin/firefox} <>
[include] (/etc/X11/fluxbox/fluxbox-menu)
[end]
EOT
  echo "Created fluxbox file".
fi

#Start script
echo "Starting environment"
mkdir -p $HOME/.vnc
echo $VNC_PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
/usr/bin/vncserver $DISPLAY \
  -localhost no -xstartup /usr/bin/startfluxbox -fg \
  -geometry "${WIDTH}x${HEIGHT}" -depth 24 \
  -rfbport "${VNC_PORT}" \
  -rfbauth $HOME/.vnc/passwd