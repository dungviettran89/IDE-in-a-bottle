#!/bin/bash
set -e
. ./build.sh
export CONTAINER=ide-in-a-bottle-next
docker rm -f "$CONTAINER" || true
docker run --rm -t --sig-proxy=true \
 --name="$CONTAINER" \
 -p 15900:5900 \
 "$IMAGE"