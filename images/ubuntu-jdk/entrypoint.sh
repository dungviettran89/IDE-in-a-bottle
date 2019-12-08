#!/bin/bash
export HOME=${HOME:-/home/developer}
export TERM=${TERM:-/bin/bash}
export WIDTH=${WIDTH:-1400}
export HEIGHT=${HEIGHT:-700}
export NOVNC_PORT=${NOVNC_PORT:-6080}
export VNC_PORT=${VNC_PORT:-5900}
export VNC_PASSWORD=${VNC_PASSWORD:-demo}
export LANG=${LANG:-en_GB.UTF-8}
export DISPLAY=:99

/usr/bin/Xvfb :99 -screen 0 "${WIDTH}x${HEIGHT}x24" > /tmp/xvfb.log &
sleep 2s; fluxbox &
sleep 2s; /usr/bin/x11vnc -rfbport "${VNC_PORT}" -passwd "${VNC_PASSWORD}" -bg -xkb -noxrecord -noxfixes -noxdamage -display :99  -nevershared -forever > /tmp/x11vnc.log &
sleep 2s; /app/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_PORT} > /tmp/novnc_server.log &
sleep 2s; if [[ -f "/home/developer/startup.sh" ]]; then  chmod +x /home/developer/startup.sh; /home/developer/startup.sh; else echo "You can auto start application by adding a new script at ~/startup.sh"; fi &
bash