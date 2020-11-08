#!/bin/bash
export WIDTH=${WIDTH:-1400}
export HEIGHT=${HEIGHT:-700}
export NOVNC_PORT=${NOVNC_PORT:-6080}
export VNC_PORT=${VNC_PORT:-5999}
export VNC_PASSWORD=${VNC_PASSWORD:-demo}
export LANG=${LANG:-en_GB.UTF-8}
export DISPLAY=:99
echo "WIDTH=${WIDTH}"
echo "HEIGHT=${HEIGHT}"
echo "NOVNC_PORT=${NOVNC_PORT}"
echo "VNC_PORT=${VNC_PORT}"
echo "VNC_PASSWORD=${VNC_PASSWORD}"
echo "LANG=${LANG}"

mkdir -p ~/.vnc/
rm -rf ~/.vnc/*
echo "${VNC_PASSWORD}" | /usr/bin/tigervncpasswd -f > ~/.vnc/passwd

if [ ! -d "~/.fluxbox/" ]; then
  mkdir -p ~/.fluxbox/
  cat <<EOT > ~/.fluxbox/menu
[begin] (fluxbox)
[exec] (Chrome) {/usr/bin/chromium-browser --no-gpu --no-sandbox --disable-dev-shm-usage --disable-web-security} <>
[exec] (Intellij IDEA) {/app/idea*/bin/idea.sh} <>
[include] (/etc/X11/fluxbox/fluxbox-menu)
[end]
EOT
fi

echo "Starting development environment"
/usr/bin/tigervncserver :99 -cleanstale -passwd ~/.vnc/passwd  -nevershared -localhost no -xstartup fluxbox -geometry "${WIDTH}x${HEIGHT}"
tail -f ~/.vnc/*.log &
/app/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_PORT} > /tmp/novnc.log
