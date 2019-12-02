#!/bin/bash
set -e
export WIDTH=${WIDTH:-1920}
export HEIGHT=${HEIGHT:-1080}
export NOVNC_PORT=${NOVNC_PORT:-6080}
export VNC_PORT=${VNC_PORT:-5900}
export RESOLUTION="${WIDTH}x${HEIGHT}x24"
export DISPLAY=:99
export TERM=/bin/bash

/usr/bin/Xvfb :99 -screen 0 ${RESOLUTION} > /tmp/xvfb.log & disown
ln -s /vnc/root/.fluxbox ${HOME}/.fluxbox
sleep 2s; startfluxbox & disown
sleep 2s; /usr/bin/x11vnc -rfbport ${VNC_PORT} -bg -xkb -noxrecord -noxfixes -noxdamage -display :99 -wait 5 -shared -forever > /tmp/x11vnc.log & disown
sleep 2s; /vnc/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_PORT} > /tmp/novnc_server.log & disown
bash