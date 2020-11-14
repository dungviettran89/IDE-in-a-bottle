#!/bin/bash
echo "Applying permission fix before switching to developer"
#fix permission
chown developer:developer /home/developer
su developer /app/entrypoint_user.sh