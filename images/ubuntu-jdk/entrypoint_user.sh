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
[exec] (Chrome) {/usr/bin/chromium-browser --no-gpu --no-sandbox --disable-dev-shm-usage --disable-web-security} <>
[exec] (Firefox) {/usr/bin/firefox} <>
[exec] (Intellij IDEA) {/app/idea*/bin/idea.sh} <>
[include] (/etc/X11/fluxbox/fluxbox-menu)
[end]
EOT
  echo "Created fluxbox file".
fi

#Start script
echo "Starting environment"
/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -nevershared -forever -create \
  -env X11VNC_CREATE_GEOM=${WIDTH}x${HEIGHT}x24 \
  -env FD_PROG=/usr/bin/startfluxbox \
  -rfbport "${VNC_PORT}" \
  -passwd "${VNC_PASSWORD}"
