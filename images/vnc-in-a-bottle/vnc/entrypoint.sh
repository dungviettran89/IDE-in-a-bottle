#!/bin/bash
set -e
adduser -h /home/${DESKTOP_USER} -s /bin/bash -D ${DESKTOP_USER} ${DESKTOP_USER}
echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
addgroup sudo
adduser ${DESKTOP_USER} sudo

chmod 775 -R /vnc/
mkdir -p /home/${DESKTOP_USER}
chown -R ${DESKTOP_USER} /home/${DESKTOP_USER}

su ${DESKTOP_USER} ./desktop.sh