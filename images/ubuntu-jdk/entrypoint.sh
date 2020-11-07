#!/bin/bash
#fix permission
chown developer:developer /home/developer
#clean up tigervnc lock
rm -rf /tmp/*-lock
rm -rf /tmp/.X11-unix/
su developer /app/user_entrypoint.sh