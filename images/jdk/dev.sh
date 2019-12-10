#!/bin/bash
set -e
. ./build.sh
export CONTAINER=ide-in-a-bottle-next
docker rm -f "$CONTAINER" || true
docker run --rm -it \
 --name="$CONTAINER" \
 -p 16080:6080 \
 "$IMAGE"