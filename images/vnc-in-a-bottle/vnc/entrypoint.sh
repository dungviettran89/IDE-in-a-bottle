#!/bin/bash
set -e
chmod 775 -R /vnc/
adduser -h /home/${DESKTOP_USER} -s /bin/bash -D ${DESKTOP_USER} ${DESKTOP_USER}
mkdir -p /home/${DESKTOP_USER}
chown ${DESKTOP_USER} /home/${DESKTOP_USER}
su ${DESKTOP_USER} ./desktop.sh