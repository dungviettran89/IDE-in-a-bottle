#!/bin/bash
set -e
. ./build.sh
export CONTAINER=novnc-server
docker rm -f "$CONTAINER" || true
docker run --rm -it \
 --name="$CONTAINER" \
 --network=host \
 "$IMAGE"