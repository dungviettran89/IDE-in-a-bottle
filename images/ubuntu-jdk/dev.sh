#!/bin/bash
set -e
. ./build.sh
export CONTAINER=ide-in-a-bottle-ubuntu-jdk-latest
docker rm -f "$CONTAINER" || true
docker run --rm -it \
 --name="$CONTAINER" \
 -p 15900:5900 \
 "$IMAGE"