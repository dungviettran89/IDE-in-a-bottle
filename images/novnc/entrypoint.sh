#!/bin/bash
echo NOVNC_PORT=${NOVNC_PORT}
echo VNC_HOST=${VNC_HOST}
echo VNC_PORT=${VNC_PORT}
/app/novnc/utils/novnc_proxy --listen ${NOVNC_PORT} --vnc ${VNC_HOST}:${VNC_PORT}