#!/bin/bash
set -e
cp -R /vnc/root/.fluxbox ${HOME}/.fluxbox

/usr/bin/Xvfb :99 -screen 0 "${WIDTH}x${HEIGHT}x24" > /tmp/xvfb.log & disown
export DISPLAY=:99
sleep 2s; fluxbox & disown
sleep 2s; /usr/bin/x11vnc -rfbport ${VNC_PORT} -passwd ${VNC_PASSWORD} -bg -xkb -noxrecord -noxfixes -noxdamage -display :99 -wait 5 -shared -forever > /tmp/x11vnc.log & disown
sleep 2s; /vnc/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_PORT} > /tmp/novnc_server.log & disown
bash