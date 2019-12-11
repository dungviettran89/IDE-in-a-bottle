#!/bin/bash
export WIDTH=${WIDTH:-1400}
export HEIGHT=${HEIGHT:-700}
export NOVNC_PORT=${NOVNC_PORT:-6080}
export VNC_PORT=${VNC_PORT:-5900}
export VNC_PASSWORD=${VNC_PASSWORD:-demo}
export LANG=${LANG:-en_GB.UTF-8}
export DISPLAY=:99
echo "WIDTH=${WIDTH}"
echo "HEIGHT=${HEIGHT}"
echo "NOVNC_PORT=${NOVNC_PORT}"
echo "VNC_PORT=${VNC_PORT}"
echo "VNC_PASSWORD=${VNC_PASSWORD}"
echo "LANG=${LANG}"

keepAlive() {
    while true; do
        $@;
        sleep 10s;
    done
}

/usr/bin/Xvfb :99 -screen 0 "${WIDTH}x${HEIGHT}x24" &
sleep 2s; keepAlive fluxbox &
sleep 2s; keepAlive /usr/bin/x11vnc -rfbport "${VNC_PORT}" -passwd "${VNC_PASSWORD}" -xkb -noxrecord -noxfixes -noxdamage -display :99 -nevershared -forever &
sleep 2s; keepAlive /app/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_PORT} &
sleep 10s;
if [[ -f "/home/developer/startup.sh" ]]; then
    chmod +x /home/developer/startup.sh; /home/developer/startup.sh;
else
    echo "You can auto start application by adding a new script at ~/startup.sh";
fi &
bash